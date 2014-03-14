# Stop Trolling Me

!SLIDE

# Better Code Review

## Doc Ritezel
### Ministry of Velocity

!NOTES

  * Hey glad to see some people made it!  I'd like to take a moment and thank Neo for hosting and giving me a chance to look silly on Youtube.  So if you fart during my talk, it's basically going straight on the internet in about an hour.

  * I'm Doc, and I own a consulting shop based here in San Francisco.  Recently I filled out a few forms for the TSA and I realized I've had the great fortune of working with a dozen teams over the last five years.

  * More importantly, I've had the opportunity to review a lot of code.


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
  end
```

!NOTES

  * I'm sure you've all had a chance to write some pretty awful ruby.  I won't take that experience away from you.  I'm going to write a Taco.  This might get confusing.


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    def eat
      self.class.destroy_all!
    end
  end
```

!NOTES

  * Oh I see, by defining an eat method that accidentally deletes all tacos in the system, eating one taco means that all tacos get eaten.  Pretty clever!


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    def eat
      self.destroy!
    end

    def self.tastinesses
      self.all.map { |taco| taco.tasty == true }
    end
  end
```

!NOTES

  * Here's a class method.  It finds the truth values for the tastiness of all tacos.  I could see doing that with Arel, but the method might have a better name.


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    def eat
      self.destroy!
    end

    def self.tastinesses
      self.all.map { |taco| taco.tasty == true }
    end

    def apply_sauce(name: nil)
      update_column(sauce_name: "#{name == nil ? return : name}")
      save
      save!
      p sauce_name
    end
  end
```

!NOTES

  * Oh!  Wow.  It looks like the code should only set the value of sauce_name if sauce name is non-nil.  I feel like this function could be a bit more straightforward.  Can we look at the tests for this function?  No?  It's only a demo I'm showing?


!SLIDE

```ruby
  class Taco < ActiveRecord::Base
    def eat
      self.destroy!
    end

    def self.tastinesses
      self.all.map { |taco| taco.tasty == true }
    end

    def apply_sauce(name: nil)
      update_column(sauce_name: "#{name == nil ? return : name}")
      save
      save!
      p sauce_name
    end

    def add_cheese
      define_singleton_method :cheese, -> { 'queso' }
    end
  end
```

!NOTES

  * Hmm.  I'd like to see a version of this function that doesn't include metaprogramming.


!SLIDE

## Good code review doesn't feel like an attack

!NOTES

  * This is the important part:



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
