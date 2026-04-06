{
  "application": {
    "name": "test-app",
    "environment": "production",
    "debug": true,
    "secret_key": "supersecret123",
    "api_keys": {
      "aws_access_key": "AKIA123456EXAMPLE",
      "aws_secret_key": "abcd1234secretkey"
    }
  },
  "database": {
    "host": "0.0.0.0",
    "port": 3306,
    "username": "root",
    "password": "root123",
    "encryption": false
  },
  "storage": {
    "s3_bucket": "my-public-bucket",
    "public_access": true,
    "allow_cross_account": true,
    "policy": {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "*"
    }
  },
  "network": {
    "security_groups": [
      {
        "name": "open-sg",
        "inbound_rules": [
          {
            "port": "22",
            "protocol": "tcp",
            "source": "0.0.0.0/0"
          },
          {
            "port": "3389",
            "protocol": "tcp",
            "source": "0.0.0.0/0"
          }
        ]
      }
    ]
  },
  "iam": {
    "users": [
      {
        "username": "admin",
        "mfa_enabled": false,
        "policies": [
          {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
          }
        ],
        "access_keys": [
          {
            "id": "AKIAOLDKEY123",
            "age_days": 180,
            "active": true
          }
        ]
      }
    ]
  },
  "logging": {
    "enabled": false,
    "cloudtrail": false,
    "config": false
  },
  "compute": {
    "ec2": {
      "public_ip": true,
      "imds_version": "v1",
      "user_data": "#!/bin/bash\necho 'password=admin123'"
    }
  },
  "waf": {
    "enabled": false,
    "rules": []
  }
}
