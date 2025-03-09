# Development Environment

## Terminal based development

### Tools and libraries used
1. tmux
2. Neovim
3. docker
4. git
5. fzf
6. cht.sh
7. ripgrep
8. zsh-autosuggestions
9. oh-my-zsh
10. node

### Manual Setup on Laptop

0. Install Homebrew
	- Follow instructions from here: https://brew.sh
1. Install git
	- `brew install git`
2. Install Neovim
	- `brew install neovim`
3. Setup nvim configuration file at ~/.config/nvim/. Use the kickstart nvim fork I have.
4. Install tmux
	- `brew install tmux`
5. Install tpm, the tmux plugin manager
	- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
6. Setup tmux configuration file at ~/.config/tmux/tmux.conf. A copy of the configuration file is in this repo.
	- Install tpm and the configurations for tmux by using the C-space + I command. That is C-Space then shift + i.
7. Install oh-my-zsh
	- Follow instructions here: https://github.com/ohmyzsh/ohmyzsh/
8. Install ripgrep (This is needed telescope live grep in neovim)
   	- `brew install ripgrep`
9. Install fzf
	- `brew install fzf`
10. Install zsh-autosuggestions
	- `brew install zsh-autosuggestions`
11. Create a `~/Devenv` folder and copy in the tmux-sessionizer and cht.sh scripts
12. Create a ~/.zshrc file if it does not exist, then replace it with the .zshrc in this repo

    
### Docker Workflow
#### Create Docker Image
If you do not have a docker image locally you will need to create one from the Dockerfile supplied before running the docker compose commands.
1. After copying down the `Dockerfile` and the `compose.yaml` run the following command in the same directory as the `Dockerfile` and `compose.yaml`. 
	- `docker compose build --no-cache`
2. Once that command finishes building you can move onto the next section.

#### Starting up Docker environment
1. Make sure the `Dockerfile` and `compose.yaml` file are in the same folder where your source code is.
2. Run `docker compose up -d`, to build and start the container the first time, `docker compose start` if you already built the container and just need to start it from a stopped state.
3. Run `docker ps` to get the `Container ID` for the container, copy that `Container ID`.
4. Run `docker exec -it <Container ID> bash` or `docker exec -it <Container ID> zsh` to get onto that container and be able to run the code. zsh if using the dockerfiles within dev_containers that have oh-my-zsh installed. bash if using the docker_environments dockerfile.

#### Tearing down the Docker Environment
1. If you are in the container, run the `exit` command to exit the container.
2. Run `docker compose down` to stop and kill the containers.
3. Or run `docker compose stop` if you want to keep the container to restart later. This is the command I will usually run to stop the container, because rebuilding the container each time is a waste.


### Setup on Dev Container
0. Download Docker and git to your machine, git clone the project you want to work on.
1. Pull down the `Dockerfile` and `compose.yaml` files into your project.
2. Follow the above Docker Workflow commands to build your docker image, and start and stop your docker container.



