
if [ $1 = initconfig ]
then
# To configure blank server, uncomment the following line:
  echo "Running initial server config!"
  ansible-playbook config.yml -i hosts --ask-pass -e "user=root"
elif [ $1 = config ]
then
  echo "Running serverconfig"
  ansible-playbook config.yml -i hosts -K -e "user=grader"
elif [ $1 = deploy ]
then
# If server is configured already, run the following line:
# First we delete the compiled python files
  echo "Deleting .pyc files"
  find ../corex_flask -name "*.pyc" -type f -delete
  echo "-- OK --"
  echo "Deploying app!"
  ansible-playbook deploy.yml -i hosts
else
  echo "Please enter a valid command."
fi
