Message-Id: <4.2.0.58.19990826121935.00fc6c30@204.151.72.2>
Date: Thu, 26 Aug 1999 12:30:21 -0600
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] LVM in stock kernel!?
In-Reply-To: <Pine.LNX.3.96.990826125142.20183A-100000@zeke.sympatico.ca
 >
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


>
>PROS
>- LVM is almost a necessity when managing large amounts of storage.

although at some cost in performance since there's an additional layer of
translation before you get to the actual disk blocks....

>- Many unix people think that storage layout is one of the most difficult
>aspects of maintaining a system. LVM simply makes storage management much
>more flexible by allowing storage to be reallocated easily at anytime.

at some cost again....insulation from actual details of storage does mean you
are not necessarily making the optimal use of layout....but the benefits seem
to far outweigh these costs.

>- Folks coming to Linux from other UNIXes which use an LVM (HP, AIX etc..)
>will be familiar and comfortable with LVM concepts and will more readily
>embrace the penguin.

add at least Solaris (Solstice Disk Suite) and SGI IRIX  (xlv - a very nice
combination with the xfs filesystem) to this list.

>- The "out of storage space" is a very common problem for users especially
>new users. LVM makes resizing allocated space easier. This is perhaps the
>most common problem I here about from new users.
>- LVM is not a new concept and has been proven to be indispensible in
>other OSes, (ie. It is not just some hair-brained scheme that just makes
>things harder to learn and more complicated).
>
>CONS
>- Using LVM is by definition adding a another logical layer for storage.
>Users not already familiar with an LVM will have to do some learning, or
>not use LVM.

Not terribly familiar with Linux LVM (listening here to help become so)...other
LVMs require a large number of commands to become familar with (the AIX
LVM being the prototype which _most_ folks have followed; Solaris takes
a somewhat different approach).  Actually, a well-thought out GUI can be
a great help here.  The author of a course I teach has constructed one as
a sample which gives you drag-and-drop LVM management - in very little
tk/perl code.
