ansible-role-tomcat8
====================

Ansible role to install Tomcat8 from apache.org tar.gz dist file.

Requirements
------------

- wget

Role Variables
--------------

(Required) Tomcat admin username and password: `ansible_tomcat8_admin_user: { name: 'admin', password: 'pAsSw00rd' }`
(Optional) CATALINA_OPTS parameters: `ansible_tomcat8_CATALINA_OPTS: '-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n -Xms512M -Xmx1024M -server -XX:+UseParallelGC'`

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ansible-role-tomcat8, ansible_tomcat8_admin_user: { name: 'admin', password: 'pAsSw00rd' }, ansible_tomcat8_CATALINA_OPTS: '-Xms512M -Xmx1024M -server -XX:+UseParallelGC'  }

License
-------

MIT

Author Information
------------------

Igor Mikhaylov <igor.mikhailov@gmail.com>, http://dev366.com
