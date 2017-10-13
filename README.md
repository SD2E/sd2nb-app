# Instructions for Sharing Jupyter Notebooks with SD2E

## Access SD2E Portal

http://sd2e.org

## Log into Jupyter

Once you have access to SD2E, login to the jupyter hub:

https://jupyter.sd2e.org/hub/login

## Startup Jupyter and launch terminal

1. Startup your Jupyter Server by selecting the green 'My Server' button
2. Once Started, under the 'Files' menu at the top right is an 'Upload' and 'New' pulldown
3. From the new pulldown select 'Terminal'

## Share via the Terminal

1. Go to Terminal
2. add test code path to your PATH

> export PATH=$PATH:$HOME/sd2e-community/sample/.local/bin

3. Rehash

> hash -r

## Follow along with instructions from sd2nb app

1. Basic usage for SD23 Command line 

```shell

% sd2nb usage

usage: sd2nb command notebook (modifier)                                                                                            
                                                                                                                                    
  sd2nb list - Show available notebooks                                                                                             
  sd2nb search keyword - Find notebooks matching 'keyword'                                                                          
  sd2nb get notebook - Import a notebook to /home/jupyter/tacc-work/sd2nb/                                                          
  sd2nb share notebook (username) - Default is to share with everyone                                                               
  sd2nb unshare notebook (username) - Default is to unshare with everyone                                                           
                                                                                                                                    
  sd2nb shares notebook - List shares for a given notebook                                                                          
                                                                                                                                    
Email support@sd2e.org for technical assistance 
```
2. List and search available notebooks

```shell

# List available notebooks
% sd2nb list                                                                                    

gzynda-test_notebook                                                                                                                
vaughn-SD2E-App-ETL-Job-Submission-AgavePy-v0.1.0                                                                                   
vaughn-SharedNotebook  

# Search (exact match case insensitive)
% sd2nb search etl
vaughn-SD2E-App-ETL-Job-Submission-AgavePy-v0.1.0 
```

3. Ingest a copy of a notebook

```shell

# Ingest a copy of a notebook
% sd2nb get sd2eadm-ReadMeRNA_execution_script
[INFO] 2017-10-13T16:17:10Z - Importing to /home/jupyter/tacc-work/sd2nb...                                                         
######################################################################### 100.0%
[INFO] 2017-10-13T16:17:15Z - Done   

% ls /home/jupyter/tacc-work/sd2nb
sd2eadm-ReadMeRNA_execution_script.ipynb
```

4. Share your notebook with an individual user and add additional users to share

```shell

# Share with a user
# cd to a directory containing a notebook you want to share (first time only)
% sd2nb share SharedNotebook.ipynb gzynda                                                       
File/folder does not exist                                                                                                          
[INFO] 2017-10-13T15:59:24Z - Sharing as vaughn-SharedNotebook.ipynb...                                                             
[INFO] 2017-10-13T15:59:28Z - Done                                                                                                  
[INFO] 2017-10-13T15:59:34Z - READ granted on vaughn-SharedNotebook.ipynb to gzynda 

# Add a user
% sd2nb share SharedNotebook.ipynb jchuah                                                       
[INFO] 2017-10-13T16:00:07Z - READ granted on vaughn-SharedNotebook.ipynb to jchuah
```
5. Share your notebook with everyone

```shell

# Share with everyone
% sd2nb share SharedNotebook.ipynb
[INFO] 2017-10-13T16:16:17Z - READ granted on vaughn-SharedNotebook.ipynb to everyone

# See who you have shared a notebook with:
% sd2nb shares SD2E-App-ETL-Job-Submission-AgavePy                                                          
John Fonner     jfonner                                                                                                             
Authorized Users        public                                                                                                              
```

6. Update notebook (coming soon)

```shell

# Update the repository copy of a given notebook

cd $HOME/directory-where-notebook-lives
% sd2nb update SharedNotebook

# ^^ This is coming by end of day

```

## Known issues

### Invalid Credentials ###

Auth: If you get this error *Invalid Credentials* and a failure, we've failed to automatically update your API session. For now, just run the following, providing your TACC password when asked. It should give you at least 4 hours of valid session.

```shell
auth-tokens-create -S
```

### Notebook Naming conventions ###

Spaces: Please, no spaces in your notebook names now. We'll add sanitization today or tomorrow to replace_them_with_underscores before Monday 10/16
