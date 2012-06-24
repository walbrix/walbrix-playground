#!/usr/bin/python
# -*- coding:utf-8 -*-

import re
import urllib
import urllib2
from xml.etree import ElementTree
import iso8601
import time

def parse_atom(atom, mode):
	entries = []
	for entry in atom.findall("{http://www.w3.org/2005/Atom}entry"):
		e = {}
		id = entry.findtext("{http://www.w3.org/2005/Atom}id")
		if mode == "search":
			id = id.split(":")[2]
		else:
			id = id.split("/")[5]
		e["id"] = long(id)
		title = entry.findtext("{http://www.w3.org/2005/Atom}title")
		if mode != "search":
			(userid, title) = title.split(": ", 1)
			e["userid"] = userid
			e["username"] = entry.findtext("{http://www.w3.org/2005/Atom}author/{http://www.w3.org/2005/Atom}name")
		else:
			userid = entry.findtext("{http://www.w3.org/2005/Atom}author/{http://www.w3.org/2005/Atom}name")
			(userid,username) = userid.split(" (", 1)
			e["userid"] = userid
			e["username"] = username[:-1]

		e["title"] = title
		e["time"] = int(time.mktime(iso8601.parse_date(entry.findtext("{http://www.w3.org/2005/Atom}published")).timetuple()))
		links = entry.findall("{http://www.w3.org/2005/Atom}link")
		for link in links:
			rel = link.get("rel")
			if rel == "alternate":
				e["alternate"] = link.get("href")
			elif rel == "image":
				e["image"] = link.get("href")
		entries.append(e)
	return entries

def list(user_id, list_name, since_id = None):
	query = {}
	if since_id != None: query["since_id"] = since_id
	atom = urllib2.urlopen("http://api.twitter.com/1/%s/lists/%s/statuses.atom?" % (user_id, list_name) + urllib.urlencode(query))
	entries = parse_atom(ElementTree.parse(atom), "list")
	atom.close()
	return entries

def search(keyword, since_id = None):
	query = { "q":keyword.encode("utf-8") }
	if since_id != None: query["since_id"] = since_id

	atom = urllib2.urlopen("http://search.twitter.com/search.atom?" + urllib.urlencode(query))
	entries = parse_atom(ElementTree.parse(atom), "search")
	atom.close()
	return entries

def main():
	entries = search(u"ひだまり", 1)
	for entry in entries:
		print entry["time"]
		print entry["title"].encode('utf_8')

if __name__ == "__main__":
    main()

