XojoEZUnit
========

A Unit Testing framework for Xojo.Trimmed and simplified for rapid and easy unit testing.

Inspired and rebuilt from original XojoUnit: https://github.com/xojo/XojoUnit

## How to Use

You can simply drag the Xojo_Binary file into a project to import. Then try calling static functions (no objects required!)

Simple Assert Example:

Just put this anywhere in your code!
```
XojoEZUnit.Assert.IsTrue(True)
```

BatchTesting:

Create methods in the BatchTest Class with the prefix "test_" or another one of your choosing then use the code below.
Different pre/post-fixes can be used with run to hit different methods in the BatchTest class. 
```
XojoEZUnit.BatchTest.Run() // Default prefix is "test_" but parameters let you make your own prefix or postfix
```
More documentation is coming but my goal is VERY easy to understand and use!

## How to contribute

You can contribute to XojoEZUnit by:

- submit changes from your Fork of XojoEZUnit
- submit issues if you run into a error or want a feature
- request to become a Contributor

Don't send me emails with your updated project.

### Forking XojoEZUnit

1. Click the Fork button at the top.
2. Make your changes.
3. Push your changes back to GitHub.
4. Create a "Pull Request" for your changes.

I'll review pull requests when I can!

Frankly, this is all still new to me so we'll see how it goes!

### Becoming a Contributor

If you actively submit good changes, I'll probably make you a Contributor so that I don't have to process all your pull requests.

## Requirements

Xojo 2020 Release 2 or later is required to use XojoUnit with iOS and Web. (from XojoUnit requirements)

Xojo 2019 Release 2 or later is required for XojoUnit with Desktop and Console. (from XojoUnit requirements)

## Release Notes

### 0.5 (Nov. 2, 2023)
Initial upload. Give it a try!




