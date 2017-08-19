
if [ $1 = initconfig ]
then
# To configure blank server, uncomment the following line:
  echo "Running initial server config!"
  ansible-playbook config.yml -i hosts -e "user=ubuntu" --private-key="/home/anserio/.ssh/myFirstEC2.pem"
elif [ $1 = config ]
then
  echo "Running serverconfig"
  # Set user to the sudo user and ssh port to the ssh_port
  ansible-playbook config.yml -i hosts -e '{"user": "grader", "ansible_port": 2200}' --private-key="/home/anserio/.ssh/id_rsa"
elif [ $1 = deploy ]
then
# If server is configured already, run the following line:
# First we delete the compiled python files
  echo "Deleting .pyc files"
  find ../../Webapp-Flask/ -name "*.pyc" -type f -delete
  echo "-- OK --"
  echo "Deploying app!"
  ansible-playbook deploy.yml -i hosts -e '{"user": "grader", "ansible_port": 2200}' --private-key="/home/anserio/.ssh/id_rsa"
else
  echo "Please enter a valid command: initconfig | config | deploy"
fi
