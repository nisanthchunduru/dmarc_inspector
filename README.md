# dmarc_inspector

A ruby gem to look up the DMARC policy of any email service provider

## Usage

To look up the DMARC policy of an email service provider, say yahoo.com, use

```ruby
dmarc_inspector = DMARCInspector.new('yahoo.com')
dmarc_inspector.receiver_policy
# => :reject
```

If an email service provider doesn't have a DMARC policy, the `DMARCInspector#receiver_policy` method returns `:none`

See [this spec](https://github.com/nisanth074/dmarc_inspector/blob/master/spec/dmarc_inspector_spec.rb) for more examples

## Installation

Add  dmarc_inspector to your app's Gemfile

```ruby
gem 'dmarc_inspector'
```

and run

```
bundle install
```

## Understanding DMARC

[Wikipedia's article on DMARC](https://en.wikipedia.org/wiki/DMARC) and [Postmark's post on DMARC](http://support.postmarkapp.com/article/892-what-is-dmarc) are great articles to quickly understand DMARC.

To understand DMARC in entirety, I highly recommend reading [RFC 7489](https://tools.ietf.org/html/rfc7489). Its relatively short compared to most RFCs.
