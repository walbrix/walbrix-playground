#!/usr/bin/ruby
require 'yaml'
require 'mysql2'
require 'digest/sha1'

dbconfig = YAML::load(File.open("/var/www/localhost/htdocs/config/database.yml"))["production"]

dbname = dbconfig["database"]
username = dbconfig["username"]
dbpassword = dbconfig["password"]
host = dbconfig["host"]

if host == nil then
  host = 'localhost'
end

client = Mysql2::Client::new(:host=>host, :username=>username, :password=>dbpassword, :database=>dbname)

login = gets.strip
password = gets.strip

stmt = client.query("select hashed_password,salt from users where type='User' and login='#{client.escape(login)}'").each { |row|
  hashed_password = row["hashed_password"]
  salt = row["salt"]
  exit(2) if hashed_password == nil || salt == nil
  exit(1) if Digest::SHA1.hexdigest(salt+Digest::SHA1.hexdigest(password)) != hashed_password
  exit(0)
}
exit(2)
