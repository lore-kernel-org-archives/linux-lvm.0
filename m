Message-Id: <199908262029.AA29536@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM in stock kernel!?
Date: Thu, 26 Aug 1999 22:26:07 METDST
In-Reply-To: <Pine.LNX.3.96.990826125142.20183A-100000@zeke.sympatico.ca>; from "Shane Shrybman" at Aug 26, 99 1:33 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shane Shrybman <shane@zeke.yi.org>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


On Thu, 26 Aug 1999 13:33:40 -0400 (EDT), Shane Shrybman wrote:

> 
> Hi Everyone !
> 
> We do not want LVM to miss the 2.4 bandwagon! It sounds like Jonny B.'s
> idea of a petition is the best course of action, (I have not heard any
> other suggestions). This petition should include a concise list of the
> pros and cons of including LVM in the kernel, and a list of people who
> agree with these points.
> 
> Before we submit our petition, we should have a LVM that works with the
> 2.3 series. Heinz, what is the status on this and a 0.8 release?

A 2.3.13(+) patch is available but i've heard of instabilities
during heavy i/o (trying to write beyond the end of the device).

Well, we faced this problem back in the 2.1.x age and i already
hoped never seeing it again 8*(

Have to test with more recent upcoming kernels...

Do to activities related to upcoming events (Linux Storage Management
Workshop/Linux Congress), i don't see 0.8 before end of september 8*(

> 
> Here is my list of pros and cons.
> 
> PROS
> - LVM is almost a necessity when managing large amounts of storage.

- it is one of the key enablers to open enterprise doors

> - Many unix people think that storage layout is one of the most difficult
> aspects of maintaining a system. LVM simply makes storage management much
> more flexible by allowing storage to be reallocated easily at anytime.
> - Folks coming to Linux from other UNIXes which use an LVM (HP, AIX etc..)
> will be familiar and comfortable with LVM concepts and will more readily
> embrace the penguin.
> - The "out of storage space" is a very common problem for users especially
> new users. LVM makes resizing allocated space easier. This is perhaps the
> most common problem I here about from new users.
> - LVM is not a new concept and has been proven to be indispensible in
> other OSes, (ie. It is not just some hair-brained scheme that just makes
> things harder to learn and more complicated).

- LVM provides the information to check i/o bottlenecks in a more fine
  grained manner and enables the user to solve them

- its implementation doesn't add much complexity to the
  block i/o layer (compared to for eg. MD) and therefore avoids instabilities


> 
> CONS
> - Using LVM is by definition adding a another logical layer for storage.
> Users not already familiar with an LVM will have to do some learning, or
> not use LVM.
> 
> Comments ?
> 
> Please feel free to edit and add your own points!
> 
> Shane
> 
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
