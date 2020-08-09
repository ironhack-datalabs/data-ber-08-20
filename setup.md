# Basic Setup

Besides the required installations as part of the prework, we are going to rely on virtual environments to manage python and the required dependencies for the bootcamp.

Our tool of choice for managing virtual environments is [`conda`](https://docs.conda.io/en/latest/). We will be using `conda`'s command line tool throughout the bootcamp. Please make sure you have a Unix shell (e.g. bash or zsh) with `conda` installed on Day 1.

## 1. Shell

### Mac / Linux:
You're good! Mac OS comes with zsh through the Terminal application (OS Catalina, previous OS come with bash), Linux comes with bash.

### Windows:
In most situations, it was sufficient to use Git BASH that comes with the Git installation as part of the prework. 

Alternatively, you can set up the [Windows Subsystem for Linux (WSL 2)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) on your computer. Once you have the Ubunutu Terminal, you're good to go. 

## 2. `conda`

**If you have already install [Anaconda](https://www.anaconda.com/products/individual), you don't have to install `conda` in addition.** If you haven't, it is recommended to install [Miniconda](https://docs.conda.io/en/latest/miniconda.html) only. 

To install Miniconda, please follow the instructions provided on [their website](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) for your corresponding operating system. 

During installation, you will be asked “Do you wish the installer to initialize Miniconda by running conda init?” Respond with “yes”. 

After successful installation, you should be able to run the following command in your shell (Terminal for Mac / Linux, Git BASH or Ubuntu Terminal for Windows):

```bash
conda --help
```
The output should look like this:
```bash
usage: conda [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

[...]
```

If you get `command not found` as a response, you have to initialize the `conda` application.

In order to initialize after the installation process is done, open your Terminal (or Git BASH), first run 

```bash
source <path to conda>/bin/activate
```

> **_Note_**: Replace `<path-to-anaconda>` with the actual path of your installed Miniconda file. By default, Miniconda is installed in your home user directory:
> - Windows 10: `C:\Users\<your-username>\Miniconda\`
> - macOS: `/Users/<your-username>/Miniconda`
> - Linux: `/home/<your-username>/Miniconda`

and then run
```bash
conda init
```
Follow the instructions and pick the shell you are using. If you use Git BASH, pick `bash`, for Mac OS Catalina, pick `zsh`. After completion, close and reopen your Terminal and retry running
```bash
conda --help
```
