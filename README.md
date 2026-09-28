# home-assignment

Solution for each task can be found in its dedicated directory.

- [Exercise 1](exercise-1/)
- [Exercise 2](exercise-2/)
- [Exercise 3](exercise-3/)

Exercises 1 and 2 use reusable modules maintained in separate repositories: [VPC](https://github.com/benkorichard/terraform-aws-vpc) and [S3 bucket](https://github.com/benkorichard/terraform-aws-s3-bucket).

They also have a dedicated github workflow each, that run terraform plan against my private AWS org in order to review them easily.

The workflows plan only; they do not apply changes.
