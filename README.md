icinga2
=======

Simple role to install a single node (unsecured) Icinga2 with Icinga Web 2. Development is still in an early stage and usage in production is not suggested!

Icinga Web 2 does not provide a nice way to automate the installation process. Instead it is relying strongly on its SetupWizzard (follow their documentation). To allow a fully automated installation, this role supports the option to install an initial basic auth authentication, setting some default configs and installing the monitoring module.

!!! This is only suggested to be used in Lab environments!

Role Variables
--------------

    icinga2_install_icinga2: True # Install Icinga2
    icinga2_install_monitoring: True # Install Monitoring Plugins (https://www.monitoring-plugins.org/)

    # Icinga2 stores its data in a database
    icinga2_db_host: localhost
    icinga2_db_port: 3306
    icinga2_db_name: icinga2
    icinga2_db_user: icinga2
    icinga2_db_password: icinga2
    # Set the password for the api root user
    icinga2_api_root_password: icinga2
    # Set the credentials for the icinga web 2 access to the icinnga2 api (necessary for the monitoring module)
    icinga2_api_web_user: icingaweb2
    icinga2_api_web_password: icingaweb2

    icingaweb2_install_web: True # Install Icinga Web 2

    # Icinga Web 2 requires its own database for Access management
    icingaweb2_db_host: localhost
    icingaweb2_db_port: 3306
    icingaweb2_db_name: icingaweb2
    icingaweb2_db_user: icingaweb2
    icingaweb2_db_password: icingaweb2

    # Initialize Icinga Web 2 with basicauth or database authentication (only one is possible)
    icingaweb2_initialize_basicauth: False
    icingaweb2_initialize_dbauth: False
    # default admin user for the authentification
    icingaweb2_default_user: icingaadmin
    icingaweb2_default_password: icingaadmin
    # Install the monitoring module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_monitoring: False
    # Install the reporting module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_reporting: False
    # the reporting module requires its own database
    icingaweb2_reporting_db_host: localhost
    icingaweb2_reporting_db_port: 3306
    icingaweb2_reporting_db_name: reporting
    icingaweb2_reporting_db_user: reporting
    icingaweb2_reporting_db_password: reporting
    # Install the businessprocess module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_businessprocess: False
    # Install the x509 (Icinga Certificate Monitoring) module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_x509: False
    # the x509 module requires its own database
    icingaweb2_x509_db_host: localhost
    icingaweb2_x509_db_port: 3306
    icingaweb2_x509_db_name: x509
    icingaweb2_x509_db_user: x509
    icingaweb2_x509_db_password: x509
    # Install the graphite module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_graphite: False
    # the x509 module requires its own database
    icingaweb2_graphite_host: localhost
    icingaweb2_graphite_port: 2003
    icingaweb2_graphite_web_host: localhost
    icingaweb2_graphite_web_port: 80
    # Only set, if authentication necessary
    icingaweb2_graphite_user: root
    icingaweb2_graphite_password: root
    # Install the elasticsearch module (either basicauth or database authentication is necessary)
    icingaweb2_install_module_elasticsearch: False
    # the elasticsearch module needs to connect to elasticsearch
    icingaweb2_elasticsearch_protocol: http
    icingaweb2_elasticsearch_host: localhost
    icingaweb2_elasticsearch_port: 9200
    icingaweb2_elasticsearch_user: ""
    icingaweb2_elasticsearch_password: ""
    icingaweb2_elasticsearch_ca: ""
    icingaweb2_elasticsearch_client_certificate: ""
    icingaweb2_elasticsearch_client_private_key: ""


Example Playbook
----------------

    - hosts: icinga2
      roles:
         - { role: andrelohmann.icinga2 }

License
-------

MIT

Author Information
------------------

https://github.com/andrelohmann
