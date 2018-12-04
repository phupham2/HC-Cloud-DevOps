module "studer"{
    #app
    source  = "/modules/app"
    amis    = "ami-032a2c09fc31731e9"
    min_size    = 1
    max_size    = 2
    desired_count   = 1
    
    # data-storage
    allocated_storage   = 256
    engine              = "sql"
    instance_class      = ""
    username            = ""
    password            = ""
}