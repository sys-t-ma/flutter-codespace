#!/usr/bin/env bash

sudo chown -R 1000:1000 $HOME/Android
sudo chown -R 1000:1000 $HOME/.android
sudo chown -R 1000:1000 $HOME/.java

# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

sudo usermod -s /usr/bin/zsh $(whoami)

# android studio
export PATH="$PATH:`pwd`/android-studio/bin"
echo 'export PATH="$PATH:`pwd`/android-studio/bin"' >> ~/.zshrc
echo 'export PATH="$PATH:`pwd`/android-studio/bin"' >> ~/.bashrc

# flutter
git clone https://github.com/flutter/flutter.git -b stable ./flutter &>/dev/null

export PATH="$PATH:`pwd`/flutter/bin"
echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.zshrc
echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.bashrc

if [ -d "$HOME/Android/Sdk" ]; then
  flutter config --android-sdk $HOME/Android/Sdk
fi

if [ -d "/workspace/android-studio" ]; then
  flutter config --android-studio-dir /workspace/android-studio
fi

flutter precache
flutter doctor
