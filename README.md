# AWS Solutions Architect Associate (AWS- SAA)

Una raccolta di esempi pratici, laboratori e configurazioni dedicate ai principali servizi AWS, progettata per supportare lo studio della certificazione AWS Certified Solutions Architect – Associate (SAA- C03) e la sperimentazione di architetture cloud.

## Obiettivo

Questo repository raccoglie implementazioni, template e configurazioni che illustrano il funzionamento dei servizi AWS più utilizzati nella progettazione di soluzioni scalabili, sicure, resilienti ed economicamente efficienti.

È pensato sia come materiale di studio sia come ambiente di sperimentazione per comprendere i concetti fondamentali dell'ecosistema AWS.

## Contenuti

Il repository include esempi relativi a numerosi servizi AWS, tra cui:

Compute

EC2
Lambda
Auto Scaling Groups
Elastic Beanstalk

Storage

Amazon S3

Networking

VPC
Egress-Only Internet Gateway

Database

Amazon RDS
Amazon Aurora
Amazon ElastiCache
Amazon MemoryDB

Messaging & Integration

Amazon SNS
Amazon SQS
AWS Step Functions

Analytics & Data- 

AWS Glue

Machine Learning & AI 

Amazon Rekognition
Amazon Textract
Amazon Translate
Amazon Comprehend
Amazon Polly
Amazon Personalize
Amazon Kendra

Security & Governance

IAM
AWS CloudTrail

Infrastructure as Code 

AWS CloudFormation
Terraform

## Struttura del repository

```text
AWS- SAA/
├── api/
├── asg/
├── aurora/
├── cfn/
├── cloudtrail/
├── ec2/
├── elasticache/
├── eb/
├── glue/
├── iam/
├── kendra/
├── lambda/
├── memorydb/
├── personalize/
├── polly/
├── rds/
├── rekognition/
├── s3/
├── sns/
├── sqs/
├── step- functions/
├── terraform/
├── textract/
├── translate/
└── vpc/
```

Ogni cartella contiene esempi indipendenti focalizzati su uno specifico servizio o scenario architetturale.

## Prerequisiti

Per eseguire gli esempi è consigliato avere installato:

- AWS CLI configurata con un account AWS
- Terraform (per gli esempi dedicati)
- Docker (ove richiesto)
- Git

## Utilizzo

Clona il repository:

```bash
git clone <repository- url>
cd AWS- SAA
```

Accedi quindi alla cartella del servizio di interesse e segui le istruzioni o gli script presenti.

## Finalità didattica

Questo repository ha esclusivamente scopo educativo e dimostrativo.

Gli esempi sono progettati per comprendere:

- progettazione di architetture AWS
- sicurezza e gestione delle identità
- networking e connettività
- alta disponibilità e resilienza
- automazione dell'infrastruttura
- integrazione tra servizi AWS
- best practice consigliate da AWS

