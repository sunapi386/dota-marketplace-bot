dota-marketplace-bot
====================

Keeps an eye out for gems on the dota.

Individual Botting Procedure
--------------------
1. Refresh page
2. Check the price of the first item in the list
3. If it satisfies the desired price range, click on the buy button, and then the confirm payment button in the popup
4. Repeat from step 1

Windows Installation
--------------------
1. Install cygwin cygwin.com/install.html
2. Install ruby (2.0.0) rubyinstaller.org/downloads/
3. gem install bundler
4. github windows http://github-windows.s3.amazonaws.com/GitHubSetup.exe
5. Optional RubyMine 5.4 https://www.jetbrains.com/ruby/download/
6. Ruby DevKit: https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe

Ubuntu Installation
-------------------
1. `git clone git@github.com:sunapi386/dota-marketplace-bot.git`
2. `bundle install`
3. `ruby MarketBot.rb`
