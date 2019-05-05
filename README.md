# README

# Welcome to the squadsnap app

The #2 sports team management app that makes communication and organization a breeze.

## Notes
* Keep note of Web Development Roadmaps ([2019](https://github.com/kamranahmedse/developer-roadmap), [2018](https://codeburst.io/the-2018-web-developer-roadmap-826b1b806e8d)) to paint a more clearer picture of the web stack.

## Journal
You can find a journal with a list of notes or other learning efforts [here](https://github.com/weteamsteve/squadsnap/wiki/Journal).

## Squadsnap
  * Fix production url for heroku
  * Create models for team and membership (relationship of users to teams, so a team can have many users and a user can have many teams)
  * `rails g model team name:string sport:string`
  * `rails g model member user:references team:references position:string number:string membership:string`
  * Member can have flags that say what they are on the team (owner, manager, player, etc)
  * How do you join a team. Can you click you want to join a team, then the membership is created? Is it password authenticated? The password has to match what the team password is, this would need to be a generated model.
    * Find team, request to join team, send email to owner ([ActionMailer](https://guides.rubyonrails.org/action_mailer_basics.html)) to approve request, then hes a member
  * Should we move find a team to the top, conditional, if we have a team show the team drop down. If we don't, show find a team.
  * Generate team with scaffolding, so it has CRUD implementations created
    * `rails generate scaffold team name:string sport:string`
    * 🐞 `Caused by: PG::DuplicateTable: ERROR:  relation "teams" already exists` while doing migration,
      * Going to try to fix by going into postgres and doing `rename_table :teams, :teams2`
      * Killed all postgres processes, restarted postgres, added the drop_table before create_table and did drop_table in postgres also, basically doing everything in my power to purge it. Then made teams and it worked
  * Rename scaffold to squads. We're not Teamsnap here, we're squadsnap! WOO
  * Reference [bootswatch](https://bootswatch.com/) for bootstraps themes, use them for styling page
  * This YouTube tutorial [Ruby on Rails from 0 to Deploy in 60 mins](https://youtu.be/86P3hX05QXI?t=1973)
 has information about styling the view page
  * If logged in, display teams we are member of, which would each be a partial
  * If not part of a team, display create a new team page
  * This is in view/squads/_form.html.erb
  * Follow `rails g migration add_c_to_books c:date` to add `owner` column to squad
    * `rails g migration add_owner_to_squads owner:references`
    * 🐞 Should this be a reference to a `user`? should it be `user.id`?
    * So a `squad` will have an `owner` (reference to a user). then i will query all `member` table to see who is a member of the team for the roster
    * `add_reference :squads, :owner, index: true, foreign_key: { to_table: :users }`
  * Request team owner to join team
    * Send email to owner ([ActionMailer](https://guides.rubyonrails.org/action_mailer_basics.html)) to approve request, then hes a member
  * View squads should show owner, members
