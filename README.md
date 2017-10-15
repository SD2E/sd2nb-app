# Instructions for Sharing Jupyter Notebooks Within SD2E

## Access the SD2E Portal

Go to https://sd2e.org

## Log into Jupyter

Once you have access to SD2E, login to the Jupyter Hub:

https://jupyter.sd2e.org/hub/login

## Startup Jupyter and launch a terminal

1. Startup your Jupyter Server by selecting the green 'My Server' button
2. Once Started, under the 'Files' menu at the top right is an 'Upload' and 'New' pulldown
3. From the new pulldown select 'Terminal'
4. The sd2nb program is available as an interactive command.

## Using the SD2nb program

1. Get basic usage information

```shell

% sd2nb usage

usage: sd2nb command notebook (modifier)

  sd2nb list - Show available notebooks
  sd2nb search keyword - Find notebooks matching 'keyword'
  sd2nb get notebook - Import a notebook to /Users/mwvaughn/tacc-work/sd2nb/
  sd2nb share notebook (username) - Default is to share with everyone
  sd2nb unshare notebook (username) - Default is to unshare with everyone
  sd2nb shares notebook - List shares for a given notebook
  sd2nb update notebook (delete) - Update or delete a shared notebook

IMPORTANT: If sharing/unsharing a notebook with spaces, please include "double quotes" around the notebook name

Version: 0.1.0 | Help: support@sd2e.org
```

2. List and search shared notebooks available to you

```shell

# List available notebooks
% sd2nb list                                                                                    

gzynda-test_notebook
vaughn-SD2E-App-ETL-Job-Submission-AgavePy-v0.1.0                                                                    vaughn-SharedNotebook  

# Search (exact match case insensitive)
% sd2nb search etl

vaughn-SD2E-App-ETL-Job-Submission-AgavePy-v0.1.0 
```

3. Retrieve a shared notebook from the repository

```shell

% sd2nb get sd2eadm-ReadMeRNA_execution_script
[INFO] 2017-10-13T16:17:10Z - Importing to /home/jupyter/tacc-work/sd2nb...                                                         
######################################################################### 100.0%
[INFO] 2017-10-13T16:17:15Z - Done   

# The notebook is copied to your personal persistent storage area. You're free
# to move it, rename it, edit it, etc.

% ls /home/jupyter/tacc-work/sd2nb

sd2eadm-ReadMeRNA_execution_script.ipynb
```

4. Share one of your notebooks with individual users

IMPORTANT: If your notebook has spaces in the name, please put the notebook name in double quotes, it will replace spaces with underscores.

```shell

# Share with a user
# cd to a directory containing a notebook you want to share (first time only)

% sd2nb share "Shared Notebook.ipynb" gzynda
File/folder does not exist                                                                                                          
[INFO] 2017-10-13T15:59:24Z - Sharing as vaughn-SharedNotebook.ipynb...                                                             
[INFO] 2017-10-13T15:59:28Z - Done                                                                                                  
[INFO] 2017-10-13T15:59:34Z - READ granted on vaughn-SharedNotebook.ipynb to gzynda 

# Share with another user
# Once a notebook is uploaded to the repository you can share with more people
% sd2nb share SharedNotebook.ipynb jchuah                                                       
[INFO] 2017-10-13T16:00:07Z - READ granted on vaughn-SharedNotebook.ipynb to jchuah
```

5. Share your notebook with everyone

```shell

# Share with everyone
# If you want a notebook to be readable by everyone in the SD2 program, simply share
# it without specifying a user name. 

% sd2nb share SharedNotebook.ipynb
[INFO] 2017-10-13T16:16:17Z - READ granted on vaughn-SharedNotebook.ipynb to everyone

# See who you have shared a notebook with:
% sd2nb shares SD2E-App-ETL-Job-Submission-AgavePy                                                          
John Fonner       jfonner                       
Authorized Users  public

```

6. Update a shared notebook

```shell

# Update the repository copy of a given notebook

cd $HOME/directory-where-notebook-lives
% sd2nb update SharedNotebook

# Users who have downloaded a copy of the previous version won't currently be notified
# that a new version is available. Use the shares command to find out who you might
# need to notify of an updated notebook version.

```

7. Delete a shared notebook

```shell
% sd2nb update SharedNotebook delete

# This will not delete any local copies other users have made, nor will it
# delete your local version of the notebook
```

## Known issues

## Getting Help and Reporting Issues

* Get immediate help by emailing support@sd2e.org
* Suggest improvements, fixes, or features at the [project GitHub repository][2]


## Credits

SD2nb relies on [bashids][2], a pure-bash implementation of the hashid algorithm, to generate short universal identifiers.

[1]: https://github.com/SD2E/sd2nb-app/issues
[2]: https://github.com/benwilber/bashids