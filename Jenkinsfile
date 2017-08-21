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
            ENV=$(curl -s http://cdtest.aimail.me/app1/env.html|grep "green"|wc -l)
            if [[ "$SERVICES" -eq 0 ]]; then
                SERVICES=$(docker service ls --filter name=app1green --quiet | wc -l)
                if [[ "$SERVICES" -eq 0 ]]; then
                    docker service create --name app1green -p81:80 pong645/php-sample
                    CONTAINER=$(docker ps | grep app1green | cut -c 1-12)
                    echo "green">env.html
                    docker cp env.html "$CONTAINER":/var/www/html/
                else
                    docker service update --image pong645/php-sample app1green
                    CONTAINER=$(docker ps | grep app1green | cut -c 1-12)
                    echo "green">env.html
                    docker cp env.html "$CONTAINER":/var/www/html/
                fi
            else
                SERVICES=$(docker service ls --filter name=app1blue --quiet | wc -l)
                if [[ "$SERVICES" -eq 0 ]]; then
                    docker service create --name app1blue -p82:80 pong645/php-sample
                    CONTAINER=$(docker ps | grep app1blue | cut -c 1-12)
                    echo "blue">env.html
                    docker cp env.html "$CONTAINER":/var/www/html/
                else
                    docker service update --image pong645/php-sample app1blue
                    CONTAINER=$(docker ps | grep app1blue | cut -c 1-12)
                    echo "blue">env.html
                    docker cp env.html "$CONTAINER":/var/www/html/
                fi
            fi
        '''
     }
 }