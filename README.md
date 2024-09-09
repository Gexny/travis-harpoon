[![Build Status](https://app.travis-ci.com/Montana/travis-harpoon.svg?token=U865GtC2ptqX3Ezf3Fzb&branch=master)](https://app.travis-ci.com/Montana/travis-harpoon)

# Travis CI with Harpoon 
This demonstrates how Travis CI works with Harpoon. (https://www.harpoon.io/).

## Usage 

Get all your API keys. Specifically from Docker/Harpoon. You'll want these lines in your `.travis.yml`:

```yaml
  - echo "$HARPOON_API_TOKEN" | docker login https://registry.harpooncorp.com -u montana --password-stdin
  - docker build --platform linux/amd64 -t harpoondemo .
```

Make sure in the Travis CI GUI you label the Harpoon API `HARPOON_API_TOKEN`. Make sure where my Harpoon username `montana` is, it's your username. Then where it says `harpoondemo` have it your own project name. 

## My config file

This is my `.travis.yml`:

```yaml
language: generic
dist: focal

cache:
  directories:
    - $HOME/.docker

before_install:
  - sudo apt-get update
  - uname -r 

script:
  - echo "$HARPOON_API_TOKEN" | docker login https://registry.harpooncorp.com -u montana --password-stdin
  - docker build --platform linux/amd64 -t harpoondemo .
  - docker tag harpoondemo:latest registry.harpooncorp.com/montana/harpoondemo:latest
  - docker push registry.harpooncorp.com/montana/harpoondemo:latest

branches:
  only:
    - master
```
Once you see a successful push, go to Harpoon, and you can search for the image in the harpoon registry and drag it onto the graph.

## Harpoon 

Just go to the dropdown on the left-hand side, select "Harpoon," and then search. You should see your project, then drag and drop it to the stages screen, it should look like this: 

<img width="977" alt="Screenshot 2024-09-09 at 2 10 10 PM" src="https://github.com/user-attachments/assets/21611865-5264-4494-8e0d-509d7e850011">

<br>That's it. You've used Travis CI with Harpoon.</br>

## Author 

>Michael Mendy. September, 2024. 













