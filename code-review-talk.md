Dread-free programming through better code review
=================================================

Does your team regularly turn technical discussions into tense confrontations?  Do you get confused by code changes on a regular basis?  Is pairing with a junior developer frustrating?  Software peer review on a modern development team, while essential to a healthy code and a happy team, is riddled with human-sized pitfalls.  Learn why talking about code in person is important, how to talk about code without burning bridges, and ways everyone can use empathy to remove dread from the workplace.


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


Who is it about?
----------------
* Senior engineers in various forms of conflict

What happened?
--------------
* Engineering discussions become so heated that an external person must intercede
* Team member feels confused or frustrated when looking at changes in a codebase
* Pairing with a junior developer upsets both parties
* Pull requests diverge wildly and require multiple rebases
* Deployments fail and individuals take blame in front of the group

When did it take place?
-----------------------
* Multi-pair teams
* Multi-team companies
* Open source projects, including GitHub-style companies

Where did it take place?
------------------------
* Most visible as per-line comments in pull requests
* Less-visibly, pull requests that stay open forever or require negotiation
* Post-mortem meetings (can be retros, can be discrete meetings)
* Group code review

Why did it happen?
------------------
* A lack of accountability or leadership
  - difficult personalities who try to fill the power vacuum
* Mechanical code review devices
  - pull requests vulgarize a complex, abstract conversation into 4chan
* Distributed teams
  - most nonverbal communication is eliminated, meaning empathy is difficult to establish
* Poor empathy
  - shape up or ship out, you heartless asshole
  - oh wait, that's me too.  aah!

How can a lack of accountability be remediated?
-----------------------------------------------
* Pair programming
* Pairs or teams responsible for stories or domain knowledge, not individuals
  - if this sounds hard to do, you might need to talk more about the code you're writing
* Blame-free deployments, but accountability in root cause analysis
* Stop using `git-blame` to discover sabotage; just talk to the last person to touch the code

How can a mechanical code review be remediated?
-----------------------------------------------
* Um, delete the mechanical code review tool? Duh?
* Team should agree that gating the release is bad (assumes accountability)
* Master should always be green and deployable to production
  - Pairing at the time of checkin or merging to master

How can a distributed team be remediated?
-----------------------------------------
* Fire your remote team
* Work happens in the office, thinking happens everywhere else
* Sustainable schedule and culture
  - if a 30 hour week is the only way to get a team member, do that
  - qa note: how to do compensation for less-than-40

How can I get better at empathy at work?
----------------------------------------
* Use "I" statements
  - no really, "i think" vs. "you think" are totally different
* Identify commonalities and collaborate
  - have the other person teach you something about the code, especially if they're new to it
* Let your ego die
  - do not grab the keyboard, correct the other person, complete their typing for them
  - if you can't resist that, unplug your keyboard or find a toy to play with
* Use active listening

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

A Code Review Gone Wrong
------------------------










Archive
=======

What is it?
-----------
* Reviewer
  * Reading code that someone else on your team has written
  * Providing direct feedback to that person
* Reviewee
  * Hearing that direct feedback constructively
  * Taking action to remediate issues


What does it bring to the team?
-------------------------------
* Consistency
  * although mechanical style guides can be applied beforehand
* Group ownership of the code
  * ie, multiple people have signed off
* Context regarding changes happening to a larger codebase
* Senior programmers gaining confidence in juniors
  * eg, a phase of onboarding
* Another gate by which bugs can be stopped


How do I do it?
---------------
* Pair programming
* Technical talks
* Pull requests, but only for open-source projects, until github releases a teleporter


How have I seen it done wrong?
------------------------------
* Offline code review
  * Pull requests
  * Mondrian/Gerrit/Phabricator
* Group code review
* Top-down hierarchical code review
  * Line-counting for success metrics
  * Number of bugs closed in Tracker


What can be done to remediate the problem?
------------------------------------------
* If you find yourself using automated tools to gate people's checkins, fire your engineering managers and start over
* Pair on writing all code
  * Since code review can help with feeling collective ownership anyway, just go the distance
* At least pair on code review


Why in-person code review?
--------------------------
* Getting on the same page verbally is hard, but impossible in writing
* Nonverbal communication is critical as a reviewee because:
  * you are being judged
  * your code is being judged
  * you need help in understanding what the expectations are
* Nonverbal communication is critical as a reviewer because:
  * you are judging someone else's output
  * you need to be demonstrate openness to explanation/convincing


What it's really about and warning signs
----------------------------------------
* Your team's culture and response to change
* On a positive team:
  * Modeling good coding practices by looking at good code together
  * Understanding new dependencies and behaviors
* On a pathological team:
  * Excusing being an asshole (eg, the golang gerrit queue)
  * Breaking in new team members to the dominant pecking order
