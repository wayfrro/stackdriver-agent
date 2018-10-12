## Stackdriver agent in docker container

It is not possible currently to run stackdriver-agent on Ubuntu newer then 16.04. 
We can, however, run in with docker on any Ubuntu version with. Specifically, 
it will work well on Ubuntu 18.04, or just, whatever. 

That was based on https://hub.docker.com/r/wikiwi/stackdriver-agent/ initially, 
but I wanted something totally simple what would just work in my case. 

**NOTE:** That assumes running it on GCP instances with properly configured 
          service accounts. If it's not the case, you will need to set up 
          some authorization. 

Run it with docker on an instance: 

    docker run -d --restart=always \
      --name stackdriver-agent \
      --net=host \
      --pid=host \
      --privileged \
      poeyashi/stackdriver-agent:latest


## Set it up in kubernetes cluster:

    kubectl apply -f stackdriver-agent.yaml

 
