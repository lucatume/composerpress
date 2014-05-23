#ComposerPress

Composer-managed WordPress installation.

## The problem
I need a way to quickly deploy WordPress sites along with my favourite plugins and starter themes, put that site under control to manage it in a controlled and clonable way. To do that I took my inspiration from [an article by Smashing agazine](http://www.smashingmagazine.com/2014/03/07/better-dependency-management-team-based-wordpress-projects-composer/) and created my version of it.

## The solution
Supposing <code>git</code> and <code>composer</code> globally installed already cd to the hosts folder or choice, mine is <code>/www</code>, and create a folder to host the development version of the site
    
    cd /www
    git clone https://github.com/lucatume/composerpress.git local-site

where <code>local-site</code> is a name of your choice then either run <code>install.sh</code>
    
    cd local-site
    chmod +x ./install.sh
    ./install.sh

or manually do what the script would do
    
    rm .git
    composer install
    git init

The folder contains a <code>.gitignore</code> file as well: do not remove as it packs many ignore statements that will allow development and independent tracking of themes and plugins without circular dependency.
Finally set the <code>wp-config.php</code> file according to your hosting solution fo choice.

## Installing and removing themes and plugins
To keep track of themes and plugins installed and removed from the site installation and to allow proper firing of activation, deactivation and uninstallation hooks follow this steps to install

1. add dependency in <code>composer.json</code> require statements
2. run <code>composer update</code>
3. activate the plugin/theme on the site

To uninstall a plugin or theme:

1. deactivate theme or plugin on the site
2. remove the plugin from the site via the admin interface
3. remove dependency from <code>composer.json</code> file
4. run <code>composer update</code>
