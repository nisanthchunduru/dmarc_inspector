# dmarc_inspector

A ruby gem to look up the DMARC policy of any domain

## Usage

To look up DMARC policy of a domain

```ruby
dmarc_inspector = DMARCInspector.new('yahoo.com')
dmarc_inspector.receiver_policy
# => :reject
```

For more usage examples, see the specs
https://github.com/nisanth074/dmarc_inspector/blob/master/spec/dmarc_inspector_spec.rb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dmarc_inspector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dmarc_inspector

## Understanding DMARC

Read [Wikipedia's article on DMARC](https://en.wikipedia.org/wiki/DMARC) or [Postmark's post on DMARC](http://support.postmarkapp.com/article/892-what-is-dmarc) to quickly gain an idea of the DMARC specification.

If you've some time, I highly recommend reading [RFC 7489](https://tools.ietf.org/html/rfc7489) to understand the DMARC specification fully. [RFC 7489](https://tools.ietf.org/html/rfc7489) is relatively short compared to most RFCs.
