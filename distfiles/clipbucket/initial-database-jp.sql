update cb_config set value='9' where name='default_time_zone';
update cb_config set value='JP' where name='default_country_iso2';
update cb_users set country='JP' where userid=1;
