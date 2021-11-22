git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
cd boxfuse-sample-java-war-hello
mv ../Dockerfile .
docker build -t my_java_app:1.0.0 .