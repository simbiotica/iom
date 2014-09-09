# Welcome to NGOAIDMAP

NGOAIDMAP is a website available at http://ngoaidmap.org/. It was a custom development done initially by Vizzuality (vizzuality.com) for Interaction (interaction.org). The application consist of a database of projects. Those projects get aggregated to create Sites, for example http://foodsecurity.ngoaidmap.org/ or http://haiti.ngoaidmap.org/

It is probably a very specific application to be used directly, but the ideas and code behind it might be applicable for other people needs. If you have questions on how to use contact@vizzuality.com

## Database structure 

NGOAIDMAP is a project that allows you to create websites about projects around a certain topic. For example haiti or foodsecurity. 

The database consist of 4 main tables (and many supporting tables): "projects" done by "organizations" funded by "donors" which are included in different "sites".

Take a look at the database schema at db/db_schema.pdf to get a better idea of what the project does.

## Requirements

NGOAIDMAP is a Ruby on Rails application. The dependencies are:

 * Ruby 1.8.7
 * PostgreSQL 9.2 or higher.
 * Postgis 2.X+
 * Bundler 
 * RVM

## Installation

 * ```git clone git://github.com/Nightsprout/iom.git```
 * ```cd iom```
 * follow any RVM prompts if any
 * ```bundle install```
 * edit config/database.yml
 * ```cp config/app_config.yml.sample config/app_config.yml```
 * edit config/app_config.yml if necessary
 * ```rake db:iom_reset```

### Install Errors

There seems to be a consistent error with rake db:seed in the rake db:iom_reset process.  This is probably related to Ruby 1.8.7.  If that fails, run ```rake db:seed``` separately, and then run ```rake iom:data:load_adm_levels iom:data:load_orgs iom:data:load_projects```.

