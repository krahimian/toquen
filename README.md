# Toquen

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'toquen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toquen

## Usage

Create Capfile:
       require 'toquen'

Then:
	cap toquen:install

Then edit config/deploy.rb and set everything.

Additional options:

Toquen.config.aws_roles_extractor = lambda { |inst| (inst.tags["Roles"] || "").split }


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
