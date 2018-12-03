module "studer"{
    source  = "/modules/app"
    amis    = "ami-032a2c09fc31731e9"
    min_size    = 1
    max_size    = 2
    desired_count   = 1
}