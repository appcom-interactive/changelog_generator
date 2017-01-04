# GitChangelogGenerator

This gem creates a changelog file based on your git version history. The output is categorized by tags. Even if no tags
are available in the repository the gem will still work using the HEAD as virtual tag.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_changelog_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_changelog_generator

## Usage

Just run the following command in a directory maintained by git

```
chlog create [filename]
```

where filename is the filename of the created file. If no argument is specified the file will be created under `changelog.txt`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/git_changelog_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

