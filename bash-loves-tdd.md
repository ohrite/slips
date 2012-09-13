# TDD with Bash

!SLIDE

# TDD and Bash

## Doc Ritezel
### Pivotal Labs


!SLIDE

## Don't abuse POSIX

### It's had a hard life

    My solution to JSON and XML is sed.
    It works in all resource conditions
    and most times is just as fast as
    any RAM hungry parser.

                        — @shit_hn_says


!SLIDE

## Do it in Bash!

It's portable

No external dependencies

All developers know a little


!SLIDE

## You've got landmines

rvm: 14599 lines, partial coverage.

EC2 bootstrap scripts: 80 lines, no coverage.

### Your code at home is unsafe.


!SLIDE

## Engineer around it

KISS

Do it in a better language

Make a graybeard do it


!SLIDE

## Hooray an ops task

```
#!/bin/sh

RVM_0_12_3_SHA=d6b4de7cfec42f7ce33198f0bd82544af51e8aa5

env | grep -q "APP_USER=" || echo "Please set APP_USER environment variable"

# perl -e 'print crypt("password", "salt"),"\n"'
getent passwd $APP_USER >/dev/null 2>&1 || useradd $APP_USER -p SALTED

root_keys=/root/.ssh/authorized_keys
authorized_keys=`cat $root_keys`
user_keys=/home/$APP_USER/.ssh/authorized_keys
grep -sq "$authorized_keys" $user_keys || cat $root_keys >> $user_keys

perl -p -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
/etc/init.d/sshd reload

yum install -y gcc-c++ readline-devel zlib zlib-devel libffi-devel openssl-devel iconv-devel

sudo_string='ALL            ALL = (ALL) NOPASSWD: ALL'
grep "$sudo_string" /etc/sudoers || echo "$sudo_string" >> /etc/sudoers
```


!SLIDE

## Stop deferring.

# Start testing.

 
!NOTES
* If this was Ruby, people would gag.


!SLIDE

## Testing in RSpec

```

  # lib/dude.rb

  class Dude < Struct.new(:indecent); end
```


```

  # lib/pants.rb

  module Pants
    def self.put_on(dude)
      dude.indecent = false
    end
  end
```

```

  # spec/lib/pants_spec.rb

  require 'spec_helper'

  describe Pants do
    let(:me) { Dude.new(true) }

    it "should cover my shame" do
      Pants.put_on(me)
      me.indecent.should == false
    end
  end
```


!SLIDE

## Testing Conventions

The Ruby community has some great conventions:

* Separation of concerns
* Environment setup in `spec_helper.rb`
* before/after blocks
* Stubbing and Mocking
* Exception handling


!SLIDE

# roundup(1)

By Blake Mizerany of heroku


!SLIDE

## Testing Bash

```

  # script/pants.sh

  put_on_pants () {
    indecent=false
  }
```

```

  # spec/script/pants_spec.sh

  . spec/spec_helper

  describe "pants"

  before () {
    indecent=true
  }

  it_should_cover_my_shame () {
    put_on_pants
    test "$indecent" = "false"
  }
```

```

  pants
    should cover my shame:                           [PASS]
  =========================================================
  Tests:    1 | Passed:   1 | Failed:   0
```

!SLIDE

## In the wild

### Snowflake

github.com/ohrite/snowflake




### Cascading Multitool

github.com/cascading/cascading.multitool
