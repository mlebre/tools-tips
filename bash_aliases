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

alias kibana="sudo systemctl start kibana"

alias gecko="cd /home/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve gecko"
alias partenaire="cd /home/mlebre/code/gecko && node --max_old_space_size=3056 ./node_modules/.bin/ng serve partenaire"
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

# ============================================
# ENHANCED ALIASES FOR SYMFONY + ANGULAR DEV
# ============================================

# === TESTING SHORTCUTS ===
alias phpunit="./vendor/bin/phpunit"
alias phpunit-coverage="./vendor/bin/phpunit --coverage-html coverage"
alias jest="npm run test"
alias jest-watch="npm run test:watch"
alias ng-test="ng test"
alias ng-test-watch="ng test --watch"
alias ng-e2e="ng e2e"

# === DEPENDENCY MANAGEMENT ===
alias ci="composer install"
alias cu="composer update"
alias ni="npm install"
alias nci="npm ci"
alias nu="npm update"
alias yarn-install="yarn install"
alias yarn-upgrade="yarn upgrade"

# === GIT TEAM WORKFLOW ===
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add ."
alias gc="git commit -m"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gp="git pull"
alias gpu="git push"
alias gf="git fetch"
alias gl="git log --oneline -10"
alias gla="git log --oneline --all --graph -10"
alias git-clean-branches="git branch --merged | grep -v '\\*\\|master\\|main\\|develop' | xargs -n 1 git branch -d"

# === SYMFONY CONSOLE SHORTCUTS ===
alias sf="php bin/console"
alias sf-cache="php bin/console cache:clear"
alias sf-cache-prod="php bin/console cache:clear --env=prod"
alias sf-routes="php bin/console debug:router"
alias sf-container="php bin/console debug:container"
alias sf-migration="php bin/console make:migration"
alias sf-migrate="php bin/console doctrine:migrations:migrate"
alias sf-fixtures="php bin/console doctrine:fixtures:load"
alias sf-schema="php bin/console doctrine:schema:update --force"

# === ANGULAR CLI SHORTCUTS ===
alias ng-build="ng build"
alias ng-build-prod="ng build --prod"
alias ng-serve="ng serve"
alias ng-serve-host="ng serve --host 0.0.0.0"
alias ng-lint="ng lint"
alias ng-lint-fix="ng lint --fix"
alias ng-update="ng update"
alias ng-add="ng add"
alias ng-generate="ng generate"
alias ng-component="ng generate component"
alias ng-service="ng generate service"

# === DEVELOPMENT SERVER MANAGEMENT ===
alias servers-stop="pkill -f 'symfony serve' && pkill -f 'ng serve'"
alias servers-status="ps aux | grep -E '(symfony serve|ng serve)'"

# === CACHE AND CLEANUP ===
alias clear-all-cache="sf-cache && npm run build && echo 'All caches cleared'"
alias cleanup-deps="rm -rf node_modules vendor && ni && ci"
alias cleanup-cache="rm -rf var/cache/* node_modules/.cache .angular/cache"

# === DATABASE OPERATIONS ===
alias db-reset="sf-cache && php bin/console doctrine:database:drop --force && php bin/console doctrine:database:create && sf-migrate && sf-fixtures"
alias db-update="sf-migrate && sf-fixtures"
alias db-backup="mysqldump -u dev -pdev > backup_$(date +%Y%m%d_%H%M%S).sql"

# === LOG VIEWING ===
alias tail-sf="tail -f var/log/dev.log"
alias tail-sf-prod="tail -f var/log/prod.log"
alias tail-nginx="sudo tail -f /var/log/nginx/error.log"
alias tail-apache="sudo tail -f /var/log/apache2/error.log"

# === PERFORMANCE AND DEBUGGING ===
alias memory-usage="ps aux --sort=-%mem | head"
alias disk-usage="df -h"
alias port-check="netstat -tulpn | grep"
alias process-symfony="ps aux | grep symfony"
alias process-node="ps aux | grep node"

# === QUICK NAVIGATION ===
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# === PROJECT SPECIFIC SHORTCUTS ===
alias goto-gecko="cd /home/mlebre/code/gecko"
alias goto-office="cd /home/mlebre/code/office2"
alias goto-godzilla="cd /home/mlebre/code/api-godzilla"

# === DEVELOPMENT QUALITY SHORTCUTS ===
alias fix-permissions="sudo chown -R $USER:$USER . && sudo chmod -R 755 ."
alias check-ports="netstat -tuln"
alias watch-logs="multitail var/log/dev.log /var/log/nginx/error.log"

# === TEAM COLLABORATION ===
alias git-team-status="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n"
alias git-recent="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias git-authors="git log --pretty=format:'%an' | sort | uniq -c | sort -rn"
