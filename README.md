## OmniAuth with Authlogic demo
Omniauth is a pretty simple solution if you want your users to authenticate using oauth and openid providers. Here I am using authlogic to manage the user sessions and omniauth to do the external authentication.

## Set up
I have tested this with rails 2.3.11 (rails 2.3.8 gives some issues, sorry can't remember which)    

Unfortunately omniauth doesn't support 2.3.x (according to this [omniauth/issues/244#issuecomment-1055851](https://github.com/intridea/omniauth/issues/244#issuecomment-1055851) ), but there are some workarounds which I have added, refer [changelog](https://github.com/madhums/omniauth-authlogic-demo/compare/v1.0...v2.0)    

    gem install bundler
    git clone git://github.com/madhums/omniauth-authlogic-demo.git
    bundle install
    rake db:migrate
    script/server

**Important :** Dont forget to replace your oauth,openid keys and secret in `config/initializers/omniauth.rb`.    

The demo app is at http://omniauth-authlogic-demo.heroku.com/signin    

In the demo app, after authenticating, in the edit profile, you can associate multiple providers with your account.     

##[Changelog](https://github.com/madhums/omniauth-authlogic-demo/compare/v1.0...v2.0)
