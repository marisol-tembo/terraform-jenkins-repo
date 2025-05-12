- name: I want to create users and groups
  hosts: tembos
  become: true
  tasks:
   - name: create group1
     group:
      name: family
      state: present
   - name: create users
     user:
      name: Martin 
      comment: admin
      groups: family        