Stop Trolling Me: Better Code Review
====================================
Does your team regularly turn technical discussions into tense confrontations?  Do you get confused by code changes on a regular basis?  Is pairing with a junior developer frustrating?  Software peer review on a modern development team is essential to healthy code and a happy team. But it's riddled with human-sized pitfalls.  Learn why talking about code in person is important, how to talk about code without burning bridges, and ways everyone can use empathy to remove dread from the workplace.


Pitch
-----
Mid-to-small size development teams face growing pains on a frequent basis.  One of the biggest pain points early in a company's life is the way its engineering team talks about code.  With tens of thousands of startups in the world, generating billions of keystrokes per year, at least some of those teams will see conflict.  Sometimes those fights are spectacularly bad, and often they're preventable with a bit of empathy.

I'm extracting from my experience as a programmer, an engineering manager, a consultant and a business owner.  I'm also applying part of my psychology background.  I've given talks before, but this is my first at a real conference.


Metadata
--------
* [Horrible Hacker News Post](https://news.ycombinator.com/item?id=7367429)
* [image that goes with HN Post](http://www.flickr.com/photos/vwmang/2359469825/)

The Talk
========
* I'm Doc.
* How many junior engineers in the audience?
* I'm going to write some code
    * Bad code goes here
    * Ok it's done
* I'm going to review this code
    * Wtf who wrote this shit?
    * Rejected
* Important: Code review isn't supposed to feel this way.
* Code review is supposed to be a great way for engineers to reach mutual understanding
* What happened here?
    * First, I didn't give you (or me) a chance to respond
    * I wrote the whole body of code, then asserted it was done
    * Biggest problem: frequency
* Longer lead times in communication can be frustrating
    * I use SMS to run my business because anything else feels too long
    * Code review frequency spectrum
    * Making a change to a gem can feel great if it's fast, or infuriating if slow (forking in anger)
* But what else is going on?
    * Being Right
    * Generalizing
    * The guessing game
    * Contempt
* What kinds of responses could I have?
    * Defensiveness
    * Counter-critiquing
* Ways of getting better at dealing with difficult people
    * Use I-statements, avoid you-statements
    * Clearly state emotions and physical situation
* There are no silver bullets, and just like with meditation, you won't notice immediate changes
* This is a lot of work, and it doesn't always pay off
* If you can't ask around for help, maybe you can find a better work environment on the outside
* Thank you.


How can I get better at empathy at work?
----------------------------------------
* Use "I" statements, avoid "you" statements
  - Scenario: `StockLedger#parse_headers` has no test coverage
  - Yes: "I really want to write tests for this method"
  - No: "You should have written tests for this method"
* Clearly state emotional responses
  - Scenario: `StockLedger#parse_headers` has 20 lines and 3 conditionals
  - "I feel like I put too much code into `#parse_headers`"
  - Don't undershoot: "I think this code is okay, but I might be wrong"
  - Don't overshoot:  "I'm so terrible at this job, just look at `#parse_headers`"
* Clearly state needs
  - Scenario: you got 3 hours of sleep and `StockLedger#parse_headers` still exists
  - Solution: "I want you to explain this code to me"
  - Unmet need: "I don't understand this code"
  - Unmet need: "I can't concentrate long enough to read this code"
* Identify commonalities and collaborate
  - have the other person teach you something about the code, especially if they're new to it
* Let your ego die
  - do not grab the keyboard, correct the other person, complete their typing for them
  - if you can't resist that, unplug your keyboard or find a toy to play with


Active listening
----------------
* Two roles: Talker and Listener
* Listener will understand the emotional and logical output of the Talker
* Talker will be vulnerable enough to transmit the emotional content, while clear enough to transmit the logical content
* Tips:
  - Allow yourself to be curious and open-minded
  - Allow yourself to listen/talk as if you are not personally responsible for the content
  - Be aware of and accept your natural body language (hunching, fidgeting, tightness in stomach)
      - "Hey, I know i'm going to have a bad day because i'm tired"
      - "i'm feeling hungry right now"
      - "let's go get coffee"


Active listening antipatterns
-----------------------------
* Being right (as Listener)
  - using logic or facts to disprove Talker's narrative

* Getting defensive (as Talker)
  - correcting the narrative or misperceptions
  - justifying every major plot point
  - tuning out (physically or mentally)

* Counter-critiquing (as Talker)
  * responding to Listener's constructive criticism with criticisms about the Listener

* Generalizing
  * making generalizations leads to both Talker and Listener feeling helpless or confused
  * absolute language is a part of this

* Being contemptuous toward your partner
  - attaching permanent negative labels means you can't talk to that person again
  - pathologizing your partner does the same thing

* Creating the guessing game
  - hiding your expectations or needs
  - setting your partner up to fail by making them guess your expectations or needs
