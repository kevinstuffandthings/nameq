# NameQ ![Build Status](https://github.com/kevinstuffandthings/nameq/actions/workflows/ruby.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/nameq.svg)](https://badge.fury.io/rb/nameq)

For when you need to name things, but not worry about whether or not those names are already taken.

Originally developed for [Simulmedia](https://simulmedia.com).

## Installation
Add this line to your application's Gemfile:

```ruby
# update with the version of your choice
gem 'nameq'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install nameq
```

## Usage

Build a pool of regular text strings. Each time you take an item from the pool, the pool will take note.

```ruby
pool = NameQ::TextPool.new(['Kevin', 'Lynne', 'You', 'You (1)'])

pool.take('Someone Else')
# => "Someone Else"

pool.take('Kevin')
# => "Kevin (1)"

pool.take('You')
# => "You (2)"

pool.take('Kevin')
# => "Kevin (2)"

pool.take('Someone Else')
# => "Someone Else (1)"
```

Or point to a directory. In addition to the `take` behavior mentioned in the `TextPool`, new entries in the specified directory will
be considered on each pool operation.

```ruby
pool = NameQ::Directory.new('/tmp/nameq')

pool.take('not-a-file')
# => 'not-a-file'

pool.take('Rakefile')
# => 'Rakefile (1)'
```

Either type of pool can be treated case-insensitively:

```ruby
NameQ::Directory.new('/tmp/nameq', case_sensitive: false)
```

# Problems?
Please submit an [issue](https://github.com/kevinstuffandthings/nameq/issues).
We'll figure out how to get you up and running with NameQ as smoothly as possible.
