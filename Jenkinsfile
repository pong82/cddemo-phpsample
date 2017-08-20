 node("docker-test") {

     stage("Checkout"){
        checkout scm
     }
     stage("Build"){
         docker.withRegistry('https://hub.docker.com/', 'docker-login') {
            docker.build('pong645/php-sample').push('latest')
            }
        /*
        sh "docker build -t php-sample ."
        sh '''
            SERVICES=$(docker service ls --filter name=app1 --quiet | wc -l)
            if [[ "$SERVICES" -eq 0 ]]; then
                docker service create --name app1 -p81:80 php-sample
            else
                docker service update --image php-sample app1
            fi
        '''*/
     }
 }