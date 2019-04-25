# README

# Welcome to the squadsnap wiki!

The #2 sports team management app that makes communication and organization a breeze.

## Notes
* Keep note of Web Development Roadmaps ([2019](https://github.com/kamranahmedse/developer-roadmap), [2018](https://codeburst.io/the-2018-web-developer-roadmap-826b1b806e8d)) to paint a more clearer picture of the web stack.

## Journal
You can find a journal with a list of notes or other learning efforts [here](https://github.com/weteamsteve/squadsnap/wiki/Journal).

## Squadsnap
* [The Ultimate Intermediate Ruby on Rails Tutorial: Lets Create an Entire App!](https://medium.freecodecamp.org/lets-create-an-intermediate-level-ruby-on-rails-application-d7c6e997c63f)
  * [Action Controller Overview](https://guides.rubyonrails.org/action_controller_overview.html) - Action Controller is the C in MVC. After the router has determined which controller to use for a request, the controller is responsible for making sense of the request, and producing the appropriate output. Luckily, Action Controller does most of the groundwork for you and uses smart conventions to make this as straightforward as possible.
    * `rails g controller pages`
  * Bootstrap Sass - Sass is the most mature, stable, and powerful professional grade CSS extension language in the world.
    * gem '[bootstrap-sass](https://sass-lang.com/)'
  * jQuery with Rails
    * gem '[jquery-rails](https://github.com/rails/jquery-rails)'
  * [Bootstrap's Navigation Bar Component](https://getbootstrap.com/docs/3.3/components/#navbar)
    * Store navigation bar inside of a [partial template](https://guides.rubyonrails.org/layouts_and_rendering.html#using-partials). For partials we use an underscore prefix
    * [Bootstrap Grid](https://getbootstrap.com/docs/3.3/css/#grid)
  * Authentication with [Devise Gem](https://github.com/plataformatec/devise)
    * [Devise Documentation](https://github.com/plataformatec/devise/wiki)
    * Double check the manual setup instructions after doing `rails generate devise:install` to configure mailers after (???)
  * Models
    * [Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html)
    * [Active Model Basics](https://guides.rubyonrails.org/active_model_basics.html)
    * `rails generate devise User`
    * `rails db:create`
    * `rails db:migrate`
    * `rails generate devise:views`
  * Schema changes and migrations
    * [Active Record Migrations](http://guides.rubyonrails.org/active_record_migrations.html)
    * Add `t.string :name,               null: false, default: ""` to `squadsnap/db/migrate/*CREATION_DATE*_devise_create_users.rb` and then run `rails db:drop`, `rails db:create` and `rails db:migrate`
    * To be able to send an extra attribute, so the Devise controller would accept it, we’ve to do some changes at the controller level. We can do changes to Devise controllers in few different ways. We can use devise generator and generate controllers. Or we can create a new file, specify the controller and the methods that we want to modify. Both ways are good. We are going to use the latter one. Navigate to app/controllers and create a new file registrations_controller.rb, then override Devise::RegistrationsController to accept the :name attribute.
  * [CSS Media Queries](https://www.w3schools.com/css/css_rwd_mediaqueries.asp) - adding `squadsnap/assets/stylesheets/desktop.scss` and `.../mobile.scss` for their respective media attributes.
    * [x] 🐞 Getting a bug in branch `authentication`: `Sass::SyntaxError in Pages#index` as shown in this [screenshot](http://weteamsteve.com/stuff/images/sass_syntaxerror.png).
  * Up to the point in the [tutorial](https://medium.freecodecamp.org/lets-create-an-intermediate-level-ruby-on-rails-application-d7c6e997c63f) at the **Helpers** part
