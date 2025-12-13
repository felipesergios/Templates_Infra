# Welcome to my infra repository !

this is my codes in docker , cloud ,shell scripts and python for any uses in my jobs  
here u find composes file for deploy applications using docker with volumes and specific networks  
awaiting for news in this place

## Sumary

This table contain my compose details about docker-compose files

|   | Version | Testing |
| --- | --- | --- |
| MariaDb | `'10:3'` | 'OK,PASS' |
| Phpmyadmin | `Latest` | "OK,PASS" |

## Scripts

Scripts for comom uses build in _**python**_ and _**shell script**_

# Files

```
.
├── AWS
│   └── Template_EC2.json
├── Dev
│   ├── README.md
│   └── vscode_set.json
├── Docker
│   ├── docker-compose-mariadb.yml
│   └── docker-compose-phpmyadmin.yml
├── README.md
├── Scripts
│   ├── Linux
│   │   ├── Firewalld
│   │   │   ├── portainer.xml
│   │   │   └── Use.md
│   │   └── README.md
│   ├── Python
│   │   └── send_mail.py
│   └── Shell
│       └── backup_banco_script.sh
└── SQL
   ├── mysql
   │   ├── create_sysdba_user.sql
   │   ├── find_data.sql
   │   ├── README.md
   │   ├── verify_database_sessions.sql
   │   ├── verify_databases_size.sql
   │   └── verify_priv.sql
   └── oracle
       └── README.md
12 directories, 18 files
```

*   Sql codes need customize for your specification