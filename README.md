# Tripcode

Ruby implementation of 4chan's tripcode algorithm.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tripcode'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tripcode

## Usage

```ruby
require 'tripcode'

Tripcode.hash('github') # => 'lLf/rxkwg'
Tripcode.secure('github') # => 'qhOg87mFbSndQap'
Tripcode.secure('github','secret') # => 'ND8xVvinnkdyYkC' 
Tripcode.parse('User#password#password') # => ['User', 'ozOtJW9BFA', 'y65WdWQD6Zze1n3']
Tripcode.parse('User#password#password', 'secret') # => ["User", "ozOtJW9BFA", "XGgRxzLJkVB/xA/"] 
```

Or from the terminal

    $ tripcode github
    github -> lLf/rxkwgg

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/justinjensen/tripcode.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

