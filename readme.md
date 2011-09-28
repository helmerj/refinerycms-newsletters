# Refinery CMS Newsletters 

Simple newsletters engine for [Refinery CMS](http://refinerycms.com). It does support campaigns, unsubscribe and simple statistic.
It is based on the refinerycms-newsletters engine by paxer (http://github.com/paxer/refinerycms-newsletters).
In this engine the newsltter subscribers are not system users.

It uses a background mailing system so it should easily cope with larger numbers of subscribers.


Refinery CMS Newsletters supports Rails 3.0.x (tested on 3.1.10)

Options:

## Requirements

Refinery CMS version 1.0.x or above.

## Installation

Edit your ``Gemfile`` and add the follwoing line at the bottom of the file:

    gem 'refinerycms-newsletters', '~>1.0', ':git => 'git://github.com/helmerj/refinerycms-newsletters.git'

or clone the engine in your ``Rails.root/vendor/engine`` directory:

    git clone git://github.com/helmerj/refinerycms-newsletters.git

and add the following line to the bottom of your ``Gemfile`` instead:

	gem 'refinerycms-newsletters', '~>1.0', :path => 'vendor/engines'

After including the new engine, run ``bundle install``

In order to install the newsletters plugin into your existing refinerycms application run:

    rails generate refinerycms_newsletters

Last but not least migrate your database:

    rake db:migrate

Enjoy