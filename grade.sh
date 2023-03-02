CPATH='".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -e ListExamples.java ]]
then echo "ListExamples.java Found"
else echo "Cannot find ListExamples.java"
fi

cp ../TestListExamples.java ./
javac -cp $CPATH *.java 2> javac-errors.txt
if [[ $? -ne 0 ]]
then echo "error in compile"
else echo "Compiled successfully!!"
fi 

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 2> java-errors.txt
