#!/usr/bin/python
# -*- coding:utf-8 -*-

import time
import threading
import StringIO
import datetime
import pygame
import urllib2
from pygame.locals import *

import pygamehelper
import twitter

pygame.init()

screen = pygame.display.set_mode((640,480))

pygame.mouse.set_visible(False)

clock = pygame.time.Clock()
frame_rate = 30

background = pygame.image.load("background.png")
character = pygame.image.load("character.png").convert_alpha()
font = pygame.font.Font("HuiFontP29.ttf", 28)
clock_font = pygame.font.Font("VL-PGothic-Regular.ttf", 24)
fps_font = pygame.font.Font("VL-PGothic-Regular.ttf", 12)
header_bk = pygame.Surface((450,24), pygame.SRCALPHA,32)
for i in range(0,24):
	pygame.draw.line(header_bk, (178,155,172,128-i*5), (0,i),(450,i))

if pygame.joystick.get_count() > 0:
	pygame.joystick.Joystick(0).init()

offset = 0
scrolling_images = []
lock = threading.Lock()

image_cache = {}

turbo_mode = 0

dow = [u"月",u"火",u"水",u"木",u"金",u"土",u"日"]

def process_event(event = None):
	if event == None:
		events = pygame.event.get()
		if events != None:
			for event in events:
				ret = process_event(event)
				if ret == False: return False
		return True

	global turbo_mode

	if event.type == pygame.QUIT: return False

	if event.type == pygame.locals.JOYBUTTONDOWN and event.button == 1:
		return False
	elif event.type == pygame.locals.KEYDOWN and event.key == pygame.locals.K_ESCAPE:
		return False
	elif event.type == pygame.locals.JOYBUTTONDOWN and event.button == 0:
		turbo_mode += 1
	elif event.type == pygame.locals.KEYDOWN and event.key == pygame.locals.K_RETURN:
		turbo_mode += 1
	elif event.type == pygame.locals.JOYBUTTONUP and event.button == 0 and turbo_mode > 0:
		turbo_mode -= 1
	elif event.type == pygame.locals.KEYUP and event.key == pygame.locals.K_RETURN and turbo_mode > 0:
		turbo_mode -= 1

	return True

def get_total_scrolling_images_height(scrolling_images):
	height = 0
	for si in scrolling_images:
		height += si["img"].get_height()
	return height

def draw_clock(surface):
	d = datetime.datetime.today()
	date = clock_font.render(u"%d月%d日(%s)" % (d.month,d.day,dow[d.weekday()]), True, (0,0,0))
	time = clock_font.render("%02d:%02d:%02d" % (d.hour,d.minute,d.second), True, (0,0,0))

	surface.blit(date, (450 + (190 - date.get_width()) / 2, 20))
	surface.blit(time, (450 + (190 - time.get_width()) / 2, 50))

def draw_frame():
	global offset, turbo_mode
	screen.blit(background, (0,0))

	draw_clock(screen)

	lock.acquire()
	try:
		if scrolling_images == None or len(scrolling_images) == 0: return
		top = 480 - offset
		i = 0
		len_si = len(scrolling_images)
		while top < 480 and len_si > i:
			img = scrolling_images[i]["img"]
			screen.blit(img, (10, top))
			top += img.get_height()
			i += 1
		
		if i - 1 < len_si:
			# スクロール量を計算する
			ts = get_average_time_span(scrolling_images)
			height = get_total_scrolling_images_height(scrolling_images)
			y1 = height / len(scrolling_images)
			if ts > 0 and turbo_mode == 0:
				doffset = max(1, y1 / ts / clock.get_fps())
			else:
				doffset = 10

			offset += doffset
			if offset > height: offset = height
			while offset > 480 + scrolling_images[0]["img"].get_height():
				offset -= scrolling_images[0]["img"].get_height()
				del scrolling_images[0]
	finally:
		lock.release()
		screen.blit(character, (screen.get_width() - character.get_width(), screen.get_height() - character.get_height()))
		screen.blit(fps_font.render("%dfps" % clock.get_fps(), True, (0,0,0)), (600,460))
		pygame.display.update()

def render_entry(entry):
	user_image = None
	image = entry["image"]
	if image in image_cache: user_image = image_cache[image]["image"]
	else:
		try:
			user_image = pygame.image.load(StringIO.StringIO(urllib2.urlopen(image).read())).convert_alpha()
		except:
			user_image =  pygame.Surface((48, 48))
		user_image_size = max(user_image.get_width(), user_image.get_height())
		if user_image_size > 48:
			user_image = pygame.transform.rotozoom(user_image, 0, 48 / user_image_size)
		#image_cache[image] = {"image":user_image}

	name = font.render("%s(%s)" % (entry["userid"],entry["username"]), True, (0,0,0))
	text = pygamehelper.render_font_with_wordwrap(font, 450, entry["title"], (0,0,0))

	img = pygame.Surface((450, user_image.get_height() + text.get_height() + 10),pygame.SRCALPHA, 32)
	img.blit(header_bk, (0,0))
	img.blit(user_image, (0,0))
	img.blit(name, (user_image.get_width() + 3, (user_image.get_height() - name.get_height()) / 2))
	img.blit(text, (0, user_image.get_height()))
	
	return img

def get_average_time_span(scrolling_images):
	if len(scrolling_images) < 2: return None
	t = scrolling_images[0]["time"]
	sum = 0
	for si in scrolling_images[1:]:
		time = si["time"]
		sum += time - t
		t = time
	return sum / (len(scrolling_images) - 1)

def read_twitter(keyword):
	latest_id = 1
	while scrolling_images != None:
		try:
			entries = twitter.search(keyword, latest_id)
			#entries = twitter.list("shimariso", "subcul", latest_id)
			entries.reverse()
			for entry in entries:
				img = render_entry(entry)
				if img != None:
					lock.acquire()
					scrolling_images.append({"time":entry["time"],"img":img})
					lock.release()
				if latest_id < entry["id"]: latest_id = entry["id"]
		except Exception, e:
			print "Exception(%s)" % (e)
			
		lock.acquire()
		ts = get_average_time_span(scrolling_images)
		if ts == None: ts = 1
		#print "Number of buffered tweets = %d, avg=%d" % (len(scrolling_images), ts)
		lock.release()

		time.sleep(min(30,max(3,ts)))

if __name__ == "__main__":
	thr = threading.Thread(target=read_twitter, args=(u"#followmejp",))
	thr.start()

	while True:
		clock.tick(frame_rate)
		if not process_event():
			pygame.quit()
			break
		draw_frame()

	scrolling_images = None

	exit(0)
