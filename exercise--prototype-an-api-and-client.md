---
name: 'Exercise: Prototype an API and client'
about: Code Assignment for Candidate
title: code-challenge-instructions
labels: ''
assignees: ''

---

# Exercise: Prototype an API and client

## Setting the scene

Imagine it's the last day before you go on vacation. Your manager asks if you can quickly design and prototype a new microservice and API client, which your less experienced colleague can finish when you are away.

## Context

This is an exercise that is meant to test your skills and thought process as an experienced developer. This test intentionally has time limits which are too strict to do it perfectly within the time limit. You will have to make trade-offs, and deliver something which is intended to be used as a foundation by someone else. This puts emphasis on communication and collaboration via the codebase. As a remote company, these are skills we value.

## The assignment

Your manager asks for a new microservice that can provide a fraud detection service for other services used by the company. It will need some API documentation, a readme withbasic info to get the project working and maybe some other useful info. You will need to provide a client library as well, which wraps the API so other Ruby projects can include it. Restrictions: all code will be in Ruby. You are free to use the gems you want.The server should do two things initially. Because you control the client and server, you get to make choices regarding API paths, payloads, and such.

- **CLASSIFY:** receives pre-classified data to train the server. This data will be provided:

> 1. data: (arbitrary) key/value pairs of strings. We are not yet sure what data will be useful, so we want to be able to change this. We will probably do our initial testing with HTTP request header data.
> 2. classification: one of two values: good or bad

- **CHECK:** use data provieded to CLASSIFY to judge if the request is fraudulent or not.

> 1. this gets the same key/value data as you'd send to CLASSIFY request
> 2. returns a classification: good or bad.

A client will be required to communicate with the server. Assume we want to integrate the client in a production application which processes a lot of data, and which should have low impact from the fraud check.

It should be clear that we don't expect you to build a perfect fraud detection system! That would have business value, which is not the point of this exercise. The point is to write code which is not yet finished when you deliver it, and that other people will need to finish what you start. We expect you to build a decent foundation so that other developers can take it forward.

You get to determine restrictions, assumptions and trade-offs. Just make sure that you document them, and a bit of the reasoning behind your choices.

The classifier is the bit of code with both business value, and the part that probably will receive most work in the future to optimise. There are a couple of Ruby gems which handle Bayesian classification, such as `classifier-reborn` or `nbayes`, but if you have a different idea then that's fine as well.

Your task is to deliver (at least) this:

** Only use this provided repository to push your code. Do not push the code anywhere else. **
- Make an initial commit when you start, so before you write any code. You can add an empty Readme.md file or a .gitignore file. This marks your starting time.
- Try to commit early and commit often: leave a nice trail of how you solved the problem. Bonus points for having commit messages which describe what you did and why.
- Documentation / notes: your colleague has to finish this, remember? Be kind and leave them some documentation to understand the project, and to know what they have to do.
- Code, all in one repository to keep it simple
- The Server code
- The Client libary code (way to run the code to get the desired outcome)
- Tests/Specs

**Time budget: try to spend not more than 3 to 4 hours on this**

