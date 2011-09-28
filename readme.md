# Refinery CMS Newsletters 

Simple newsletters engine for [Refinery CMS](http://refinerycms.com). It does support campaigns, unsubscribe and simple statistic.
It is based on the refinerycms-newsletters engine by paxer (http://github.com/paxer/refinerycms-newsletters).
However this engine the newsletter subscribers are not system users but are stored in a dedicated table and can be managed
in the refinerycms admin section separately..

It does not use a background mailing system so it might have difficulties coping with larger numbers of subscribers (untested).
Use a local sendmail installation on your production server, or out-source the sending of newsletter to a background service.


Refinery CMS Newsletters supports Rails 3.0.x (tested on 3.1.10)

Options:

## Requirements

Refinery CMS version 1.0.x or above, tested with refinerycms 1.0.8.
the HAMl gem since some views are in haml.

## Installation

Edit your ``Gemfile`` and add the following lines at the bottom of the file:

    gem 'refinerycms-newsletters', '~>1.0', ':git => 'git://github.com/helmerj/refinerycms-newsletters.git'
    gem 'haml'

or clone the engine in your ``Rails.root/vendor/engine`` directory:

    git clone git://github.com/helmerj/refinerycms-newsletters.git

and add the following lines to the bottom of your ``Gemfile`` instead:

	gem 'refinerycms-newsletters', '~>1.0', :path => 'vendor/engines'
    gem 'haml'

After including the new engine and the haml gem, run ``bundle install``

In order to install the newsletters plugin into your existing refinerycms application run:

    rails generate refinerycms_newsletters

Last but not least migrate your database:

    rake db:migrate

This will create all the necessary tables and initial refinerycms pages in English and German.

## Use

To subscribe to the newsletter service, link to the sign-up form:

    /newsletter_subscription

Edit the Rails.root/vendor/engines/newsletter/app/mailers/newsletter_subscription_mailer.rb file
to make required changes, like changing the :from email address. that is used to send the activation email.
User have to click the activation link provided to them in the email. The security token in the link will
authorize the subscriber and activate the subscription.

User can unsubscribe using the following link which you could include in every newsletter.

Enjoy

TODO:
 # add some basic content for new pages
 # add unsubscribe form to allow users to provide their email address for un-subscription.
 # convert al views to haml
 # add rspec tests
