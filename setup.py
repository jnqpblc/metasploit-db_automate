import sys
usage = '\nSyntax: %s <option|clone|build|pull>\n' % (sys.argv[0])
if len(sys.argv) < 2:
        print usage
        sys.exit(1)

import os, requests
OPTION = str(sys.argv[1]).lower()

def get_repos():
  FILE = open("repositories.txt", "r")
  return FILE

def get_repos_local():
  #return sorted(os.listdir(os.getcwd()))
  return sorted(filter(os.path.isdir, os.listdir(os.getcwd())))

def run_build():
  os.system("ruby build.txt")

def clone():
  DATA = get_repos()
  for line in DATA:
    REPO = line.strip('\n').split('/')[4].replace('.git', '').lstrip('.').lower()
    USER = line.strip('\n').split('/')[3].lower()
    directory_name = REPO + '-' + USER
    if not os.path.exists(directory_name):
      os.system('git clone ' + 'https://github.com/' + USER + '/' + REPO + ' ' + REPO + '-' + USER)

def pull():
  LOCAL = get_repos_local()
  for repo in LOCAL:
    if (repo != 'resources' and repo != 'stubs' and repo != 'misc' and repo != '.git'):
      os.system('cd ' + repo + '; ' + 'pwd' + '; ' + 'git pull' + '; ' + 'cd ..')

if OPTION == 'clone':
  clone()
elif OPTION == 'build':
  run_build()
elif OPTION == 'pull':
  pull()
else:
  print '\nDammit Bobby!'
  print usage
  sys.exit(1)
