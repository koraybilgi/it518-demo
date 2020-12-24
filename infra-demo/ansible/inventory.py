#!/usr/bin/env python3
import json
import os

class TerraformInventory(object):
    def __init__(self):
        output = os.popen("terraform output -json -state=/vagrant/infra-demo/terraform/terraform.tfstate")
        terraform_json = json.loads(output.read().strip())

        # Print Inventory ---------------------------------------------
        ws_public_ip  = terraform_json['webhost_public_ip']['value']
        db_public_ip  = terraform_json['db_public_ip']['value']
        db_private_ip = terraform_json['db_private_ip']['value']

        json_output =  {
            'webhost': {
                'hosts': [ws_public_ip],
            },
            'db': {
                'hosts': [db_public_ip],
            },
            'all': {
                'vars': {
                    'ws_public_ip': ws_public_ip,
                    'db_public_ip': db_public_ip,
                    'db_private_ip': db_private_ip,
                }
            }
        }
        
        print(json.dumps(json_output))

TerraformInventory()