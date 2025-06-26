alias goazansible='ssh az-too-ansible'
alias goazchkapi='ssh az-chk-api'
alias goazchkgecko='ssh az-chk-gecko'
alias goazchkoffice='ssh az-chk-office'
alias goazchkmongo='ssh az-chk-dbmongo'
alias goazbiggymaster='ssh az-too-biggy-master'
alias goazbiggyslave1='ssh az-too-biggy-slave-01'
alias goazbiggyslave2='ssh az-too-biggy-slave-02'
alias goazprdsftp='ssh az-prd-sftp'
alias goazprdapi1='ssh az-prd-api-01'
alias goazprdapi2='ssh az-prd-api-02'
alias goazprdapi3='ssh az-prd-api-03'
alias goazprdapi4='ssh az-prd-api-04'

alias goazprdoffice1='ssh az-prd-office-01'
alias goazprdoffice2='ssh az-prd-office-02'
alias goazprdgecko1='ssh az-prd-gecko-01'
alias goazprdgecko2='ssh az-prd-gecko-02'
alias goazprdmongo='ssh az-prd-dbmongo'

alias builder="/home/mlebre/code/obilder/bin/builder.sh"
alias bf="builder forecast"
alias switchFastPass="builder switch api-godzilla master -l && builder switch api-carte-cadeau master -l && builder switch bunny master -l && builder switch office2 master -l && builder switch emailing-synchro master -l && builder switch partner-area master -l"

alias git-edit="git commit --amend --no-edit --allow-empty && git push --force-with-lease"
alias git-push-force="git push --force-with-lease"
alias git-squash="/home/mlebre/automaticRebase.sh"
alias git-master="/home/mlebre/gitRebaseMaster.sh"

alias syntaxCode="bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php"
alias lintCore="node --max_old_space_size=4096 ./node_modules/.bin/ng lint core --fix"
alias lintGecko="node --max_old_space_size=4096 ./node_modules/.bin/ng lint gecko --fix"
alias lintAxa="node --max_old_space_size=4096 ./node_modules/.bin/ng lint axabe --fix"

alias updateMega="composer update obiz-concept/mega-bundle" 
alias updateAlerting="composer update obiz-concept/alerting-bundle"
alias updateObiz="composer update obiz-concept/mega-bundle obiz-concept/alerting-bundle:dev-master"

alias mergeMegaMaster="nano composer.json && updateMega && git add . && git-squash && git push -f"

alias git-squash="/home/mlebre/automaticRebase.sh"

alias kibana="sudo systemctl start kibana"

alias gecko="cd /home/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve gecko"
alias partenaire="cd /home/code/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve partenaire"
alias axabe="cd /home/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve axabe"
alias laposte="cd /home/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve lapostepro"

alias godzilla="cd /home/mlebre/code/api-godzilla && symfony serve"

alias office="cd /home/mlebre/code/office2/back &&  symfony serve"
alias officeFront="cd /home/mlebre/code/office2/front &&  node --max-old-space-size=4056 ./node_modules/.bin/ng serve"
alias gulp="cd /home/mlebre/code/office2/front && node ./node_modules/.bin/gulp build"

alias vpn="sudo openfortivpn -c /home/mlebre/.vpn_config" 

alias loadFixtures="/usr/bin/php8.2 /home/mlebre/code/bunny/bin/console hautelook:fixtures:load --purge-with-truncate -m default -e obiz --no-interaction"

alias sql="mysql -u dev -pdev < /home/mlebre/setupSql.sql"
alias sshChecking="ssh -N obiz_marianne_lebre@obiz-az-too-ansible-vmtmilup.francecentral.cloudapp.azure.com -L 3307:obiz-chk-dbmysql-core-fs.mysql.database.azure.com:3306"

alias testChromium="CHROME_BIN='/usr/bin/chromium'"

alias burndown="/home/mlebre/code/mondayz/bin/console mondayz:get-burndown-value"
alias checkSpm="/home/mlebre/code/mondayz/bin/console mondayz:check-spm"
alias lockOrder="/home/mlebre/code/mondayz/bin/console mondayz:update-order"
alias prodImmo="python3 monday-reporting.py"
