## ZSh Configuration

A template configuration for ZSh, generally suited to my usage.

Features:
* Solarized Dark theme in Linux virtual TTY
* Simplistic prompt (directory, Git branch, error code, root/nonroot)
* Completion with TAB (tailored to how I like it)
* SSH agent, as well as automatic loading of given SSH keys
* A few aliases
* Customizations

#### Solarized Dark in vTTY
It is possible to change the terminal colors within the Linux virtual TTY on
login.

#### Simplistic Prompt
This is the approximate format:
```
[<shortened PWD>] <Git branch> <error code> <'$' or '#'>
```
Each section is colored differently. The prompt can be added to from the
customization folder.

#### Completion
I don't know a lot about ZSh completion, but I have set it well up from
`zsh-newuser-install`. That's all that is added here. However, note that some
specific features have been added that not all would appreciate (e.g
dvorak-based error corrections).

#### SSH agent
The SSH agent is brought up if none was found, and is brought down in the
logout of the same shell. If a file `autoload.list` exists in `$HOME/.ssh`,
then each line within is used as a path to the private key relative to
`$HOME/.ssh`. For example, to autoload `$HOME/.ssh/id_rsa`, one would add:
```
id_rsa
```
to `autoload.list`. Note that a line can only contain a key name, and no
whitespace stripping or any transformations are performed.

#### Aliases
Some basic aliases are provided, such as forcing colors in `ls`.

#### Customizations
All files with `.zsh` extensions are automatically sourced from
`$HOME/.config/zsh_custom`. These files can be precompiled using `zcompile`,
and the compiled versions will be used as long as the `.zsh` version exists
too. For example, with a file `script1.zsh`, a precompiled file
`script1.zsh.zwc` would be used instead if it is found and is newer than
`script1.zsh`.
