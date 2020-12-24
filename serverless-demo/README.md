https://github.com/snsinfu/terraform-lambda-example

go get .
GOOS=linux GOARCH=amd64 go build -o hello
zip hello.zip hello

curl -fsSL -D - "$(terraform output url)?name=Koray"