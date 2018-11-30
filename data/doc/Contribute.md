You can contribute in several ways to AzerothCore:

- [commenting an open issue](https://github.com/azerothcore/azerothcore-wotlk/wiki/Contribute#how-to-comment-an-issue)

- [opening an issue](https://github.com/azerothcore/azerothcore-wotlk/wiki/Contribute#how-to-open-an-issue)

- [testing an open pull request](https://github.com/azerothcore/azerothcore-wotlk/wiki/Contribute#how-to-test-a-pull-request)

- [creating a pull request](https://github.com/azerothcore/azerothcore-wotlk/wiki/Contribute#how-to-create-a-pull-request)

- [improving our wiki](https://github.com/azerothcore/azerothcore-wotlk/wiki/Contribute#improve-the-wiki)
## General information

To contribute, you obviously need a github account.

## How to comment an issue

You can help much by checking the [issues](https://github.com/azerothcore/azerothcore-wotlk/issues) and joining their discussions.

One thing you can do is to update your core and check if the issue is still valid on your revision, then you can write a comment **including the commit hash**.

## How to open an issue

Important things to do before reporting a bug:

**1) Update your core to the latest AzerothCore revision and check whether the bug is still there**

**2) Search among the [issues](https://github.com/azerothcore/azerothcore-wotlk/issues) to check if someone has already reported the bug, in that case you have just to comment the issue to confirm the bug (including your core revision)**

If **(and only if)** the bug hasn't been reported yet, you can [open an issue](https://github.com/azerothcore/azerothcore-wotlk/issues/new) and include:

- the **description of the bug**, including any useful **links** and **IDs/GUIDs/names** of any related entities (NPCs, spells, gameobjects, etc..)
- the **core revision (commit hash)** of the AzerothCore you are running on, **do not write just "latest version"** even if you have just updated your core
- if it is about a build problem, it would be useful to know also your **operating system** and **compiler version**


## How to test a Pull Request

Open the PR web page picking it from the [list](https://github.com/azerothcore/azerothcore-wotlk/pulls).

Just below the title there is such a label:

> Someuser wants to merge X commits into azerothcore:master from **someuser**:**branch-name**

Now open your terminal and move to the AzerothCore source clone.

Replacing **someuser** and **branch-name** with the ones you've seen via web, type:

`git remote add someuser https://github.com/SOMEUSER/azerothcore-wotlk.git`

`git fetch someuser`

`git checkout -b someuser_branch-name  someuser/branch-name`

this way you've just created and switched to a new local branch named **_someuser_branch-name_** which contains the PR changes.

You can now recompile your core, test the PR and give your feedback about it.

To switch back to the master branch, just type:

`git checkout master`

------
**NOTE:** To test a Pull Request from another repository (a module for example), replace:

`git remote add someuser https://github.com/SOMEUSER/azerothcore-wotlk.git`

with:

`git remote add someuser https://github.com/SOMEUSER/MODULE_NAME.git`


## How to create a Pull Request

Official GitHub tutorial [here](https://help.github.com/articles/creating-a-pull-request/).

In order to create a Pull Request (PR), you have to fork the AzerothCore repository (via your web browser, using the top-right Fork button) and clone your fork locally.

If you already have a local fork, remember to [sync it](https://github.com/azerothcore/azerothcore-wotlk/wiki/Syncing-your-fork) before creating a new Pull Request.

Open a terminal and move to your local clone of the fork, then create a new branch by typing:

`git checkout -b my-branch` (Note: **my-branch** is an arbitrary name, choose whatever you want here)

Now add your changes to the code.

**IMPORTANT:** If you are going to add some database contents or structure changes, read [how to deal with SQL files](https://github.com/azerothcore/azerothcore-wotlk/wiki/Dealing-with-SQL-files) first.

Then you can commit your changes and push them:

`git commit -am "Commit message here"`

`git push my-branch`

Now via web open your repository, switch to your new branch and click to _New pull request_

IMPORTANT: remember to create **one separate PR for each feature/fix (so use a separate branch for each PR)**

### Giving credit to the author of code

If you want to submit code written by someone else, you can give credits to the author when you commit:

`git commit --author="AuthorName <authoremail@address.com>" -am "Commit message here"`

## Improve the Wiki

Do you want to improve or add a page to our wiki? Good! Let's discuss it using [our chat](https://discord.gg/PaqQRkd).