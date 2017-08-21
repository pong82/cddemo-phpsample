 node("docker-test") {

     stage("Checkout"){
        checkout scm
     }
     stage("Build"){
         docker.withRegistry('', 'docker-login') {
            docker.build('pong645/php-sample').push('latest')
            }
         docker.withRegistry('', 'docker-login') {
            docker.build('pong645/php-sample').push(env.BUILD_NUMBER)
            }
     }
     stage("Deploy"){
        sh '''
            SERVICES=$(docker service ls --filter name=app1 --quiet | wc -l)
            if [[ "$SERVICES" -eq 0 ]]; then
                docker service create --name app1 -p81:80 pong645/php-sample
                CONTAINER=$(docker ps | grep app1 | cut -c 1-12)
                echo "green">env.html
                docker cp env.html "$CONTAINER":/var/www/html/
            else
                docker service update --image pong645/php-sample app1
                CONTAINER=$(docker ps | grep app1 | cut -c 1-12)
                echo "green">env.html
                docker cp env.html "$CONTAINER":/var/www/html/
            fi
        '''
     }
 }