#/bin/bash

#Clean
rm -f reports/*.html
rm -f failed.test
inspec init profile nginx --overwrite
rm nginx/controls/example.rb

for nodes in `cat nodes.txt | awk '{ print $2}'`
do
	x=`date '+%Y%m%d%H%M%S'`
	y=`grep $nodes nodes.txt | awk '{ print $1 }'`
	z=`echo $y-$x`
	inspec exec nginx -i murillo-lab-spinnaker.pem --user=ec2-user -t ssh://$nodes --reporter html > reports/inspec_$z.html
	if [ "$?" -ne 0 ]; then
    		echo "$y" >> failed.test
	fi
	/usr/bin/aws s3 cp reports/inspec_$z.html s3://murillo-labs-repo/inspec/
done

if [ -f "failed.test" ]
then
	echo "Tested failed for:"
	cat failed.test
	exit 100
else
	echo "No failed tests"
	exit 0
fi
