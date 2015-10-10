# coding-exercises
Having some fun with Ruby and code challenges


JavaScript Regular Expression Excerise 

To keep the HTML clean I have moved the JS into a separate file which can later be used in other projects or parts of the website that require similar functionality. The JavaScript iterates through each of the tr in the table and uses  RegEx to parse necessary information and then evaluates whether or not the node should be removed from the DOM. It does this in
a single sweep so as to maximize memory usage and runtime as opposed to building a list with all of the records. In addition it only corrects the records titilization for those that the user will see as it would be unnecessary to do this for all records

movies.html
/js/movies.js


Yaml Parsing - Music

As I am new to Ruby I did have to research quite a bit on Ruby to learn basic syntax etc. to implement my algorithm. I also used ostruct which appears to come with Ruby so I suppose its not third party. The code for this exercise first loads the YAML using YAML which allows the developer to use [] out of the box. The second part is a little trickier. I could have gone down the path of binding the data to a model object but then I discovered OpenStruct and after some time realized to make this work for all cases I could recursively call a method until the YAML has been parsed to create a new object with the hash and the nested arrays of data which satisfying the challenge presented. 

code/music_parser.rb

Fibonacci Sequence 

Initially I used recursion to calculate the Nth number in the sequence however this proved to be very slow in terms of runtime since it would exponentially increase. After scraping that and reading Wikapedia I
decided to use Ruby’s Math library to calculate the Nth number with Binet’s formula which dramatically increased runtime and appears to be the better solution. I also added two argument errors for Numeric and Positive only values.

code/fibonacci.rb
