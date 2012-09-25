#!/usr/bin/ruby
require 'yaml'
require 'mysql'
require 'digest/sha1'

dbconfig = YAML::load(File.open("/var/www/localhost/htdocs/config/database.yml"))["production"]

dbname = dbconfig["database"]
username = dbconfig["username"]
dbpassword = dbconfig["password"]
host = dbconfig["host"]

if host == nil then
  host = 'localhost'
end

client = Mysql.connect(host, username, dbpassword, dbname)

login = gets.strip
password = gets.strip

stmt = client.prepare("select hashed_password,salt from users where type='User' and login=?")
stmt.execute(login).each { |hashed_password, salt|
  exit(2) if hashed_password == nil || salt == nil
  exit(1) if Digest::SHA1.hexdigest(salt+Digest::SHA1.hexdigest(password)) != hashed_password
}
