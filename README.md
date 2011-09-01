Guard::Pow [![travis-ci](http://travis-ci.org/guard/guard-pow.png)](http://travis-ci.org/guard/guard-pow)
=============

Pow guard allows to automatically & intelligently restart your applications (just by touching tmp/restart.txt)

* Tested on Ruby 1.8.7, 1.9.2, ree, rbx & jruby

Install
-------

Please be sure to have [Guard](https://github.com/guard/guard) installed before continue.

Install the gem:

    $ gem install guard-pow

Add it to your Gemfile (inside development group):

``` ruby
gem 'guard-pow'
```

Add guard definition to your Guardfile by running this command:

    $ guard init pow

Usage
-----

Please read [Guard usage doc](https://github.com/guard/guard#readme)

Guardfile
---------

Pow guard can be really be adapated to all kind of projects.
Please read [Guard doc](http://github.com/guard/guard#readme) for more info about Guardfile DSL.

### Rails app

``` ruby
guard 'pow' do
  watch('.powrc')
  watch('.powenv')
  watch('.rvmrc')
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
end
```

### List of available options:

``` ruby
:restart_on_start => true   # Restart Pow on Guard start, default: false
:restart_on_reload => false # Restart Pow on Guard reload, default: true
```

Development
-----------

* Source hosted at [GitHub](https://github.com/guard/guard-rspec)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/guard/guard-rspec/issues)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change
you make.

Author
------

[Thibaud Guillaume-Gentil](https://github.com/thibaudgg)