name: Test Docker Build

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Build Docker Image
        run: docker build -t my-cowsay-image .

      - name: Run Docker Container
        run: docker run --rm my-cowsay-image > output.txt

      - name: Check Output
        run: |
          cat output.txt
          grep "hello" output.txt || (echo "Test Failed" && exit 1)
