# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias pstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Projects"

# Laravel
alias serve="php artisan serve"
alias art="php artisan"
alias phpunit="./vendor/bin/phpunit"
alias a="php artisan"
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# PHPUnit
alias p="./vendor/bin/phpunit"
alias pf="./vendor/bin/phpunit --filter"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias php74="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:7.4"
alias php8="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:8.0"
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"


# Docker
alias docker-composer="docker-compose"

# Git
alias gs="git status"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias ck="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="git commit -am $get_work_branch WIP"


get_work_branch () {
	ref=$(git symbolic-ref -q HEAD) \
	|| report_soft_error "git-wip requires a branch"


	branch=${ref#refs/heads/}
	if [ $branch = $ref ] ; then
		die "git-wip requires a local branch"
	fi

	echo $branch
}


alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias cd..="cd .."

function mkcd ()
{
  take "$a"
}

function fixMacUsedFile(){
 SetFile -c "" -t "" "$1"
}

#React native
alias rncache="watchman watch-del-all && rm -rf $TMPDIR/react-native-packager-cache-* && rm -rf $TMPDIR/metro-bundler-cache-* && rm -rf node_modules/ && npm cache clean && npm install && npm start -- --reset-cache"

# Databases
alias mysqlstart="cd $HOME/Projects/mysql8 && docker-compose up -d && cd -"
alias startmysql="mysqlstart"
alias mysqlstop="cd $HOME/Projects/mysql8 && docker-compose down && cd -"
alias psqlstart="cd $HOME/Projects/postgres && docker-compose up -d && cd -"
alias psqlstop="cd $HOME/Projects/postgres && docker-compose down && cd -"

function cala(){
    mysqlstart
    cd "$HOME/Projects/Calibre/calibre_laravel"
    php artisan serve
   # cd -
}
