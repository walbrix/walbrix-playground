# -*- coding:utf-8 -*-

import pygame

def render_font_with_wordwrap(font, max_width, text, color):
	fullsize = font.size(text)
	if fullsize[0] <= max_width:
		return font.render(text, True, color)
	estimated_length = len(text) * max_width * 3 / fullsize[0] / 2
	head = 0
	tail = estimated_length
	rendered = []

	while head < tail:
		while font.size(text[head:tail])[0] > max_width:
			tail -= 1
			if head == tail:
				break
		rendered.append(font.render(text[head:tail], True, color))
		head = tail
		tail = min(len(text), head + estimated_length)

	height = 0
	for r in rendered:
		height += r.get_height()

	box = pygame.Surface((max_width, height), pygame.SRCALPHA, 32)
	y = 0
	for r in rendered:
		box.blit(r, (0, y))
		y += r.get_height()
	return box
