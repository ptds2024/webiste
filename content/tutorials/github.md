+++
title = "Git(hub) setup"
date = 2023-09-05T13:10:39+02:00
weight = 5
+++

## Installing and setting up Git, GitHub, and a Git GUI

In this section we will install a distributed version-control system Git, register a new user at GitHub and connect them together.

### 1. Installing and setting up Git

-   Download Git installer from [git website](https://git-scm.com/) by clicking on "Download for Windows" or "Download for macOS" button, automatically detected for your machine.
-   Open the downloaded file and follow the proposed steps
-   Configure your Git to let it know who you are. Do it by opening a command prompt or Terminal window on your computer and set "Your Name" and "[your_email\@unil.ch](mailto:your_email@unil.ch){.email}"

```{toml}
git config --global user.name "Your Name"
git config --global user.email "your_email@unil.ch"
```

Replace "Your Name" with your preferred name or the name you want to associate with your Git commits. Please also use your UNIL email address, so that we can exploit GitHub Student Developer Pack afterwards.

*Check yourself:* You can verify your Git configurations by running the following command:

```{toml}
git config --global --list
```

It will display your configured username and email.

*Note:* For Mac users, Git could be already preinstalled. However, Apple does not provide the latest version, that is why we have just installed the latest Git.

*Note:* Sometimes RStudio has a wrong path to `git` command. To check it, go to Tools -\> Global Options... -\> Git/SVN, check the box "Enable version control interface for RStudio projects". Then, "Git executable" and `which git`/`where git` (for Mac/Windows users, respectively) should be the same. Otherwise, copy the path from Terminal to RStudio.

To check if it worked, type `which git` in Terminal and expect to see `/usr/local/bin/git`.

### 2. Registering a GitHub account

-   Visit <https://github.com> and fill in the fields. Please use the same email address and short username without special symbols like hyphen, periods, etc. Furthermore, use free plan.

-   Set up a GitHub Student Developer Pack by visiting <https://education.github.com/>.

*Note*: The next step can be avoided (more convenient) by installing GitHub Desktop.

-   Next, go to your GitHub account settings by clicking on your profile picture in the top-right corner of the GitHub page and selecting "Settings," or directly visit the following link while signed in: <https://github.com/settings/profile>.

In the left sidebar, click on "SSH and GPG keys." Follow the instructions provided by GitHub to set up an SSH key for secure communication between your computer and GitHub. This will allow you to authenticate without entering your password each time you interact with GitHub via Git. Once the SSH key is set up, you can start using Git on your computer as described previously. You will be able to interact with your GitHub repositories by cloning them, pushing changes, and pulling updates.

*Note*: For more details, follow steps at <https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent> and <https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account>

### 3. Installing and setting up a GitHub Desktop

Using GitHub Desktop eliminates the need to manually set up SSH keys, as the application handles authentication using your GitHub account credentials. It provides a more visual and user-friendly experience for working with Git and GitHub repositories.

Here's how you can use GitHub Desktop instead of setting up an SSH key:

-   Visit the GitHub [Desktop website](https://desktop.github.com/).
-   Install it.
-   Open GitHub Desktop and click on the "Sign in to GitHub.com" button and enter your GitHub credentials to sign in.

To clone an existing GitHub repository, click on "File" in the top menu, then "Clone Repository." Select the repository you want to clone from the list, choose the destination folder on your computer, and click on the "Clone" button.

Once the repository is cloned, you can make changes to your files by editing, adding, or deleting them within the repository folder on your computer.

GitHub Desktop will detect the changes automatically. You can review the changes, provide a summary of the changes made, and click on the "Commit" button to create a commit with the changes. You will also have the option to sync the changes to your GitHub repository using the "Push" button.

GitHub Desktop provides an intuitive interface to manage branches, create new branches, pull changes from remote repositories, and perform various Git operations without using the command line.

You can also consider [GitKraken](https://www.gitkraken.com/) as an alternative to GitHub Desktop.

## References:

1.  [Happy Git and GitHub for the useR](https://happygitwithr.com)
2.  [Install Git](https://www.atlassian.com/git/tutorials/install-git)
3.  [R packages](http://r-pkgs.had.co.nz/git.html)
