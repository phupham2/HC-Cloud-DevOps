#appMachine
module "studer_appmachine"{
    source  = "/modules/app"
    amis    = "ami-032a2c09fc31731e9"
    instance_type   = "m4.medium"
    min_size    = 1
    max_size    = 2
    desired_count   = 1
}
# data-storage sql db 2016
module "studer_sql2016" {
    source  = "/modules/data-stores"
    allocated_storage   = 256
    engine              = "sql2016"
    engine_version      = ""
    db_port             = "1433"

}
#SQL Server Reporting Services 2012
module "studer_sql2012" {
    source  = "/modules/data-stores"
    allocated_storage   = 256
    engine              = "1"
    engine_version      = "1"
}