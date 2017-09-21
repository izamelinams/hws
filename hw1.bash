Grep 
#grep stands for "global regular expression print". It searches files for lines that match a pattern and returns the results. It is case sensitive.
$ grep "Mount" mountains.txt

#Would display the word "Mount" contained on that text file
#If we are interested on counting how many times that word appears on the file we change '-w' to '-c'

#For exploring context we can use: head, more, less and tail.

Sed
#sed stands for "stream editor". It accepts standard input and modifies it based on an expression, before displaying it as output data.

# The command 'seq' prints a sequence of numbers 
$seq -f "Line %g" 10 | tee lines
#would print Line 1 to Line 10

#To modify the lines shown we can use the following commands:
$<lines head -n 3
#Wil show the first 3 lines

#Other ways of writing this command:
$head -n 3 lines
$<lines sed -n '1,3p'

#This last command will show the lines only between those numbers Ex:
$<lines sed -n '7,14p'
#Would print Lines 7 to 14

#If we want to show the last lines:
$<lines tail -n 3

#If we add a '+'  we show the lines that are above that number 
$<lines tail -n +3

Awk

#awk command searches files for text containing a pattern. When a line or text matches, awk performs a specific action on that line/text. The Program statement tells awk what operation to do
Again we can use awk command for making actions to our lines
$<lines awk 'NR<=9' 
#would print the ninth and under lines

#We can also use awk to print odd or even lines
<lines awk 'NR%2'
#Would print uneven lines

#And '(NR+1)%2' would print even lines

#We can also use sed and lines command to do this actions:
#Even: <lines sed -n '0~2p'
#Odd: <lines sed -n '1~2p'

#Awk can also do things such as printing a row or column on a csv file or so.For prinitng a column it would look like this:
awk -F',' '{print $1}' file.csv

Tr 

#If we want to modify lines of text we can use 'tr' that automatically translates (substitutes, or maps) one set of characters to another.

 $echo "hello world" | tr ' ' '_'

#Would 'trim' the blank spaces of "hello world" and replace them with "_":
$echo "hello_world"

#It can also modify or remove letters 
 $echo "Hello World!" | tr '[A-Z]'
ello orld!


Loops

Looping statements are used to force a program to repeatedly execute a statement. The executed statement is called the loop body.


For loop:

#!/bin/bash
for ((number=1;number < 100;number++))
{
if (( $number % 5 == 0 ))
then
echo "$number is divisible by 5 "
fi
}
exit 0

#It would print all number divisible by 5 from 1 to 100
For loops can do more than iterate lists of numbers. You can actually use the output of other commands as the list. For example changing things inside of files or printing content

While loops: 
The while executes a piece of code if the control expression is true, and only stops when it is false (or a explicit break is found within the executed code.


 #!/bin/bash 
         COUNTER=0
         while [  $COUNTER -lt 10 ]; do
             echo The counter is $COUNTER
             let COUNTER=COUNTER+1 
         done
         
Until

The until loop is very similar to the while loop, except that the loop executes until the TEST-COMMAND executes successfully. As long as this command fails, the loop continues.
#!/bin/bash
#
count=1
until [ $count -gt 5 ]
do
  printf "Count has a value of $count\n"
  ((count++))
done

