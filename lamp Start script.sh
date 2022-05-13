#!/bin/bash
#This is script for restart Lampp
/opt/lampp/lampp start
systemctl restart openfire
systemctl status  openfire
exit
