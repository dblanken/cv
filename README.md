# My Resume

## What is this?

I like to keep my resume in a YAML file for portability and readability, but I'd like to export it to multiple output formats.  This is an attempt to do such a thing with plain old ruby (for the most part).  Right now it'll output a index.html file with the contents of my resume YAML file.

## Prerequesites

* pandoc
* pdflatex (for mac users, it's ```brew install basictex```)

## How would I run this with my own YAML file?

You'd create your own resume.yml file, adhering to the YAML in the existing version for starters.

Then you would run:

```bash
ruby cv.rb > index.html
```

or

```bash
./bin/html.sh > index.html
```

It should output what you wrote to the index.html file in the same directory.

### Command line arguments

For a reminder of this in the application:
```bash
ruby cv.rb -h
```

--role: The role you're attempting to output.  In this case, it corresponds to the subdirectory underneath templates to use (default is 'software_engineer')

--filename: The YAML file location to use (default is resume.yml)

--type: The type of output you'd like; current options are html (default) or md

## PDF output is not working

You must have pandoc installed to use this.  Once installed you can run:

```bash
./bin/pdf.sh > resume.pdf
```

## But I don't like some of your sections

Remove them; it will not display it if the section is not listed.  If you'd like your own, you'd create a new partial, and call it from the index.<type>.erb file.
