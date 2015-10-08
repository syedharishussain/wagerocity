//: Playground - noun: a place where people can play

import UIKit

var str = "<Hello, playground>"

var array = split(str) {$0 == "<"}
var string:String = array[0]
array = split(string){$0 == ">"}

print(array[0])

