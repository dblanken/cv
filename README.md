# My Resume

## What is this?

I like to keep my resume in a YAML file for portability and readability, but I'd like to export it to multiple output formats.  This is an attempt to do such a thing with plain old ruby (for the most part).  Right now it'll output a index.html file with the contents of my resume YAML file.

## How would I run this with my own YAML file?

You'd create your own resume.yml file, adhering to the YAML in the existing version for starters.

Then you would run:

```bash
ruby cv.rb > index.html
```

It should output what you wrote to the index.html file in the same directory.

## But I don't like some of your sections

Remove them; it will not display it if the section is not listed.  If you'd like your own, you'd create a new partial, and call it from the index.html.erb file.