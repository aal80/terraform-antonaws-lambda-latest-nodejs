provider "aws" {

}

resource "random_pet" "function_name" {
  length = 2
}

module "my_function" {
    source = "../"
    function_name = random_pet.function_name.id
    src_dir = "src"
}