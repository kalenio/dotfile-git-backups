# Backing up dotfiles with Git

## Creating the initial backup

1. Create a folder as a bare git repository to track our configuration files. 
	
	A bare git repository does not have a working directory, i.e. copies of the project's files; instead, it holds only a project's versioning data. Since we only want to track changes made to our config files and won't be editing them directly, we need a bare repo.
	```bash
	git init --bare $HOME/.dotfile-git-backups/
	```

2. Create an alias, `dotfiles`, in the shell configuration file. We will use `dotfiles` instead of the regular `git` command when interacting with our backup repository.  
	```bash
	echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME'" >> $HOME/.bashrc
	```

3. Set the new repository to hide any home directory files that we are not backing up. This way, commands such as `dotfiles status` will only show files we are interested in.
	```bash
	/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME config --local status.showUntrackedFiles no
	```

4. Check that the repository and its alias are properly configured.
	```bash
	dotfiles status
	```

5. Optional: write a shell script of the code, save it to GitHub/GitLab/wherever, then fetch the script with curl and execute it.
	
	If you create your own script, make sure to use a *raw* URL to ensure curl works properly.
	```bash
	curl https://raw.githubusercontent.com/kalenio/dotfile-git-backups/master/setup.sh | /bin/bash
	```
	Breakdown:
	-  **curl:** This is a command-line tool for receiving or sending data using a URL.
	-  **| /bin/bash:** This part is known as a "pipe" (the `|` symbol), which takes the output of the "curl" command and passes it as input to the "bash" shell. In this context, it means that whatever is downloaded from the URL will be executed as if it were a script or a series of commands.
	
	
---

