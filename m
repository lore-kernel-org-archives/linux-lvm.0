Return-Path: <cworley@liberate.com>
Message-ID: <3A5B3CD2.4070801@liberate.com>
Date: Tue, 09 Jan 2001 09:31:14 -0700
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Sanity check: newbie wants strange LVM configuration
References: <3A52B71A.6944E0C5@symbionsys.com> <20010103093327.A619@66bassett.freeserve.co.uk> <3A5355EF.2060207@liberate.com> <20010103183937.A2027@66bassett.freeserve.co.uk> <3A537FB6.4090408@liberate.com> <20010104094004.A386@66bassett.freeserve.co.uk>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joe Thornber <joe@66bassett.freeserve.co.uk>, lvm <linux-lvm@sistina.com>

Joe,

"2 Day air" took a week to deliver... but I have my 40GB HD and have 
started the crossover.

The first thing I missed was that fdisk only sees up to 64K cylinders 
(and this disk has 77K), so it said I only had 12K... and it wasn't 
until I created the first lv that I realized the problem.  I was able 
to back-out the LV with lvreduce.  vgreduce was not as kind: it 
wouldn't let me remove the last PV from the VG.  So, I repartitioned 
using cfdisk (which could see more than 64K cylinders), and every 
lv/vg command from that point on would say that the configuration file 
and the kernel representation were out of sync, and to run vgscan to 
get them to jibe.  But, vgscan wouldn't correct the problem: I had to 
reboot.  I still can't create a new VG with the same name as that 
first one I created (so I created one with a different name).  Is 
deleting the VG as simple as just deleting the device file with the 
name of the VG?

Anyway, I made my first temporary 12GB Reiserfs from an LV, and have 
copied the data from my system drive (this is the first step in 
converting the current system over to LVM: copy the system drive to a 
temporary LV... next, I'll boot from the temporary LV and make the old 
system drive part of the LV, copy the data back, and boot from the new 
LV).

I used bonnie++ to test the different disk's speed: they're all about 
the same: 1.6MB/sec character I/O, 5MB/sec block I/O (the file I/O was 
significantly faster with the new disk running the reiserfs -- I 
figured this was the reiserfs and not the disk).  I thought hanging 
the new disk on the same controller as the cdrom would effect it, 
since my IDE controller doesn't do UDMA.  No effect.  I bought the 
cheapest disks, they're as expected: slow.  Time for software to speed 
them up.

Now that I've got the system backed up, and am ready to try booting 
from the lv (as per the booting from lv root instructions), I do have 
another question: the lv, which is basically on hdc3, is about to move 
to hda3 (the new bootable partition is on this 40GB drive).  "pvmove" 
doesn't seem to be the right way to do this, since I don't want to 
copy data from one disk to another.  Will vgscan automagically figure 
out the cabling change at boot?

Joe Thornber wrote:

> ...
> LVM is a bit more flexible in it's striping than MD.  You will create
> physical volumes, each physical volume will be split into physical
> extents (4M by default), it's only when you come to create a logical
> volume that you tell it whether you want to stripe or not.  At this
> point the extent allocator trys to allocate extents from different
> PV's.  So there is no need to create a 24G striped volume for only 12G
> of data. 

So, in the end I'll have 3 PV's (40GB, 16GB, and 12GB) in a 2-way 
striped LV.  Does lvm automagically know to stripe the 12GB and 16GB 
with the 40GB, and not with each other (I'll be cabling my IDE 
controllers for this configuration)?  With MD, I'd specify which disks 
are striped together, in lvm, I don't see a way to do this.

Furthermore, I want the last 12GB of the 40GB drive (that has no 
matching disk to be striped with) to be linearly appended to the end 
of the resulting lv.  MD's can be made of other MD's -- so I could 
specify two raid0's (comprised of: the 12GB drive + 12GB from the 40GB 
drive and: the 16GB drive + 16GB from the 40GB drive) then linearly 
append them together in a third MD with the leftover 12GB (unstriped) 
from the 40GB drive at the end.

But, VG's can't be comprised of other VG's -- and LV's are either 
striped or not.

How does LVM accomplish this same task?  What am I not understanding 
about LVM?

> 
> Let me know how you get on, writing a decent HOWTO is on my todo list so
> these sort of problems are useful to me.

You wanted the strange questions.  I got 'em ;)

Chris

P.S. I'm having a hard time sending email from this address to the LVM 
list server... I'm on the mailing list from another address, and when 
I send from this address I get a reply that the admin will review my 
email before posting, but it never happens.  Feel free to post your 
reply (and copy my stuff) to the list server.  I don't mean for this 
to be a private post, but I don't want to subscribe to the list for 
every email address I use.
