# README

This README would normally document whatever steps are necessary to get the
application up and running.

## rails app setup
```
mkdir lovely-api
cd lovely-api
rbenv local 2.6.2
rbenv rehash
git clone .....
// bundle init
bundle install --path vendor/bundle --jobs=4
// bundle exec rails new . --api -d mysql
```

## mysql setup
```
mysql -u root
  CREATE DATABASE IF NOT EXISTS lovely_api_test DEFAULT CHARACTER SET utf8;
  CREATE DATABASE IF NOT EXISTS lovely_api_development DEFAULT CHARACTER SET utf8;
  // CREATE USER apiservice;
  CREATE USER 'apiservice'@'localhost';
  CREATE USER ''@'localhost';
  GRANT ALL PRIVILEGES ON lovely_api_test.* TO 'apiservice'@'localhost';
  GRANT ALL PRIVILEGES ON lovely_api_test.* TO ''@'localhost';
  GRANT ALL PRIVILEGES ON lovely_api_development.* TO 'apiservice'@'localhost';
  GRANT ALL PRIVILEGES ON lovely_api_development.* TO ''@'localhost';
  exit
mysql lovely_api_development
  show grants;
  exit
mysql -u apiservice lovely_api_development
  show grants;
  exit
ls /var/lib/mysql/mysql.sock
# 上記コマンドでファイルが見つからない場合のみ以下を実行
sudo mkdir -p /var/lib/mysql
sudo ln -s /tmp/mysql.sock /var/lib/mysql/mysql.sock
```

## rails database setup
```
bundle exec rails db:create
```

## rails server set up
```
bundle exec rails server -p 8890
```

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
