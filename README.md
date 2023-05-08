# D2b data cloud resouce deploymennt with IAC

## Architecture 
<img src="docs_resource\arch.png">

## Folder structure
Deploy                          
└── stage                               
    ├── storage                         
    │   ├── s3                              
    │   │   ├── qualified_layer                             
    │   │   ├── raw_layer                               
    │   │   └── helper_bucket                       
    │   └── workflow                    
    │       ├── glue                
    │       │   ├── ingestion_layer             
    │       │   └── processing_layer                    
    │       └── lambda              
    │           └── ingestion_batch_layer               
    |           └── ingestion_ral_time_layer                
    └── scripts             
    |   ├── lambda          
    |   |
    |   └── glue.                      
    |
    |
    └── data            
        ├── file.csv                


## Backend and deployment
Each resource in the system has a decoupled backend, which means that each resource has its own individual backend. The storage and workflow resources also have their own backends. This separation ensures that backends that require frequent deployment are not accidentally affected in the event of a problem.

With each resource having a different backend, they also have different deployment processes. For example, suppose a company has a large lambda resource usage, with each resource represented by its own file. This approach provides scalability and ease of use among workers.

## Backend resource
This project uses an s3 bucket to store the state file, and dynamodb for locking.


bucket
    ├── stage                           
    │   ├── workflow                            
    │   │   ├── glue                        
    │       │   └── terraform.tfstate                   
    │   │   └── lambda                          
    │   │       └── terraform.tfstate                           
    │   └── storage                     
    │       └── s3                          
    │           └── terraform.tfstate
    │
    └── global                      
        └── main_backend_for_state_and_lock_resources                   

## Modules
Each resource has its own module, such as the S3 module, which comes with a policy attachment resource. The Glue module, on the other hand, allows you to specify if it creates a role and trigger or pass an existing one as a parameter.

## Deployment user
An OIDC role has been created with a restricted trust policy that permits only certain providers and repositories to utilize the role. The role has been granted permission to exclusively create the resources it requires.

## Data workflow
The data workflow currently consists of both Lambda and Glue for processing data from the source to the raw layer, and then to the processing layer. I have included some helper scripts and data to facilitate testing the workflow. The Lambda job script retrieves Github activity data and stores it in the raw layer storage, while the Glue job accesses the data dumped in the raw layer during creation, processes it, and stores the resulting data in the processed_layer storage.

<img src="docs_resource\lambda.png">
<img src="docs_resource\glue.png">
<img src="docs_resource\raw.png">
<img src="docs_resource\processed.png">
