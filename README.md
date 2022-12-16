# Why?

I'd like to invite users to private slack channels instead of manually adding them.


## Demo

[here](https://github.com/pathcl/slack-inviter/actions/runs/3713106336)


## Instructions
1. [Create](https://api.slack.com/apps) a Slack App for your workspace.
2. Add the following permission scopes to a user token (bot tokens aren't allowed `channels:write`):
    - `users:read`
    - `users:read.email`
    - `channels:read`
    - `channels:write`
    - `groups:read` (only if inviting to private channels)
    - `groups:write` (only if inviting to private channels)
3. Install app to your workspace which will generate a new User OAuth token
4. Download script:
    - If you have Go installed: `go install github.com/pathcl/slack-inviter@latest`
    - Else download the binary directly: https://github.com/pathcl/slack-inviter/releases
5. Run script:

`slack-multi-channel-invite -api_token=<user-oauth-token> -emails=steph@example.com,klay@example.com -channels=dubnation,splashbrothers,thetown -private=<true|false>`

The users with emails `steph@example.com` and `klay@example.com` should be invited to channels `dubnation`, `splashbrothers`, and `thetown`!

_* Set `private` flag to `true` if you want to invite users to private channels.  As noted above, this will require the additional permission scopes of `groups:read` and `groups:write`_


## Usage


    slack-inviter $ ./slack-inviter -channels infosec -debug -emails luis@sanmartin.dev -private -action add -api_token my-token

    Looking up users ...
    Valid user (ID: U03E9M7A44Q) found for 'luis@sanmartin.dev'
    DEBUG: # of channels returned in page: 2
    DEBUG: Total # of channels retrieved: 2

    Inviting users to channels ...
    Users invited to 'infosec'

    All done! You're welcome =)


## Remove users from channels?
Simply set the optional `action` flag to `remove` (`add` is the default):

`slack-inviter -api_token=<user-oauth-token> -action=remove -emails=kd@example.com -channels=dubnation,warriors -private=<true|false>`


## TODO:

maybe convert it to a github action
