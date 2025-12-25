# making a calculator using shell script.
# author of the script Rizwan.
# this script will avilable in github.@ Rizoffice
# script for calculation
echo "enter any number"
read a
echo  "enter any number"
read b
echo "enter the operation to be performed"  
echo "enter + for addition" 
echo "enter - for subtraction"
echo "enter * for multiplication"
echo "enter / for division"
echo "enter % for modulus"
echo "enter ^ for power"
echo "enter ! for factorial"


read c
if [ $c = "+" ]
then
echo "the sum is $((a+b))"
elif [ $c = "-" ]
then
echo "the difference is $((a-b))"
elif [ $c = "*" ]
then
echo "the product is $((a*b))"
elif [ $c = "/" ]
then
echo "the quotient is $((a/b))"
elif [ $c = "%" ]
then
echo "the remainder is $((a%b))"
elif [ $c = "^" ]
then
echo "the power is $((a**b))"
elif [ $c = "!" ]
then
fact=1
for((i=1;i<=a;i++))
do
fact=$((fact*i))
done
echo "the factorial is $fact"
else
echo "invalid operation"
fi
