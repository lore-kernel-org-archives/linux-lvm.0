Message-ID: <388E5A68.F92FFCEF@msede.com>
Date: Wed, 26 Jan 2000 03:22:32 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
References: <200001260001.BAA19078@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: Jakma Paul <Paul.Jakma@compaq.com>, linux-lvm@msede.com

Heinz Mauelshagen wrote:
> > However.. this begs the question:
> >
> > Why in the name of god do the LVM tools use such elaborate and convulated
> > methods for verifying the supplied device name? LVM tools are effectively
> > tied to a very specific /dev namespace, and changing it is non-trivial.
> 
> Yes, it's an obvious disadvantage to do this 8-{(((
> 
> The simple reason for it is performance enhancement.

But when/how often is this information needed? As far as i can see
lvmdiskscan, vgscan, pvscan and lvscan are afftected.

The only "frequent" operation is vgscan during boot. Frequent in this 
context means that it is executed once per boot and performance
should not be _that_ critical - even given a cluttered /dev.

> That's why a change to use /proc/partitions is
> in the current developement code.

Does /proc/partitions have a mapping to real (existing) device files?
Judging from the source it does not. This also does not handle cases 
when loop devices are involved. So /proc/partitions could be used
to create a list of major/minor for lvm_check_dev().

I would propose to traverse the /dev directory _recursively_ and 
filtering entries by major/minor (possibly obtained from
/proc/partitions
and/or /proc/devices). 
This should be fast enough, remove the special meanings from device 
names and take care of dynamically created device major/minors. 
If /proc is not present, the hard coded list of majors could be used 
as now.

Supporting devfs is another issue. AFAIR at least older versions did
no longer require major/minors so association of devices must be done 
by inspecting the path? If a stat() on devfs does return a major/minor
it should not be necessary to special case it.


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
