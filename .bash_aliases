#<! Installation !>#
alias pyvim='sudo apt-get install -y vim && \
	apt-get install -y git && \
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	git clone https://Sohum-Mu@bitbucket.org/Sohum-Mu/ark.git ~/ark && \
	cd ~/ark ~/ && \
	cp .vimrc ~/.vimrc'

###BOOT SEQUENCE###
#BOOT
alias start='code && \
	gnome-terminal -x sh -c "cd ~/repos; bash" && \
	gnome-terminal -x sh -c "firefox; bash"'

#ALIAS
alias setalias='vim ~/.bash_aliases'
alias getalias='source ~/.bash_aliases'

########## WORK ##########

####MISC####

###apt utilities###
alias get='sudo apt install'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias fupgrade='sudo apt full-upgrade'
alias purge='sudo apt purge'
alias autorm='sudo apt autoremove'
alias remove='sudo apt remove'

###Python utilities###
alias py='python3'
alias pip='pip3'
#venv, follow with venv path/name
alias venv='python3 -m venv'
alias pipi='pip3 install'
alias pipu='pip3 uninstall'

###Directory utilities###
alias ls='ls -la'
alias search='grep --color=auto'

###git utilities###
alias clone='git clone'
alias status='git status'
alias push='git push'
alias pull='git pull'
alias commit='git commit -m'
alias adda='git add .'
alias gpush='git status && git add . && git commit && git push'
alias switch='git checkout'
alias newb='echo New branch name: && \
	read branchto && \
	echo From branch: && \
	read branchfrom && \
	git checkout -b $branchto $branchfrom && \
	touch $branchto.txt && \
	git add . && \
	git commit -m "Initialising $branchto" && \
	git push --set-upstream origin $branchto'

alias merge='echo Branch to: && \
	read branchto && \
	echo Branch from: && \
	read branchfrom && \
	git checkout $branchto && \
	git merge --no-ff $branchfrom'

####Docker utilities####
###Setup###
alias docker-setup='sudo apt-get remove docker docker-engine docker.io containerd runc && \
    sudo apt-get update && \
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    sudo apt-get update && \
    sudo apt-get install docker-ce docker-ce-cli containerd.io'

alias docker-compose-setup='sudo curl -L "https://github.com/docker/compose/releases/download/1.28/docker-compose-$(uname -s)-$(uname -m)" \ 
	-o /usr/local/bin/docker-compose && \
	sudo chmod +x /usr/local/bin/docker-compose'
###Regular###
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias dcompose='sudo docker compose'
alias compose='sudo docker-compose'
alias dev-up='sudo docker-compose -f docker-compose.yml up'
alias dev-build='sudo docker-compose -f docker-compose.yml up --build'
alias dev-down='sudo docker-compose -f docker-compose.yml down -v'
alias dev-rb='sudo docker-compose -f docker-compose.yml down -v && sudo docker system prune -a && sudo docker-compose -f docker-compose.yml up --build'
alias dlsi='sudo docker image ls'
alias dprune='sudo docker system prune -a'
alias drmi='sudo docker rmi -f'

### RUNNING CONTAINER UPDATE FUNCTIONS
## ROUTES
#main
alias cora-main='cd ~/Documents/github/cora_webapp/app/main && \
	echo File to update: && \
	read file && \
	sudo docker cp ./$file webapp:/app/main/$file'
#users
alias cora-users='cd ~/Documents/github/cora_webapp/app/users && \
	echo File to update: && \
        read file && \
        sudo docker cp ./$file webapp:/app/users/$file'
#analytics
alias cora-analytics='cd ~/Documents/github/cora_webapp/app/analytics && \
	echo File to update: && \
        read file && \
        sudo docker cp ./$file webapp:/app/analytics/$file'
#errors
alias cora-errors='cd ~/Documents/github/cora_webapp/app/errors && \
	echo File to update: && \
        read file && \
        sudo docker cp ./$file webapp:/app/errors/$file'
#posts
alias cora-posts='cd ~/Documents/github/cora_webapp/app/posts && \
	echo File to update: && \
        read file && \
        sudo docker cp ./$file webapp:/app/posts/$file'
#templates
alias cora-templates='cd ~/Documents/github/cora_webapp/app/templates && \
	echo File to update: && \
        read file && \
        sudo docker cp ./$file server:/etc/nginx/html/$file'
#prod
alias cora-prod='cd ~/Documents/github/cora_webapp && \
	sudo docker cp ./prod.py webapp:/app/prod.py'

# Fullpath Update
alias docker-fu='read file && \
	read file2 && \
	read cont &&\
	sudo docker cp $file $cont:/$file2' 
	

####AWS utilities####
###Setup###
alias aws-setup='curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" unzip awscliv2.zip && sudo ./aws/install'
alias aws-update='sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update'
alias aws-get-login-pw='aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 138626108157.dkr.ecr.us-east-1.amazonaws.com'

##Repository###
alias aws-create-repo='aws ecr create-repository --image-scanning-configuration scanOnPush=true --region us-east-1 --repository-name'
alias aws-dtag='docker tag webapp:0.1.8.19 138626108157.dkr.ecr.us-east-1.amazonaws.com/webapp:latest'
alias aws-dpush='docker push 138626108157.dkr.ecr.us-east-1.amazonaws.com/webapp:latest'
alias aws-dpull='docker pull 138626108157.dkr.ecr.us-east-1.amazonaws.com/webapp:latest'

###CLI###
##AWS/Docker##
alias docker-aws-cli-setup='curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh && \
	docker build -t testclilinux -f scripts/Dockerfile-testInstall scripts'
alias docker-aws-cli-remove='sudo rm /usr/local/bin/docker /usr/local/bin/com.docker.cli'
##ECS##
alias ecs-cli-setup='sudo curl -Lo /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest && \
	sudo chmod +x /usr/local/bin/ecs-cli && ecs-cli --version'
alias ecs-cli-remove='sudo rm /usr/local/bin/docker /usr/local/bin/ecs-cli'
##EB##
alias eb-setup='pip install awsebcli --upgrade --user'

###Credentials setting###
##Docker##
alias aws-set-pass='aws ssm put-parameter --name USER --type String --value'
alias aws-set-user='aws ssm put-parameter --name PASSWD --type String --value'


