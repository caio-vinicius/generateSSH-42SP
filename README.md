# generateSSH-42SP

Simple shell script to generate and output pair of SSH keys with OpenSSH. This project aims to help 42 students connect to the system so they can interact with the repository remotely. 

## Installation

```bash
$ git clone https://github.com/caio-vinicius/generateSSH-42SP create_ssh_key
$ cd create_ssh_key
```

That's it!

### Prerequisites

You need [OpenSSH](https://www.openssh.com/) and [Unix Shell Interpreter](https://en.wikipedia.org/wiki/Unix_shell) to run properly. If you want copy-paste automatically you can install [xclip](https://linux.die.net/man/1/xclip) too.

Tip: If you are in Ubuntu, Ubuntu-based or even Arch-based probably you have these by default installed.

## Usage

You can run the script on the root repository:

```bash
$ ./generateSSH.sh
```

If you don't already have a pair of keys, a new pair will be generated and you will be prompted with the public key!

![New key](https://github.com/caio-vinicius/generateSSH-42SP/blob/media/1.png)

Maybe you already have one, so you will be asked to output the current ou generate another:

![New already no key](https://github.com/caio-vinicius/generateSSH-42SP/blob/media/2.png)

Or if yes:

![New already yes key](https://github.com/caio-vinicius/generateSSH-42SP/blob/media/3.png)
