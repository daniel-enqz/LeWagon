## Background & Objectives

The [`Array` class](http://www.ruby-doc.org/core-2.4.0/Array.html) is one of the two main structures used to store and access data in ruby (the other being [Hash](http://www.ruby-doc.org/core-2.4.0/Hash.html), which we'll see tomorrow).

An array is ordered, so each element can be accessed by its **index**. This exercise will help you
understand how to create an array, how to store data in it, and finally, how to retrieve that data using the index.
Remember, array indexes start at `0`, not `1`.

Programmers are often asked to sort things, that's why you should read about some [sorting algorithms](http://en.wikipedia.org/wiki/Sorting_algorithm). Hopefully, the Ruby doc will give you several ways of sorting an [Enumerable](http://ruby-doc.org/core-2.4.0/Enumerable.html). `Array` is a form of `Enumerable`, so you can use all methods referenced on the `Enumerable` doc page while using an `Array`, because `Array` **includes** the module `Enumerable`.

## Specs

- Implement a `wagon_sort` method which takes one argument, an array of student names (`String`), and returns an array of those student names sorted alphabetically.
- The sorting method should be case insensitive, e.g. put `bob` before `Felix` (look at the [ASCII table](http://www.asciitable.com/))
- The method should keep the original spelling of the names.

### Interactive Program

Open the `interface.rb` file and make sure to use the `wagon_sort` method. It should work like this:

```bash
ruby lib/interface.rb

Type a student name:
felix
Type another student name or press enter to finish:
Cedric
Type another student name or press enter to finish:
bob
Type another student name or press enter to finish:

Congratulations! Your Wagon has 3 students:
- bob, Cedric and felix
```

## Key learning points

Get familiar with basic array operations. You should now know the syntax used to:

- create an array
- append a new element to the array
- access the nth element
- update an element
- delete a value at a given index