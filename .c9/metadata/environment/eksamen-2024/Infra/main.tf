{"filter":false,"title":"main.tf","tooltip":"/eksamen-2024/Infra/main.tf","undoManager":{"mark":10,"position":10,"stack":[[{"start":{"row":0,"column":0},"end":{"row":20,"column":0},"action":"insert","lines":["terraform {","  required_version = \">= 1.9\"","  required_providers {","    aws = {","      source  = \"hashicorp/aws\"","      version = \"5.74.0\"","    }","  }","","  backend \"s3\" {","    bucket         = \"pgr301-2024-terraform-state\"","    key            = \"lambda-sqs-integration/terraform.tfstate\"","    region         = \"us-east-1\" # Endre hvis nødvendig","    encrypt        = true","  }","}","","provider \"aws\" {","  region = \"us-east-1\" # Endre hvis nødvendig","}",""],"id":1}],[{"start":{"row":12,"column":22},"end":{"row":12,"column":24},"action":"remove","lines":["us"],"id":2},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["e"]},{"start":{"row":12,"column":23},"end":{"row":12,"column":24},"action":"insert","lines":["u"]}],[{"start":{"row":12,"column":25},"end":{"row":12,"column":29},"action":"remove","lines":["east"],"id":3},{"start":{"row":12,"column":25},"end":{"row":12,"column":26},"action":"insert","lines":["w"]},{"start":{"row":12,"column":26},"end":{"row":12,"column":27},"action":"insert","lines":["e"]},{"start":{"row":12,"column":27},"end":{"row":12,"column":28},"action":"insert","lines":["s"]},{"start":{"row":12,"column":28},"end":{"row":12,"column":29},"action":"insert","lines":["t"]}],[{"start":{"row":12,"column":33},"end":{"row":12,"column":55},"action":"remove","lines":["# Endre hvis nødvendig"],"id":4}],[{"start":{"row":18,"column":12},"end":{"row":18,"column":13},"action":"remove","lines":["u"],"id":5},{"start":{"row":18,"column":15},"end":{"row":18,"column":16},"action":"insert","lines":["u"]}],[{"start":{"row":18,"column":12},"end":{"row":18,"column":13},"action":"remove","lines":["s"],"id":7}],[{"start":{"row":18,"column":12},"end":{"row":18,"column":13},"action":"insert","lines":["e"],"id":8},{"start":{"row":18,"column":13},"end":{"row":18,"column":14},"action":"insert","lines":["w"]}],[{"start":{"row":18,"column":13},"end":{"row":18,"column":14},"action":"remove","lines":["w"],"id":9}],[{"start":{"row":18,"column":13},"end":{"row":18,"column":14},"action":"insert","lines":["u"],"id":10}],[{"start":{"row":18,"column":15},"end":{"row":18,"column":20},"action":"remove","lines":["euast"],"id":11},{"start":{"row":18,"column":15},"end":{"row":18,"column":16},"action":"insert","lines":["w"]},{"start":{"row":18,"column":16},"end":{"row":18,"column":17},"action":"insert","lines":["e"]},{"start":{"row":18,"column":17},"end":{"row":18,"column":18},"action":"insert","lines":["s"]},{"start":{"row":18,"column":18},"end":{"row":18,"column":19},"action":"insert","lines":["t"]}],[{"start":{"row":18,"column":22},"end":{"row":18,"column":45},"action":"remove","lines":[" # Endre hvis nødvendig"],"id":12}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":18,"column":22},"end":{"row":18,"column":22},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1732282915824,"hash":"ac94e16c2e7b69e561fce60f8a80c067034eb17f"}