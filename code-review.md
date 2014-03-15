# Code Review

!SLIDE

# Better Code Review


!SLIDE

# Doc Doc Doc
### Company.com


!SLIDE

## Hilarious Twitter

```txt
Shut up
```


!SLIDE

## Horrifying HN Post

```txt
Bro just man up

Signed,
monkeydude
```

Never read the comments.


!SLIDE

## Code Review is Useful

Get everyone up to speed

Receive tips and tricks

Integrate different styles


!SLIDE

## Code Review goes Wrong

Quote wars

Commit ownership

Random personal battles


!SLIDE

### Wait, No!

Goal was quality

Goal has become winning


!SLIDE

##  Let's Write Some Ruby!

### Never say this at home, kids.


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    def eat
      self.destroy!
    end
  end
```

!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    ...

    def self.tastinesses
      self.all.map { |taco| taco.tasty == true }
    end
  end
```

!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    ...

    def apply_sauce(name: nil)
      update_column(sauce_name: "#{name == nil ? return : name}")
      save
      save!
      p sauce_name
    end
  end
```


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    ...

    def add_cheese
      define_singleton_method :cheese, -> { 'queso' }
    end
  end
```

!SLIDE

# Being Right
### (as Reviewer)

"That's not what the Rails guide says"

!SLIDE

# Being Right
### (as Reviewer)

"That's not what the Rails guide says"

Really, an appeal to outside authority

!SLIDE

# Generalizing
### (as Reviewer)

"You should never use map this way"

!SLIDE

# Generalizing
### (as Reviewer)

"You should never use map this way"

Reviewee feels confused and defensive


!SLIDE

# Labeling
### (as Reviewer)

"As a junior developer, you wouldn't know that Ruby code doesn't look like this"


!SLIDE

# Labeling
### (as Reviewer)

"As a junior developer, you wouldn't know that ..."

Once you attach a label, you can't take it back


!SLIDE

# Leading Questions
### (as Reviewer)

"How can we make this better?"


!SLIDE

# Leading Questions
### (as Reviewer)

"How can we make this better?"

Hiding expectations from the Reviewee


!SLIDE

## Whatever

These sentences just come out

You just want to move on


!SLIDE

## Othering

Senior enough to review

Senior enough to exclude


!SLIDE

## You're not a bad person

Halting your self-improvement

Possibly destroying engineering culture


!SLIDE

## Reviewers are not attackers

#### Don't be one.  Watch for those signs.


!SLIDE

## Signals for Reviewees

Discomfort

Exhaustion

Silence


!SLIDE

# Getting Defensive
### (as Reviewee)

Correcting misperceptions

"I've been writing Ruby for 5 years"


!SLIDE

# Getting Defensive
### (as Reviewee)

Justifying actions

"I've written code like this before"


!SLIDE

# Getting Defensive
### (as Reviewee)

Tuning out

"Shit I got some high score on Threes"


!SLIDE

# Counter-Critiquing
### (as Reviewee)

Reviewer: "This method has 10 lines"

Reviewee: "You committed a 50 line method yesterday"



!SLIDE

## There is no magic bullet

Keeping all these things in mind is hard work

Like yoga


!SLIDE

## Cultures can be toxic

Sometimes you just have to move on


!SLIDE

# Doc Doc Doc
### Thanks!

!NOTES

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
* Two roles: Reviewee and Reviewer
* Reviewer will understand the emotional and logical output of the Reviewee
* Reviewee will be vulnerable enough to transmit the emotional content, while clear enough to transmit the logical content
* Tips:
  - Allow yourself to be curious and open-minded
  - Allow yourself to listen/talk as if you are not personally responsible for the content
  - Be aware of and accept your natural body language (hunching, fidgeting, tightness in stomach)
      - "Hey, I know i'm going to have a bad day because i'm tired"
      - "i'm feeling hungry right now"
      - "let's go get coffee"


Active listening antipatterns
-----------------------------
* Being right (as Reviewer)
  - using logic or facts to disprove Reviewee's narrative
  * "That's not really what the rails guide says"

* Generalizing (as Reviewer)
  * making generalizations leads to both Reviewee and Reviewer feeling helpless or confused
  * absolute language is a part of this
  * bad reviewer: "that's not how we really name classes in idiomatic ruby"
  * good reviewer: "one thing that would make the class easier to find is renaming `Active_snake_case` to `ActiveSnakeCase` instead"

* Being contemptuous (as Reviewer)
  - attaching permanent negative labels means you can't talk to that person again
  - pathologizing your partner does the same thing
  * bad reviewer: "you're a junior developer, so you wouldn't know this, but ..."
  * good reviewer: "one thing that's good about ruby is ..."

* Asking leading questions (as Reviewer)
  - hiding your expectations or needs
  - setting your partner up to fail by making them guess your expectations or needs
  * bad reviewer: "How can we make this better?"
  * good reviewer: "How can we make this better?  I'd go ahead and memoize dingus"

These sentences can come out of your mouth as a reviewer after feeling like you're done and just want to move on.

* Getting defensive (as Reviewee)
  - correcting the narrative or misperceptions
  - justifying every major plot point
  - tuning out (physically or mentally)
  * you are now feeling attacked.  it's good to notice it.  it's time to stand up, walk around and leave the physical space for a while.

* Counter-critiquing (as Reviewee)
  * responding to Reviewer's constructive criticism with criticisms about the Reviewer
