#!/usr/bin/env bash

sudo chown -R 1000:1000 $HOME/Android
sudo chown -R 1000:1000 $HOME/.android
sudo chown -R 1000:1000 $HOME/.java
sudo chown -R 1000:1000 $HOME/android-studio
sudo chown -R 1000:1000 $HOME/.local
sudo chown -R 1000:1000 $HOME/flutter
sudo chown -R 1000:1000 $HOME/.config

# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

sudo usermod -s /usr/bin/zsh $(whoami)

# android studio
export PATH="$PATH:$HOME/android-studio/bin"
echo 'export PATH="$PATH:$HOME/android-studio/bin"' >> $HOME/.zshrc
echo 'export PATH="$PATH:$HOME/android-studio/bin"' >> $HOME/.bashrc

# flutter
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter &>/dev/null

export PATH="$PATH:$HOME/flutter/bin"
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> $HOME/.zshrc
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> $HOME/.bashrc

if [ -d "$HOME/Android/Sdk" ]; then
  flutter config --android-sdk $HOME/Android/Sdk
fi

if [ -d "$HOME/android-studio/bin" ]; then
  flutter config --android-studio-dir $HOME/android-studio
fi

flutter precache
flutter doctor
flutter pub get
