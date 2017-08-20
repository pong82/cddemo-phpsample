 node("docker-test") {

     stage("Unit Test"){

     }
     stage("Deploy"){
        checkout scm
        sh "docker build -t php-sample ."
        sh '''
            SERVICES=$(docker service ls --filter name=app1 --quiet | wc -l)
            if [[ "$SERVICES" -eq 0 ]]; then
                docker service create --name app1 -p81:80 php-sample
            else
                docker service update --image php-sample app1 -p81:80
            fi
        '''
     }
 }