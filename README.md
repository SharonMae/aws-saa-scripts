# AWS Solutions Architect Associate (AWS-SAA)

Una raccolta di esempi pratici, laboratori e configurazioni dedicate ai principali servizi AWS, pensata per supportare lo studio della certificazione AWS Certified Solutions Architect – Associate (SAA-C03) e la sperimentazione di architetture cloud.

---

## Obiettivo

Questo repository raccoglie implementazioni, template e configurazioni che illustrano il funzionamento dei servizi AWS più utilizzati nella progettazione di soluzioni scalabili, sicure, resilienti ed economicamente efficienti.

È pensato sia come materiale di studio sia come ambiente di sperimentazione per comprendere i concetti fondamentali dell'ecosistema AWS.

---

## Contenuti

Il repository include esempi relativi a numerosi servizi AWS, organizzati per area:

Compute
- EC2 (incluso user data e connessione via EC2 Instance Connect)
- Lambda (funzioni inline, pacchetto zip locale/remoto, container image)
- Auto Scaling Groups
- Elastic Beanstalk

Storage
- Amazon S3 (ACL, policy, crittografia, CORS, versioning, checksum/etag, SDK, IaC e altro)

Networking
- VPC (subnet, security group, NACL, VPC peering, NAT Gateway, interface endpoint)
- Egress-Only Internet Gateway

Database
- Amazon RDS
- Amazon Aurora
- Amazon ElastiCache
- Amazon MemoryDB

Messaging & Integration
- Amazon SNS
- Amazon SQS (standard e FIFO)
- AWS Step Functions

Analytics & Data
- AWS Glue (Data Catalog)

Machine Learning & AI
- Amazon Rekognition
- Amazon Textract
- Amazon Translate
- Amazon Comprehend
- Amazon Polly
- Amazon Personalize
- Amazon Kendra

Security & Governance
- IAM (policy e tipologie di policy)
- AWS STS (Security Token Service)
- AWS CloudTrail (base e integrazione con CloudWatch)

Infrastructure as Code
- AWS CloudFormation
- Terraform

---

## Struttura del repository

```text
aws-saa-scripts/
├── api/                            # AWS STS e altre chiamate API
├── asg/                            # Auto Scaling Groups
├── aurora/                         # Amazon Aurora
├── bin/                            # Script di installazione dei tool CLI
├── cfn/                            # Template AWS CloudFormation
├── cloudtrail/                     # AWS CloudTrail
├── comprehend/                     # Amazon Comprehend
├── eb/                             # Elastic Beanstalk
├── ec2/                            # EC2 (user data, ecc.)
├── egress-only-internet-gateway/   # Egress-Only Internet Gateway
├── elasticache/                    # Amazon ElastiCache
├── glue/                           # AWS Glue Data Catalog
├── iam/                            # IAM (policy e ruoli)
├── kendra/                         # Amazon Kendra
├── lambda/                         # AWS Lambda (inline, zip, container)
├── memorydb/                       # Amazon MemoryDB
├── personalize/                    # Amazon Personalize
├── polly/                          # Amazon Polly
├── rds/                            # Amazon RDS
├── rekognition/                    # Amazon Rekognition
├── s3/                             # Amazon S3
├── sns/                            # Amazon SNS
├── sqs/                            # Amazon SQS (standard e FIFO)
├── step-functions/                 # AWS Step Functions
├── terraform/                      # Configurazioni Terraform
├── textract/                       # Amazon Textract
├── translate/                      # Amazon Translate
├── vpc/                            # Amazon VPC
├── ssh.dockerfile                  # Esempio di connessione SSH via EC2 Instance Connect
├── .devcontainer/                  # Configurazione Dev Container
└── .gitpod.yml                     # Configurazione Gitpod
```

Ogni cartella contiene esempi indipendenti focalizzati su uno specifico servizio o scenario architetturale, spesso corredati da un proprio `Readme.md` con istruzioni di dettaglio.

---

## Prerequisiti

Per eseguire gli esempi è consigliato avere installato:

- [AWS CLI](https://aws.amazon.com/cli/), configurata con un account AWS (`aws configure`)
- [AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html), per gli esempi Lambda
- [Terraform](https://developer.hashicorp.com/terraform/install), per gli esempi dedicati
- [Docker](https://www.docker.com/), ove richiesto (es. Lambda container image)
- [Git](https://git-scm.com/)

---

## Avvio rapido

Il repository include configurazioni pronte per ambienti di sviluppo cloud:

- Gitpod: apri il repository con [Gitpod](https://www.gitpod.io/) e l'ambiente verrà configurato automaticamente secondo `.gitpod.yml` (installazione di AWS CLI, Terraform, AWS CDK, ecc.).
- Dev Container: apri il repository in VS Code con l'estensione [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers); la configurazione in `.devcontainer/devcontainer.json` include già l'AWS CLI.

---

## Utilizzo

Clona il repository:

```bash
git clone https://github.com/<tuo-utente>/aws-saa-scripts.git
cd aws-saa-scripts
```

Accedi quindi alla cartella del servizio di interesse e segui le istruzioni riportate nel relativo `Readme.md` (dove presente) o negli script disponibili, ad esempio:

```bash
cd sqs/standard
cat Readme.md
./bin/deploy
```
---

## Script di utilità

La cartella `bin/` contiene alcuni script di supporto per installare rapidamente i tool CLI necessari:

| Script | Descrizione |
| --- | --- |
| `aws_cli_install.sh` | Installa l'AWS CLI |
| `aws_sam_cli_install.sh` | Installa l'AWS SAM CLI |
| `terraform_cli_install.sh` | Installa Terraform |
| `powershell_cli_install.sh` | Installa PowerShell (per gli script `.ps1`, es. `ec2/userdata`) |

Molti sotto-progetti includono inoltre una propria cartella `bin/` con script dedicati (`deploy`, `build`, `send`, `receive`, ecc.) per semplificare il deploy e il test dei singoli esempi.

---

## Finalità

Questo repository ha scopo educativo e dimostrativo. Gli esempi sono progettati per approfondire:

- progettazione di architetture AWS
- sicurezza e gestione delle identità
- networking e connettività
- alta disponibilità e resilienza
- automazione dell'infrastruttura (IaC)
- integrazione tra servizi AWS
- best practice consigliate da AWS

---

## Disclaimer

Gli esempi presenti in questo repository sono destinati a scopi di apprendimento e test. Il deploy delle risorse descritte può comportare costi sul tuo account AWS: ricordati di eliminare (`destroy`/`delete`) le risorse create al termine degli esperimenti per evitare addebiti indesiderati.