# discord-music
[![License: Apache--2.0](https://img.shields.io/badge/License-Apache--2.0-yellow.svg)](http://www.apache.org/licenses/LICENSE-2.0)

> Quickly stand up a discord music bot with Docker.

All credit to [`jagrosh/MusicBot`](https://github.com/jagrosh/MusicBot) for the code. This repo merely wraps their hard work in order to quickly run a bot with Docker. Please go give them a ⭐️!

## Usage

```sh
git clone git@github.com:wlamason/discord-music.git
cp config.example.txt config.txt
# Update config.txt with a token, owner, and prefix at minimmum
# https://jmusicbot.com/setup/#3-edit-the-config-file
./discord-music.sh build
./discord-music.sh run
```

Windows git bash users: substitute `discord-music.sh` with `wdiscord-music.sh`.

## Hosting

This repo can be run on any server/computer with Docker installed. I have succesfully run an instance of the music bot on a $6 digital ocean debian droplet for almost 1 year now. 

To quickly install Docker you can run:
```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```
But don't take my word for it, since executing random code from the internet is not the best idea. Follow the Docker installation documentation [here](https://docs.docker.com/engine/install/). Above I demonstrate installing with the [convenience script](https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script).

[`config.example.txt`](https://github.com/wlamason/discord-music/blob/main/config.example.txt) has links to resources on getting your own discord bot token and owner user id.

## Author

👤 **Will Lamason**

* Website: [wmel.us](https://wmel.us)
* Github: [@wlamason](https://github.com/wlamason)

## Show your support

Give a ⭐️ if this project helped you!


## 📝 License

Copyright © 2022 [Will Lamason](https://github.com/wlamason).

This project is [Apache--2.0](http://www.apache.org/licenses/LICENSE-2.0) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_