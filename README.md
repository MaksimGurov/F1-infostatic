# Application create in Ruby on Rails

Web App to get Formula 1 statistics and current season information.
Special thanks to Ergast Developer API for the data.

Взяты новости из: https://www.f1news.ru/news/f1-5599.html
Экспорт новостей в формате RSS

    ruby "2.7.2"
    "rails", "~> 7.0.3"
    
    group :production do
      gem 'pg'
      gem 'rails_12factor'
    end