# Table of Contents

* [Introduction](#Introduction)
* [Overview](#Overview)
* [Installation](#Installation)
* [Anime Wallpapers](#Anime-Wallpapers)
* [Virtualization](#Virtualization)
* [Configuration Files](#Configuration-Files)
* [BSPWM Mouse](#BSPWM-Mouse)
* [Keyboard Shortcuts](#Keyboard-Shortcuts)
* [Theme](#Theme)
* [Neovim](#Neovim)

# Introduction

A truly colorful linux configuration.

This is my personal collection of configuration files, feel free to use it.

These are the Linux distributions that have an automated installation:

<center>

| Operating System | Installation Script |
|------------------|---------------------|
| Kali Linux       | install.sh          |
| ParrotOS         | install.sh          |
| Ubuntu           | install.sh          |
| Pop!_OS          | install.sh          |
| Debian           | install.sh          |
| Arch Linux       | arch_install.sh     |

</center>

**Don't forget to give me a ⭐ to motivate me to continue adding cool features to this configuration**.

Here are some details about my setup:

- **WM**: [bspwm](https://github.com/baskerville/bspwm)
- **Hotkey**: [sxhkd](https://github.com/baskerville/sxhkd)
- **Locker**: [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
- **Shell**: [zsh](https://www.zsh.org/)
- **Editor**: [neovim](https://neovim.io/)
- **Bars**: [polybar](https://github.com/polybar/polybar)
- **Compositor**: [picom](https://github.com/yshui/picom)
- **File Manager**: [Thunar](https://docs.xfce.org/xfce/thunar/start)
- **Font Terminal**: [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)
- **Application Launcher**: [rofi](https://github.com/davatorium/rofi)
- **Browsers**: [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- **Terminals**: [kitty](https://sw.kovidgoyal.net/kitty/) (for aesthetics) and [qterminal](https://github.com/lxqt/qterminal) (for pentesting)
- **Static Wallpaper**: [feh](https://github.com/derf/feh)
- **Live Wallpaper**: [gpu-video-wallpaper](https://github.com/nozerobit/gpu-video-wallpaper)

---

Static wallpapers site:

- [hdqwalls](https://hdqwalls.com/)

Animated wallpapers site:

- [desktophut](https://www.desktophut.com/)

# Overview

**Note: This section contains highly compressed / low-quality GIFs, in reality is not blurry and grainy.**

There are multiple polybars:

<p align="center">
  <img src="media/gifs/preview.gif" alt="preview.gif" />
</p>

Each polybar theme has a custom launcher:

<p align="center">
  <img src="media/gifs/look.gif" alt="look.gif" />
</p>

Normally you would use `Windows + Alt + R` to reload bspwm in order to fix the wallpaper resolution scale and the polybar when changing screen resolution but I have made a ~~script~~ with xeventbind and a polybar configuration so that you don't have to reload bspwm. In other words, it automatically changes the wallpaper and the polybar resolution/size when changing the screen resolution **without** the need to reload bspwm:

<p align="center">
  <img src="media/gifs/wallpaper-resize.gif" alt="wallpaper-resize.gif" />
</p>

These are the available polybars:

<p align="center">
  <img src="media/gifs/polybars.gif" alt="polybars" />
</p>

Note: The color of these bars is dynamic and the colors change according to the wallpaper.

**1. colorblocks bar (default)**:

<p align="center">
  <img src="media/images/colorblocks.png" alt="colorblocks" />
</p>

**2. forest bar (no pywal)**:

<p align="center">
  <img src="media/images/forest.png" alt="forest" />
</p>

**3. shapes bar**:

<p align="center">
  <img src="media/images/shapes.png" alt="shapes" />
</p>

**4. docky bar**:

<p align="center">
  <img src="media/images/docky.png" alt="docky" />
</p>

**5. grayblocks bar**:

<p align="center">
  <img src="media/images/grayblocks.png" alt="grayblocks" />
</p>

**6. material bar**:

<p align="center">
  <img src="media/images/material.png" alt="material" />
</p>

**7. hack bar (top part)**:

<p align="center">
  <img src="media/images/hack-top.png" alt="hack" />
</p>

**7. hack bar (bottom part)**:

<p align="center">
  <img src="media/images/hack-bottom.png" alt="hack" />
</p>

**8. trans bar (transparent)**:

<p align="center">
  <img src="media/images/trans.png" alt="trans" />
</p>


Some polybars themes have audio volume modules. The volume can be adjusted with the mouse wheel.

You can change the polybar theme with the launcher:

```sh
❯ change-polybar
Usage: change-polybar --theme

Available Themes:
--colorblocks   --docky		   --hack  
--forest        --grayblocks   --trans  
--shapes	--material
```

Here is an example:

```sh
change-polybar --hack
```

Some polybars are slower to load than others so it is recommended to kill the polybar first:

```sh
killall polybar; change-polybar --material
```

If you want to change the default polybar simply edit the BSPWM configuration file:

```sh
vim ~/.config/bspwm/bspwmrc
```

Replace the following line:

```sh
~/.config/polybar/launch.sh --colorblocks &
```

You can use `Windows + Alt + W` to shuffle wallpapers and change colors on the fly:

<p align="center">
  <img src="media/gifs/changer.gif" alt="changer.gif" />
</p>

> Note: In the weird case that the polybar dies, you can use `Windows + Alt + R` to restart BSPWM.
> Some polybars themes do take more time to load since they use more scripts and icons.
> The polybar `hack` theme is the slowest.
> The polybar `forest` theme is not supported.

> Important: Avoid spamming this keyboard shortcut.

Alternatively, you could use `Windows + Alt + E` to change to a specific wallpaper using the GUI:

<p align="center">
  <img src="media/gifs/wallpaper_selector.gif" alt="wallpaper_selector.gif" />
</p>

Alternatively, you can use `Windows + Alt + X` to select the wallpaper with a preview, then hit `Ctrl + x` and then `W` to change the wallpaper. Once the wallpaper is set we can close the program with `Windows + W`:

<p align="center">
  <img src="media/gifs/wallpaper_preview_selector.gif" alt="wallpaper_preview_selector.gif" />
</p>

We can also use **live wallpaper / animated wallpapers** with `vwallpaper` (demo script):

```shell
vwallpaper --start ~/Videos/wallpapers-animated/Cyberpunk-2077-City-Live-Wallpaper.mp4 &>/dev/null & disown
```

<p align="center">
  <img src="media/gifs/animated_wallpaper.gif" alt="animated_wallpaper.gif" />
</p>

We can stop the **live wallpaper / animated wallpapers** with the following:

```shell
vwallpaper --stop
```

---

**Important**: If the wallpaper doesn't have the correct resolution, you can change it by editing:

```sh
sudo vim $(which video-wallpaper.sh)
```

Then change the resolution at line 60:

```sh
   # Change -g <TO_YOUR_RESOLUTION>
	"$scriptdir"/xwinwrap -g 3840x2160 -fdt -ni -b -nf -un -o 1.0 -- mpv -wid WID --loop --no-audio "$VIDEO_PATH" & disown
```

I'll try to find a better solution but for now that should do the work.

**Important**: Transparency should work by default in native installs as long as you have the GPU drivers installed in your system. In most virtual machines that are using virtualized GPUs you will have to set X11 as the video output. If your virtualization software supports GPU passthrough then you may not have to change anything, unless you want to select a specific video output driver.

If you want to add transparency to a VM add the following flags:

```sh
-vo x11 --hwdec=auto-safe --profile=sw-fast
```

> Note: This may increase the CPU usage up to 15%-25% in VMs. 

If you don't care about the performance then you can follow this example:

```sh
xwinwrap -g 1920x1080 -fdt -ni -b -nf -un -o 1.0 -- mpv -wid WID -vo x11 --hwdec=auto-safe --profile=sw-fast --loop --no-audio ~/Videos/wallpapers-animated/Astronaut-In-Space-With-Jellyfish-Live-Wallpaper.mp4
```

You can use **htop** to monitor the performance of each process:

```sh
htop
```

You will probably see that the Xorg process increases up to 60%-70% when the video output (-vo) is set to `x11` in `mpv`. Therefore, I don't recommend running this "video output driver".

For more information about video output drivers read the mpv repo [vo.rst](https://github.com/mpv-player/mpv/blob/master/DOCS/man/vo.rst).

---

The animated wallpapers also support automatic resizing:

<p align="center">
  <img src="media/gifs/animated_wallpaper_resize.gif" alt="animated_wallpaper_resize.gif" />
</p>

We can close an animated wallpaper with the following command:

```shell
video-wallpaper.sh --stop
```

You could also use `Windows + Alt + W` or `Windows + Alt + E` to change the wallpaper.

The terminal font size can be changed with `Windows + Alt + F`:

<p align="center">
  <img src="media/gifs/font_changer.gif" alt="font_changer.gif" />
</p>

> Note: When using `qterminal` is recommended to use the GUI preferences window instead. Also, you need to open a new terminal to see the changes.

You can change the **corners** of the windows and the polybar to **rounded or sharp** corners with the shorcut `Windows + Alt + B`.

<p align="center">
  <img src="media/gifs/corners.gif" alt="corners.gif" />
</p>

You can also **copy IPs** to the clipboard with a **left click** on the bar (ethernet, vpn or target):

<p align="center">
  <img src="media/gifs/copy_ip.gif" alt="copy_ip.gif" />
</p>

> Note: There's a VPN status bar, it shows your VPN IP when connected and it tells you when you're disconnected from a VPN.

There's a network bar where you can configure your network:

<p align="center">
  <img src="media/gifs/network.gif" alt="network.gif" />
</p>

On zsh you can set the target IP with the command `setarget 10.10.10.10`. You can use the command `notarget` to remove the target IP:

<p align="center">
  <img src="media/gifs/target.gif" alt="target.gif" />
</p>

You can set a **default wallpaper** that will be used at startup with the following:

```sh
❯ default-wallpaper --set ~/Pictures/Wallpapers/i-love-8-bit-qhd-1920x1080.jpg
[+] Added a default wallpaper!
❯ default-wallpaper --remove
[+] Random wallpapers will be set at startup!
```

Some polybars themes are slower to load than others so it is recommended to kill the polybar first:

```sh
killall polybar; default-wallpaper --set ~/Pictures/Wallpapers/i-love-8-bit-qhd-1920x1080.jpg
```

You can also customize the polybar theme colorblocks:

<p align="center">
  <img src="media/gifs/polybar-changer.gif" alt="polybar-changer.gif" />
</p>

This is the command for the `polybar-changer` help menu:

```sh
polybar-changer --help
```

You can use `Windows + Q` to open the power menu:

![lock](https://user-images.githubusercontent.com/83516002/174217518-9a360794-79b1-4df8-8b35-47ea14ec3da6.png)

You can escape or exit the powermenu with the `Escape/Esc` key in your keyboard.

> If you put the computer to sleep, you can wake it up with the `Escape/Esc` key on your keyboard.

You can also see a preview of each workspace, this is very useful when we want to know which applications or windows are open in each workspace.

<p align="center">
  <img src="media/images/bspwm-workspace-preview.png" alt="bspwm-workspace-preview" />
</p>

Activate the bspwm workspace preview with the keyboard shortcut `Alt + W`, then view the workspaces preview with the `Windows` key. Once, you're done, you can close the process with `Alt + D`.

> Important: Make sure to always use `Alt + D` when you finish using the bspwm workspace preview.

Create pentesting project directories with `mk`:

```zsh
mk
```

View the storage (sda) information:

```zsh
drive
```

View your system information:

```zsh
info
```

Alternatively, you can use `neofetch` to view your system information:

```sh
neofetch
```

Kill a process:

```
kp nvim
```

Extract nmap ports:

```zsh
xp filename.gnmap
```

Identify the operating system:

```zsh
os 127.0.0.1
```

# Installation

**Important**: Please install this on a **new virtual machine** and not on a working machine to avoid errors.

It is recommended to disable sleep because the script can take a while to finish:

<div style="text-align:center"><img src="media/images/power-manager.png" /></div>

These are the installation steps:

1. Clone this repo and change the directory:

```bash
git clone https://github.com/nozerobit/colorful-dotfiles.git && cd colorful-dotfiles
```

Then use the correct installation script:

<center>

| Operating System | Installation Script |
|------------------|---------------------|
| Kali Linux       | install.sh          |
| ParrotOS         | install.sh          |
| Ubuntu           | install.sh          |
| Pop!_OS          | install.sh          |
| Debian           | install.sh          |
| Arch Linux       | arch_install.sh     |

</center>

> **Important**: Don't run this script as the `root` user. Run it with a user that's in the `sudo/wheel` group.

> Note: Please don't install this script while using GNOME. For some reason `pywal` doesn't change the wallpaper when using GNOME. Here is a [temporary solution](#Pywal-GNOME).

2. Run the installation script from the `colorful-dotfiles` directory:

```bash
./install.sh
```

If you're installing this in Arch Linux:

```bash
chmod +x arch_install.sh && ./arch_install.sh
```

You can monitor the installation with the following command (optional):

```sh
watch -n 1 tail /home/kali/colorful-dotfiles/install_log.txt
```

The script has four (4) symbols:

1. `[+]` = Success
2. `[-]` = Failed
3. `[!]` = Information
4. `[i]` = Information to solve the error

The installation can take a while because it downloads a lot of things. The time that it takes to finish will depend mostly on your internet download bandwidth provided by your ISP.

A log is also created for troubleshooting purposes.

3. Reboot the machine (required):

```bash
reboot || systemctl reboot
```

![bspwm-login](media/images/bspwm-login.png)

Once you have rebooted the machine, select bspwm as the window manager and then log in. 

You can restart bspwm at any time with `Windows + Alt + R`, this is useful to fix a WM issue.

That's it, now hit two (2) times the following keyboard shorcuts: 

- `Windows + Alt + W` and `Windows + Alt + B` and see which look you like the most. 

> Note: You may need to hit those keyboard shortcuts multiple times when you first install this configuration.

It is recommended to verify the [Neovim](#Neovim) plugins.

# Pywal GNOME

If you installed this configuration with a system that uses GNOME you might have an issue with pywal. It can "fixed" with the following:

```sh
pywal_get() {
	wal -i "$1" -q -t; feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
}
```

Edit each pywal script on the following path:

```sh
.config/polybar/theme_name/scripts/pywal.sh
.config/polybar/colorblocks/scripts/pywal.sh
```

# Anime Wallpapers

If you want to add `anime wallpapers` you can do the following:

```sh
cp wallpapers-anime/* ~/Pictures/Wallpapers/
```

If you want to add it to the root user:

```sh
sudo cp wallpapers-anime/* /root/Pictures/Wallpapers
```

# Virtualization

If you are in a virtual machine and you want to enable drag-and-drop files and copy-paste then read this section.

## VMware Guest Tools

In Kali Linux the VMware guest tools are already configured so you don't have to do anything.

If you're using another Debian distro then install the following packages:

```sh
sudo apt install open-vm-tools open-vm-tools-desktop
```

If you're using Arch in VMware, [read this documentation](https://wiki.archlinux.org/title/VMware/Install_Arch_Linux_as_a_guest).


## VirtualBox Guest Tools

Install VirtualBox guest tools:

```
sudo apt install -y virtualbox-guest-x11
```

Start the service:

```
sudo systemctl status virtualbox-guest-utils.service
```

Enable VirtualBox service at startup:

```
sudo systemctl enable virtualbox-guest-utils.service
```

## QEMU Guest Tools

The SPICE agent allows for automatic X session resolution adjustment to the client resolution. The SPICE agent also provides support for copy and pasting between the host and guest and prevents mouse cursor lag.

```sh
sudo apt install -y spice-vdagent
```

Start the service:

```sh
sudo systemctl start spice-vdagent
```

The QEMU guest agent runs inside the guest and allows the host machine to issue commands to the guest operating system using libvirt, helping with functions such as freezing and thawing filesystems. The guest operating system then responds to those commands asynchronously. 

```sh
sudo apt install -y qemu-guest-agent
```

Start the service:

```sh
sudo systemctl start qemu-guest-agent
```

If you want to add this service at startup, add it to `bspwmrc`:

```sh
echo "systemctl start qemu-guest-agent" >> ~/.config/bspwm/bspwmrc
```

Since the service.unit file is not pre-configured for startups as seen here:

```sh
❯ sudo systemctl enable qemu-guest-agent

Synchronizing state of qemu-guest-agent.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable qemu-guest-agent
The unit files have no installation config (WantedBy=, RequiredBy=, Also=,
Alias= settings in the [Install] section, and DefaultInstance= for template
units). This means they are not meant to be enabled using systemctl.
 
Possible reasons for having this kind of units are:
• A unit may be statically enabled by being symlinked from another unit's
  .wants/ or .requires/ directory.
• A unit's purpose may be to act as a helper for some other unit which has
  a requirement dependency on it.
• A unit may be started when needed via activation (socket, path, timer,
  D-Bus, udev, scripted systemctl call, ...).
• In case of template units, the unit is meant to be enabled with some
  instance name specified.
```

You could create your own service file though.

More information [here](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/chap-qemu_guest_agent).

## Hyper-V Enhanced Session

Enable `Hyper-V Enhanced Session` in Hyper-V Settings:

<p align="center">
  <img src="media/images/hyper-v-enchanced.png" alt="hyper-v-enchanced" />
</p>

Enable `Guest services` in Hyper-V VM Settings:

<p align="center">
  <img src="media/images/hyper-v-guest.png" alt="hyper-v-guest" />
</p>

Lastly, read the official [Kali Linux documentation](https://www.kali.org/docs/virtualization/install-hyper-v-guest-enhanced-session-mode/) and follow the steps.

# Configuration Files

If you would like to change some settings, here are the locations of the configuration files.

`alacritty` Terminal Configuration:

```shell
~/.config/alacritty/alacritty.yml
```

`kitty` Terminal Configuration:

```shell
~/.config/kitty/kitty.conf
```

`bspwm` WM Configuration:

```shell
~/.config/bspwm/bspwmrc
```

`sxhkd` Keyboard Shortcuts Configuration:

```shell
~/.config/sxhkd/sxhkdrc
```

`picom` Transparency Configuration:

```shell
~/.config/picom/picom.conf
```

`nvim` Terminal Text Editor Configuration:

```shell
~/.config/nvim/init.vim
```

`polybar` Workspace and Desktop Panel Configuration:

```shell
~/.config/polybar/colorblocks/launch.sh
```

`rofi` Program Launcher Configuration:

```shell
~/.config/rofi/config
```

`zsh` Shell Configuration:

```shell
~/.zshrc
```

## BSPWM Mouse

`Alt + Left Click`: Move a floating window or swap a tiled window.

`Alt + Right Click`: Resize any tiling or floating window.

## Important Keyboard Shortcuts

These are the most important keyboard shortcuts:

- `Windows + D`: Open Rofi and Esc to exit.

- `Windows + Enter`: Open the terminal-emulator (alacritty/kitty).

- `Windows + Ctrl + Enter`: Open the terminal-emulator (qterminal), doesn't apply the pywal color **(used for tools that have colored outputs)**

- `Windows + W`: Close the current window.

- `Windows + Alt + R`: Restart the bspwm configuration.

- `Windows + Alt + Q`: Logout.

## Keyboard Shortcuts

`Windows + Enter`: Open the terminal emulator (alacritty/kitty).

`Windows + Ctrl + Enter`: Open the terminal-emulator (qterminal), doesn't apply the pywal color **(used for tools that have colored outputs)**

`Windows + Q`: Launch the power menu.

`Windows + W`: Close the current window.

`Windows + Alt + R`: Restart the bspwm configuration.

`Windows + Alt + Q`: Logout.

`Windows + (⬆⬅⬇➡)` or `Windows + h,j,k,l`: Move through the windows in the current workspace.

`Windows + D`: Open Rofi and Esc to exit.

`Windows + Ctrl + D`: Open Rofi and run commands as sudo, useful for tools such as wireshark.

`Windows + (1,2,3,4,5,6,7,8,9)`: Change the workspace.

`Windows + T`: Change current window to "terminal" (normal) mode. It helps us when the window is in full or floating screen mode.

`Windows + M`: Change the current window to "full" mode. Press the same keys to return to "terminal" (normal) mode.

`Windows + F`: Change the current window to full-screen mode (it occupies everything including the polybar).

`Windows + S`: Change the current window to "floating" mode.

`Windows + Shift + (1,2,3,4,5,6,7,8,9)`: Move the current window to another workspace.

`Windows + Alt + (⬆⬅⬇➡)` or `Windows + Alt + h,j,k,l`: Resize current window (only works if you are in terminal or floating mode).

`Windows + Ctrl + (⬆⬅⬇➡)` or `Windows + Ctrl + h,j,k,l`: Change the position of the current window (only works in floating mode).

`Windows + Ctrl + Alt + (⬆⬅⬇➡)` or `Windows + Ctrl + Alt + h,j,k,l`: Show a preselection and then open a window (a terminal, firefox, a file, etc.).

`Windows + Ctrl + Space`: Undo the preselection.

`Windows + Shift + W`: Close and Kill

`Windows + M`: Alternate between the tiled and monocle layout

`Windows + Shift + T,S,F`: Set the window state

`Windows + Ctrl + M,X,Y,Z`: Set the node flags

`Windows + O,I`: Focus on older or newer node in the focus history

`Windows + grave,Tab`: Focus the last node/desktop

`Windows + bracket{left,right}` or `Windows + bracket{h,l}`: Focus the next/previous desktop in the current monitor

`Windows + Shift + C`: Focus the next/previous window in the current desktop

`Windows + p,b,comma,period`: Focus the node for the given path jump

`Windows + Shift + {Left,Down,Up,Right}` or `Windows + Shift + h,j,k,l`: Focus the node in the given direction (swap window)

### Special Shortcuts

`Alt + W`: Activate the bspwm workspace preview then view the workspaces preview with the `Windows` key. Once, you're done, you can close the process with `Alt + D`.

`Windows + Alt + W`: Shuffle through wallpapers with pywal.

`Windows + Alt + E`: Change to a specific wallpaper using the GUI.

`Windows + Alt + X`: Select wallpaper with a preview, then hit `Ctrl + x` and then `W` to change the wallpaper. Once the wallpaper is set we can close the program with `Windows + W`

`Windows + Alt + F`: Change the terminal font size.

`Windows + Alt + B`: Change the **corners** of the windows and the polybar to **rounded or sharp** corners.

`Alt + Shift + X`: Execute the lock screen and type the current user session password to log in.

`Print Screen`: Take a screenshot with `flameshot`.

# Compositor Blur

If you want to enable blur on the picom compositor, you can use this settings:

```sh
blur-method = "box";
blur-strength = 5;
blur-background = true;
```

Then run picom with `experimental-backends`:

```sh
picom --experimental-backends
```

# Neovim

Run the commands below as your `user` and as the `root` user to correctly install/update the neovim plugins.

```bash
nvim
```

You can ignore this message because once the plugins are updated or installed it'll disappear:

![image](https://user-images.githubusercontent.com/83516002/130538524-b6bfa743-cb7d-4cd3-89ad-dc3306ffbb08.png)

1. Inside nvim, press the `:` (colon key) and type the following:

```shell
:PlugUpdate
```

**Reminder**: Repeat the same for root `sudo vim test`.

This is the output that you should see:

![image](https://user-images.githubusercontent.com/83516002/130538587-b2b18614-fac2-4cbb-b6e8-c1f6100b4ad7.png)

You can use Shift + R to retry. 

Once installed or updated, you can exit with `:q!`, and then type `vim` or `nvim` to check the health.

2. Check Health

```shell
:checkhealth
```

3. coc Intellisense

```shell
:CocInstall coc-json coc-tsserver coc-pyright coc-snippets coc-vimlsp
```

4. Search

```shell
:FZF
:Rg
:BLines
:Lines
```

***Do you want more coc extensions for nvim?***

Check out coc extensions here: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

***Do you want more themes for nvim?***

Check out this repo: https://github.com/rafi/awesome-vim-colorschemes 

***Do you want to configure coc.nvim?***

Check out this wiki: https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file

## Neovim Shortcuts

These are the neovim shortcuts:

```vim
" Navigation
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use **alt** which is M + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else, quick and dirty Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
```

## Optional (Apps Setup) - Debian Based Distros

If you want to install some apps that I use, run this script:

```sh
chmod +x apps.sh && ./apps.sh
```

# References & Credits

**Progress Bar**:
- https://github.com/pollev/bash_progress_bar

**xeventbind**:
- https://github.com/ritave/xeventbind

**Configurations**:
- https://github.com/baskerville/bspwm
- https://github.com/baskerville/sxhkd
- https://github.com/jwilm/alacritty 
- https://github.com/adi1090x/polybar-themes
- https://github.com/davatorium/rofi
- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/gpakosz/.tmux.git

**Fonts**:
- https://github.com/ryanoasis/nerd-fonts.git

**Neovim Plugins**:
- https://github.com/sheerun/vim-polyglot
- https://github.com/jiangmiao/auto-pairs
- https://github.com/joshdick/onedark.vim
- https://github.com/neoclide/coc.nvim
- https://github.com/vim-airline/vim-airline
- https://github.com/vim-airline/vim-airline-themes
- https://github.com/kevinhwang91/rnvimr
- https://github.com/liuchengxu/vim-which-key
- https://github.com/junegunn/fzf
- https://github.com/airblade/vim-rooter

