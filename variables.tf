variable "ec2" {
    default = [ "mongodb", "redis" ]
    # default = {
    #     mongodb = "t3.micro"
    #     redis = "t3.micro"
    #     mysql = "t3.small"

    # }
    # default = {
    #     mongodb = {
    #         instance_type = "t3.medium"
    #         ami = "ami_id"       
    # }
    # redis = "t3.micro"
    # mysql = "t3.small"

    # }
}

variable "zone_id" {
    default = "Z09150472BEG29NERJFM7"
}

variable "domain_name" {
    default = "dso86s.xyz"
}


