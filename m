Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB32Ivr00478
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 21:18:57 -0500
Received: from web54408.mail.yahoo.com (web54408.mail.yahoo.com
	[68.142.225.164])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iB32Iq9E017892
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 21:18:52 -0500
Message-ID: <20041203021207.72667.qmail@web54408.mail.yahoo.com>
Date: Thu, 2 Dec 2004 18:12:06 -0800 (PST)
From: Gwen Morse <renniefan@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Newbie questions about LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've been sent off by a supervisor to find information
on LVM and determine if a particular form of machine
update is possible. I know nothing about LVM's and I'm
not the most technically adept of people. If I do a
good job researching this process and get all the
cogent information, then, I may be allowed to perform
the update under supervision. If I come back and all I
can say is "It can/can't be done", then, I'll get a
pat on the head but the general consensus will be
disappointment in my efforts.

I've read through the HOWTO and some other web
references.

We want to update our mail server (which uses LVM
1.0.8) on an old/slow disk-subsystem and mirror it
(via software) to a newer/faster sub-system. The
mirroring process would allow for a concurrent copy.
We would then want to break the connection to the
original disks and use the mirror as the new LVM
system. My reading on LVM and raid arrays is a little
unclear (to me -- which I suspect is a technical lack
on my part).

In the HOWTO, there's a section specifically on
migrating data:
http://www.tldp.org/HOWTO/LVM-HOWTO/removeadisk.html

However, that looks like it mostly deals with a single
hard drive being copied to another single hard drive.
We have a raid array, which looks like it's covered
more under this:
http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

However in THAT case it seems like this is a
workaround to copy without using a mirroring-type
copy, but, simply taking one server down, starting the
copy while the server is offline, and then putting the
new server back online when the copy is over. This
server needs to be up while the mirror is copying data
over.

Then, things seem to be complicated (at least to me)
by this warning (from the HOWTO):

It is not currently possible to add a disk to a
striped logical volume in LVM 1. Use LVM 2 with the
lvm 2 format metadata if you wish to be able to do so
able to do so.

I _think_ the above warning means that if I use RAID 2
or higher to copy from one subsystem to another, it
won't work, but, RAID 1 (mirroring/duplexing) will
work?

So, with all that information...

1) With what I've provided, is it 'possible' to set up
a software-based mirror between these two RAID disks
sub-systems, bring them both up to being concurrent
while the mail server is still live, and then break
the mirror to go back down to having the new RAID
array online?

2) If this is possible, is there a guide somewhere
that explains this in at least some detail? I have
directions on how to set up RAID 1 mirrors, but, I'm
not sure what to do with LVM as part of the process. I
have tried to do the majority of my research before
asking these questions...I'm just having some trouble
putting the peices I have "together".

Gwen
 


		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com 
