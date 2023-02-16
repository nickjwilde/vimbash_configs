#!/bin/bash
#
cat copy_files_list.txt | xargs -I {} ln -s `pwd`/{} $HOME/{}

cp .secrets_default $HOME/.secrets

echo "if [ -f 01_bashrc ]; then\n\tsource 01_bashrc\nfi" >> $HOME/.bashrc
