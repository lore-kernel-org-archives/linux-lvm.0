Message-ID: <15AD5D7936F8D21198240000F831776E3E8158@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: RE: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
Date: Tue, 25 Jan 2000 17:21:24 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> Any solution to this problem? Where can i teach pv_get_size about
> Mylex /dev/rd? Also does it matter that I'm using devfs and hence
> have long nested /dev/ path names?
> 
> thanks,

Ok, it turns out to be related to the new devfs namespace. I grep'ed for
/dev/rd in tools/lib, and replaced the 2 occurances i found with
/dev/rd/disc0 and got LVM working.

So the problem is that the scanning functions only descend down one level.
Eg in my case the tools/lib/* routines know about /dev/rd, so only nodes in
/dev/rd will be found, which is not where they are in latest devfs.

However.. this begs the question:

Why in the name of god do the LVM tools use such elaborate and convulated
methods for verifying the supplied device name? LVM tools are effectively
tied to a very specific /dev namespace, and changing it is non-trivial.

I would much prefer that LVM tools only do basic sanity-checking on the
device file, and leave as much of the namespace policy/sanity as possible up
to the administrator. As is the Unix way. If i want to change my /dev the
LVM tools should be able to handle it.

Apart from this LVM works very very nicely. (apart from small issues which
I'll send a seperate mail about). LVM turns linux into a very capable
storage server. 

Congratulations!! 

-paul jakma
paul.jakma@compaq.com
paul@clubi.ie
