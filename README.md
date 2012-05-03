# WorkingMan

WorkingMan is here to help you get started with your work day. He opens the
applications you need as well as any URLs.

## CI Status

[![Build Status](https://secure.travis-ci.org/emachnic/working_man.png)](http://travis-ci.org/emachnic/working_man)

## Installation

Install like normal in your system then start/stop as needed.

    $ gem install working_man

## Configuration

WorkingMan reads applications and URLs from `~/.working_man.yml`. You 
just need to customize it to your needs and then run.

### Example

```yaml
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

You can also specify a different location for your YAML config:

	& working_man -f path/to/config.yml start

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

"THE BEER-WARE LICENSE" (Revision 42):

[emachnic@broadmac.net][1] wrote this file. As long as you retain this notice you can do whatever
you want with this stuff. If we meet some day, and you think this stuff is worth it, you can
buy me a beer in return. 

**Evan B. Machnic**

[1]: mailto:emachnic@broadmac.net