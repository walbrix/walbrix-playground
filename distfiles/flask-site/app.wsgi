import sys,os,imp
sys.path.append(os.path.dirname(os.path.abspath( __file__ )))
name = os.path.splitext(os.path.basename(__file__))[0]
fp, pathname, description = imp.find_module(name)
try:
    wsgi_app = imp.load_module(name, fp, pathname, description)
finally:
    if fp: fp.close()
application = getattr(wsgi_app, "app")
