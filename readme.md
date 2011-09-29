# Refinery CMS Newsletters 

Simple newsletters engine for [Refinery CMS](http://refinerycms.com) from [webnow](http://web-now.de). It is based on the
refinerycms-newsletters engine by paxer (http://github.com/paxer/refinerycms-newsletters).

## Features

1.  HTML newsletter campaigns

2.  Newsletter subscribers are not system users. The subscribers are stored in a dedicated table and can be managed in the refinerycms admin section separately.

3.  Newsletters are send out as HTML emails:
    -   rendered as raw HTML, so all features of the HTML Editor are supported (In case you include customs styles as classes, add them to the style section in the mailer template's header)
    -   relative image paths are converted to remote HTML calls to the server, you can include images into your HTML newsletters

4.  simple statistics

5.  double-opt-in subscription

6.  one-click unsubscription


The engine does not use a background mailing system so it most likely will have difficulties coping with larger numbers of subscribers (untested).
Use a local sendmail installation on your production server, or out-source the sending of newsletter to a background service.


Refinery CMS Newsletters supports Rails 3.0.x (tested on 3.1.10)


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

User can unsubscribe using the following link which you could include in every newsletter:

    unsubscribe_newsletter_subscription(@subscriber.token)

where token is the subscribers personal security token


Enjoy

##TODO:

-   add some basic content for new pages

-   add unsubscribe form to allow users to provide their email address for un-subscription.

-   add rspec tests
