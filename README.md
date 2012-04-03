# WorkingMan

WorkingMan is here to help you get started with your work day. He opens the
applications you need as well as any URLs.

## Installation

Install like normal in your system then start/stop as needed.

    $ gem install working_man

## Configuration

WorkingMan reads applications and URLs from `~/.working_man.yml`. You 
just need to customize it to your needs and then run.

### Example

```
# Default applications for startup and shutdown.
# Add/remove applications to customize
apps:
  - 'Google Chrome'
  - 'Briquette'
  - 'Skype'

# URLs open in default browser
urls:
  - 'http://www.google.com'
```

## Usage

To start your work day, run the following:

    $ working_man start
    
After you're finished with work, run:

    $ working_man stop

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
