# MigratorWeb

Web Interface for Rails Migrator.

## Installation

Add this line to your application's Gemfile:

    gem 'migrator_web'

And then execute:

    $ bundle

## Usage

Mount it in your config/routes.rb:
```ruby
mount MigratorWeb::Engine => '/migrator_web'
```

And open it in your brower http://myapp.dev/migrator_web .

## Contributing

1. Fork it ( http://github.com/<my-github-username>/migrator_web/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
