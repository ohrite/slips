Stop Trolling Me: Better Code Review
====================================

Does your team regularly turn technical discussions into tense confrontations?  Do you get confused by code changes on a regular basis?  Is pairing with a junior developer frustrating?  Software peer review on a modern development team is essential to healthy code and a happy team. But it's riddled with human-sized pitfalls.  Learn why talking about code in person is important, how to talk about code without burning bridges, and ways everyone can use empathy to remove dread from the workplace.


Pitch
-----
Mid-to-small size development teams face growing pains on a frequent basis.  One of the biggest pain points early in a company's life is the way its engineering team talks about code.  With tens of thousands of startups in the world, generating billions of keystrokes per year, at least some of those teams will see conflict.  Sometimes those fights are spectacularly bad, and often they're preventable with a bit of empathy.

I'm extracting from my experience as a programmer, an engineering manager, a consultant and a business owner.  I'm also applying part of my psychology background.  I've given talks before, but this is my first at a real conference.


Details
-------
First, I'm going to run a postmortem of five scenarios:

  * Engineering discussions become so heated that an external person must intercede
  * Team member feels confused or frustrated when looking at changes in a codebase
  * Pairing with a junior developer upsets both parties
  * Pull requests diverge wildly and require multiple rebases
  * Deployments fail and individuals take blame in front of the group

Then, I'm going to break down their pathologies:

  * A lack of accountability or leadership
  * Mechanical code review devices
  * Distributed teams
  * Poor empathy

I'll cover basic remediation steps for the first three pathologies:

  * Collective code ownership
  * Pair programming
  * Onsite only

I'll also suggest techniques for teams that can't apply those things for whatever reason.  Then, for empathy, I'll cover the basics of active listening, and how to avoid common antipatterns, with real life examples.

The Talk
========

Introduction
------------
Hi!  I'm Doc.  I'm Head of Operations for my consulting company, Ministry of Velocity.  We've done all sorts of projects, from agile coaching to Rails development to business analysis.  At my company we're really into this thing that you might have heard of called code review.


Ancient Code Review
-------------------
I've been a consultant for somewhere around 15 years.  You know, I'm actually not sure I can say that.  At the very beginnning of my career, I was scared away from computers by a pretty aggressive engineering team, and it took me years to want to write code again.  Wow, you know, I still feel adrenaline thinking about that?

My first exposure to code review was on that team: I'd write some code, check it in on a branch and push it up for review.  Then, a more senior engineer would download it, print it out and redline it overnight.  I'd come to my cubicle in the morning and that redlined paper was the first thing I'd see.

Downloading, printing, redlining ... I'm dating myself here, right?  I was talking with a friend the other day and they were slightly astounded that I handwrote papers in college.  Like with cursive and everything!

Anyway, code review in this form was meant to make sure that I, the most junior person on the team, wasn't checking in a pile of bugs.  Getting feedback from a person who's more familiar with the code is a great way to do that.  I felt like I was part of the team.

Then the person reviewing the code changed, and the words "why would you ever think this was good code?" showed up.  I went from appreciating the feedback to being scared of judgment at work.

I stopped showing up consistently and, a little later, the contents of my desk showed up at my front door in a FedEx box.  Seven years passed before I got my second fulltime programming job.

This probably isn't what was supposed to happen.  At least I hope not.


Defining Code Review
--------------------
There's one special case of code review: the one where everyone likes the code and nothing happens.  Every other case of code review is what psychologists define as conflict, which is an industry term meaning a disagreement, although conflict itself defies reliable definition.  In code review, it doesn't involve throwing heavy objects, dispatching an air force to bomb a foreign country or staging a dance-off to save the youth center.  Hopefully.

John Dewey, the first president of the APA, was really into conflict resolution and came up with this flowchart about a hundred years ago:

```text
            [1 Define Problem]
                     |
           [2 Analyze Problem]
                     |
    [3 Determine Criteria for Solution]
                     |
          [4 Propose Solutions]
                     |
      [5 Evaluate Proposed Solution]
                     |
           [6 Select Solution]
                     |
         [7 Implement Solution]
```

Code review roughly lines up with this flowchart.  But it's pretty abstract, and it could benefit from a concrete example.


Code Review in Conflict
-----------------------
Let's look at some code and go through the code review process.

```ruby
  class LedgerEntryImporter < Struct.new(:path)
    HEADERS = {company: :"Company Name", stock_price: :"Stock Price"}

    def parse
      CSV.parse(path, headers: true) do |row|
        entry = LedgerEntry.new
        HEADERS.each do |attribute, column|
          entry.attributes[attribute] = row.values[column.to_s]
        end
        entry.save!
      end
    end
  end
```

Let's go through each of Dewey's steps:

1. Define problem
  * Reviewer: "I think the HEADERS declaration needs to change".
  * Reviewee: "I don't follow.  It's late in the afternoon and I'm pretty tired."
  * Reviewer: "Well, what I mean to say is that I think there might be a better choice here than turning the value into a symbol."

2. Analyze problem
  * Reviewee: "I chose the symbol values here because Ruby would allocate memory otherwise."
  * Reviewer: "Is memory usage particularly bad here?"
  * Reviewee: "No, it just loads the headers.  But it's more memory efficient to do it this way."

3. Determine criteria for solution
  * Reviewer: "I hear what you're saying about memory use, and that's a reasonable concern.  If this code ran again, I don't think it would use more memory."
  * Reviewee: "Well, it might."
  * Reviewer: "I think that this code is only going run at require time, though."

4. Propose solutions
  * Reviewee: "Hmm.  Okay.  So what should it do?"
  * Reviewer: "I think `HEADERS` needs to be a hash that associates a column from the CSV to an attribute on `LedgerEntry`."
  * Reviewee: "Couldn't I also put this mapping into a yaml file?"
  * Reviewer: "Sure."

5. Evaluate proposed solutions
  * Reviewee: "Well, okay, so memory isn't going to be a factor in either case. I like the YAML idea because I can change it whenever I want."
  * Reviewer: "That's true, but will the headers change per-environment?"

6. Select a solution
  * Reviewee: "Hm, well, no.  The best idea seems like just cleaning up the hash."

7. Suggest strategies for implementation
  * Reviewer: "Also, if the values were strings, the `.to_s` on line 96 could be removed."

Okay, so a lot of things hapeend here, but the first thing we can tell is that the reviewer and reviewee don't hate each other.  Things got a little tense, like when the reviewer basically says they don't like the code, but it cooled off.  It turns out that both reviewer and reviewee are making things easy by applying a few skills.

Win-win Conflict Resolution
---------------------------
First, both reviewer and reviewee are entering the conflict with the idea that both sides will win.  This is a pretty big step for a lot of people, because at least when I'm writing code, I believe that the approach I've taken is right.  Right?  Like, all that time I've invested in some massive function that just gets replaced with a couple of calls to map and reduce:

```ruby
  class Taco
    def bean_count
      total_beans = 0
      bean_blobs.each do |blob|
        total_beans += blob.count
      end
      total_beans
    end
  end

  ...

  class Taco
    def bean_count
      bean_blobs.map(&:count).reduce(:+, 0)
    end
  end
```

What!  Freaking Ruby.  Oh well, at least that's easy to test.  Come to think of it, I'm pretty sure that I assume I'm right about a lot of things in the rest of my life too.  Huh.  That's the false attribution fallacy, right?  So the way we beat that is by acknowledging that we're all capable of making that fallacy.

No assignment of blame
----------------------
Second, both people are talking and listening like the conversation isn't tied to their worth as people.  When the Reviewer convinces the Reviewee that the simpler approach is better, it isn't because the Reviewee is dumb.

I-messaging
-----------
There's also I-messaging in use. You'll notice that the only time someone says "you" is the phrase "I hear what you're saying."  Both parties are talking about their own thoughts and feelings.  This is a super-easy way to completely sidestep unintentional confrontation.  We should all probably be doing more of this day-to-day.

Active Listening
----------------
Finally, the reviewer and reviewee are using active listening, which is a skill used to build and maintain empathy.  Usually it's used by marriage counselors, family therapists and teachers, but starting from today, you're going to notice yourself using it as well.

One of the roles is the Talker, who is vulnerable enough to transmit emotional content and clear enough to deliver logical meaning.  The other role is the Listener, who is open-minded enough to hear the Talker's emotional output and curious enough to understand their logical flow.

So active listening is simple on the surface, but still waters run deep.

Talker
------
Let's separate the concepts of talking and vocalizing.  When I talk up here in front of you, I'm attempting to convey information, partially through vocalizing words, but also through nonverbal communication.

The Talker needs to be vulnerable enough to transmit their emotional state in a easy-to-understand way.  By vulnerable, I mean that the Talker has to open themselves up to feedback, which is really hard for a lot of people.

The Talker must also be clear and direct when describing their logical process.  This means you can't use abstract statements.  Instead of a diatribe about Thing A and Thing B, the Talker needs to talk about the `StockCertificateImporter` class and the `decompress_archive` class method.

Listener
--------
The other role is the Listener.  Again, let's split the concepts of listening and hearing.  When you hear my words, that's hearing, and when you're attempting to discern some meaning in my mouth-noises, that's listening.

The Listener needs to be open-minded and distance themselves from the Talker's emotional output in order to evaluate the Talker's needs.  In practical terms, this means not interpreting the Talker's frustration at the complexity of of `StockCertificateImporter` as a personal attack.

The Listener needs to be curious enough to hear the Talker's logical output.  Even if the ultimate fate of `decompress_archive` is a total mystery, the Listener needs to keep an open mind about all possibilities.

Active Listening Tips
---------------------
So in active listening, both parties are going to vocalize and hear, but only one person is the Talker, and only one person is the Listener.

Here's the hard part: a little bit of practice will give you superpowers, but this is a learned skill that's impossible to perfect.  Bad days throw all these guidelines out the window, along with your unfortunate coworker.

But there's a bright light here: active listening doesn't require full, or even conscious, participation of both people.  It's like sriracha.  You can use this to make everything more enjoyable.






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
