# APIs: An Introduction

## What is an API?

  * API stands for Application Programming Interface.

  * It's a set of rules, code, specifications that software programs use to communicate with one another. 

APIs are all over the place--there is an API from your phone's GPS hardware to any software that accesses it, like an app. There's an API for your computer's operating system that lets you access various system functions, like the time or your printer settings, and on and on. 

You already use an API all the time, which is [the Ruby API](http://ruby-doc.org/stdlib-2.2.2). It determines the set of code and rules that let you interface with the interpreter.

At Launch when we talk about APIs, we're usually referring to web APIs. Tons of the sites you visit rely on APIs to function, or offer APIs so you can borrow their functionality.

## API Data in Action

- Goodreads
  - Uses lots of APIs, most notably Amazon's API for actual [book information](https://www.goodreads.com/book/show/17351332-you-are-not-dead).
- [The Beat](http://sm.rutgers.edu/thebeat/?q=boston)
  - Uses the Instagram and Google Maps APIs to show what's near any given picture.
- Station is a digital communications agency in Zurich that uses the Twitter API to [display tweets](http://station.ch/about/live/) on the wall of their office lobby.
- [HexNa.me](http://hexna.me/)uses the Wordnik API to convert hex color codes into words in English.

## Standardization! REST, JSON

- REST 

AND

- Because of APIs getting standardized, you can hook up to an API very quickly and start writing apps with it
- JSON is one kind of standard that helps with this
- JSON stands for JavaScript Object Notation
- What JSON lets an API do is provide some data in a standardized format
- So what does JSON look like?

## StackOverflow API
- https://api.stackexchange.com/docs
- See all questions and see what the JSON looks like
- BTW, the reason the JSON looks like this is because I have a chrome plugin installed called JSONView. If we didn't have that installed, it would look like this. Go to Chrome Private Window
- Walk through what that JSON looks like
- So how do we get this data?

## HTTParty
- https://github.com/jnunemaker/httparty
- HTTParty is a library that lets us make http requests with Ruby
- Why is that cool?

## A Simple Sinatra App Using the Stack Overflow API
- Let's look at the API data that's coming through, what can we do?
- Tag count

## We can create our own API using the Stack Overflow API
- require 'sinatra/json'
- get '/api/v1/tags'

```ruby
require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'

get '/api/v1/tags' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  json tags
end
```

## Here are some APIs you should check out if you're interested in learning more (which you should be)

- Stack Overflow API
  - [docs link](https://api.stackexchange.com/docs)
- Twilio: SMS/Messaging API. Lets you send SMS/MMS from a server to a phone.
  - [tutorial link](https://github.com/LaunchAcademy/twilio-intro)
- Tradier: Stock Market API
  - [tutorial link](http://vikramis.me/2015/05/10/the-tradier-api-and-historical-stock-data-return-visualization/)
- Instagram: Photo sharing site API, search by location
- Stripe API
- Look into anything you're interested in and see if there's an API available

## Can't find the API you want?
- Make it!