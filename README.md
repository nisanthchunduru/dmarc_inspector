# dmarc_inspector

Looks up DMARC policy of a domain

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dmarc_inspector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dmarc_inspector

## Usage

To look up dmarc policy of a domain

```ruby
dmarc_inspector = DMARCInspector.new('yahoo.com')
dmarc_inspector.receiver_policy
# => :reject
```

To find more usage examples, see specs
https://github.com/nisanth074/dmarc_inspector/blob/master/spec/dmarc_inspector_spec.rb
