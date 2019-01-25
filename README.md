# Scripts to schedule dnd on slack when doing something useful

## Usage

 * `set-dnd.sh <number_of_minutes> <reason>` - set the DND for `number_of_minutes> with `reason> set as status
 * `unset-dnd.sh` - unsets the DND right away

## Installation

### Getting a slack token

Create a token using the page:

https://api.slack.com/custom-integrations/legacy-tokens

copy it, and invoke command in terminal:

```
pbpaste > ~/.slack-token
```

### Actual installation

```
make install
```

