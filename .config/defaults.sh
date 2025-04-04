#!/bin/bash
# Finder

# enable full keyboard navigation
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# set dark mode and disable auto-switching on time of day
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool false
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Don't display the accents menu when key is held down
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Don't reverse mouse scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# pressing a function key will perform the special feature printed on that key
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Finder
# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Show all file extensions in Finder (.app, etc)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Make it so nothing happens when you press the Fn or 🌐︎ key
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# WindowManager
# Don't click to show desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Dock

# Autohide Dock
defaults write com.apple.dock autohide -bool true
# Increase the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 1000.0

defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 48

# Finder

# Don't show hard drives
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# No separate spaces per display, needed for Aerospace
defaults write com.apple.spaces spans-displays -bool true
