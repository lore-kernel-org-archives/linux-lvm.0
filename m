Message-Id: <3C300517.6060808@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RAID support...
References: <25E4CA13D679FF48BC30769420220971467A5B@nd1-clusa.local.bunnings.com.au>
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
Date: Mon Dec 31 00:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: ccoe@bunnings.com.au

Colin,

	My apologies, this message is way to long.  You don't read it unless you 
want to know the specifics of how some idiot transformed a stock RH7.1 
no raid install into a RAID1/LVM configuration by hacking it out by hand.

	I have failed to ever get the installer to work correctly to install 
directly onto the machine.  Disks are cheap so I have around 150GB of WD 
7200 drives.


/dev/hda -- Root filesystem/install disk
/dev/hdb -- half of /dev/md0
/dev/hdc -- half of /dev/md0
/dev/hdd -- half of /dev/md1
/dev/hde -- half of /dev/md1

	(Okay in real life that isn't the case they are really different letters, 
all the drives are on seperate controllers for performance reasons).

	I normally install RedHat onto a regular disk drive, no mirror, no LVM, 
nothing special.  Basically it is a 4 click version of the install after 
I get done partitioning the drives.  After getting that all done up I 
config the 4 drives into 2 seperate mirrors (read the how-to).

Partition /dev/hd[bcde] into on giant partition whose type is OxFD.

Basics of that are edit /etc/raidtab to this:

raiddev /dev/md0
	raid-level 1
	nr-raid-disks 2
	chunc-size 32
	persistant-superblock 1
	device /dev/hdb1
	raid-disk 0
	device /dev/hdc1
	raid-disk 1

mkraid /dev/md0

The persistant-superblock is important.  You really want that working or 
you might have trouble getting the LVM to autostart during the boot 
sequence.

And similar for /dev/md1.

Then do the pvcreate on /dev/md0 and /dev/md1.  To be honest, I have to 
just type pvcreate and read the help line to figure it out.

vgcreate to create the volume group, nothing special, again read the help.

	I have never gone to the trouble of moving the root onto LVM, in my 
opinion it isn't worth the hassle (kernel/modules/boot sequence hell 
ensues if you screw anything up), it becomes a real hassle because I 
hate boot floppies and I generally never make one.  If I can't recover 
using a RedHat CD I generally don't configure the system that way (yes I 
  that am lazy).

	When I install I am sure to create the following filesystems:

/tmp
/boot
/usr
/usr/local
/var

All of these were installed onto /dev/hda not onto any mirrors or any 
partitions.

Once you get here it gets a little scary, but you are almost done.  Log 
in as root, change to single user mode.  Now I make a logical volume 
that matches each of the above filesystems.  I make a mountpoint for 
each non-LVM version of the filesystem in called xxx.old where xxx is 
the original filesystem.  I configure all that up in /etc/fstab so it is 
documented in case I forget something.  Make the logical volumes, and 
/etc/fstab entries for both.  Oh yeah, the xxx.old are mount read only.

Now do the following

mkfs -t xxx /dev/vg/lv

mount /tmp
( cd /tmp.old && tar cf . - ) | ( cd /tmp && tar xvpf - )

Do that once for each filesystem.  Note that the tar will only exist in 
the pipe so you don't need enough disk space to store it, and the p in 
the second tar ensures that ownership and permissions are preserved.

Okay so this screws up one thing that is important.  /tmp has special 
permissions.  The bit t is set on the world execute bit which is 
important, it is the sticky bit and controls who is allowed to delete 
which files in a directory ( I don't know the exact meaning I just know 
it is important to get it right on /tmp ).

If you don't like using tar, you can use dd or dump/restore.  On the dd 
version, you have to make the logical volumes the same size as the 
original partitions or bigger.  If they are bigger you will have to use 
a filesystem resize command in order to not waste space.  (The dd 
version of the command scared me to death, but it appears to work just 
fine.)  Anybody with real experience care to comment?  The machine I am 
typing this email on had the dd command used to move filesystems.

cat /proc/partitions | egrep "block|/dev/hda6"

(I believe the block size under Linux is 512 bytes don't quote me on that)

dd if=/dev/hda6 of=/dev/vg/lv bs=512 count="3rd number on the grep"

Actually I believe on my system I just did

dd if=/dev/hda6 of=/dev/vg/lv,
but I am not sure, basically I dinked with it until it mounted correctly 
and returned the same amount of space used, and then fsck'ed correctly.

You can use dump and restore, but make sure the filesystems are mounted 
read only.  The reason for this is that under a 2.4 kernel it is my 
understanding that dump doesn't work any more.  See lkml history for the 
reason why.  My very limited understanding is that the cache for 
directories moved, and that dump doesn't know about it.  So you could 
change a directory and it would only be in the cache, but dump would 
look on disk and in the old cache and not find the change in the new 
cache.  Linus said dump was no longer safe, and I believe him.

My guess is that having it mounted read only makes it safe (that is my 
guess don't take it as truth, I am not a kernel hacker I wouldn't know). 
  I haven't ever done it this way, but it should work fine if you are 
comfortable/good with dump and restore.

I normally have raid1 and lvm built into my kernel.  I use ext3 as my 
filesystem (I run RH7.2).  I have used reiserfs, but I like some of the 
stuff that ext3 does a lot (like the fact that it can be configured to 
journal all data as opposed to meta-data only) yes it is slower that 
way.  I haven't had the nerve to try the off device journal just yet.  I 
will get to it someday, just not today.

I have done it using either grub or lilo, with and w/o initrd images.  I 
have done all of them as a module thru initrd images (using that it 
should be easy to do a LVM root filesystem, no I have never done it 
makes recovery a pain).  If you are going to do that I would have an LVM 
partition that you boot to, and a duplicate non-LVM root in case of 
emergency that has the proper tools on it to recover the LVM and 
re-build and install a kernel from it.  I normally have at least one 
partition I can boot from that has all the appropriate modules and user 
land tools to do recovery from in case all hell breaks loose on the 
mirrors or LVM during a kernel recompile/install cycle.

I then remove all of the change the the *.old filesystems to be noauto 
and leave them around in cause I want to do a "restore" of a machine. 
To really do that correctly you have to re-mount the root filesystem 
read only while in single user mode and then store it way somewhere too.

I submitted patches to mount and e2fsprogs to support disk labels on LVM 
so hopefully that should get become standard, I apply my patches and 
install mount and e2fsprogs.  Then I label all of the ext2/3 filesystems 
and happy mounting (the LVM guys should have done that forever ago, LVM 
is much easier with that working).

About the only configuration I have never tried is to get it all up and 
running using devfs.

Colin, if you have a specific setup you want to achieve just let me know 
I have a couple of 40 GB drives lying around at home and a machine to 
tinker with.  I would happily figure out how to get an all raid all LVM 
configuration up and running and write up a mini-HOW-TO on my experince. 
  To be honest, I have never used LVM in a production environment, it is 
just something I tinker with at home because it is fun, and is the 
easiest way to convert from ext3 -> reiserfs and back.  If nothing else, 
I could hack a RH7.1/7.2 installer to do LVM.  That will take longer to 
get a working version of that, but it would be much more fun.  CC me 
personally to get my attention if you want more specifics or want me to 
tinker with a specific setup.  Just because the recovery would be a 
pain, doesn't mean I won't figure it out if somebody would find it useful.

	It might also be a bit of a total hack depending on how I go about 
getting it up and running.

	Thanks,
		Kirby






Colin Coe wrote:

> Hi all
> 
> Kirby, can you describe how you use software raid and lvm?  I have been
> trying to install RH7.1 directly onto software raid and lvm without success.
> 
> Any help much appreciated.
> 
> CC
> 
> 
>>-----Original Message-----
>>From:	Kirby C. Bohling [SMTP:kbohling@birddog.com]
>>Sent:	Saturday, December 29, 2001 2:36 AM
>>To:	linux-lvm@sistina.com
>>Subject:	Re: [linux-lvm] RAID support...
>>
>>Michael,
>>
>>	I am replying to you personally, and not forwarding it to the list,
>>not 
>>sure if that is correct netiquetee or not.  Here is the a link to the 
>>FAQ entry that discuss precisely the issue.  Basically, the primary 
>>developer disagrees with you.
>>
>>I happen to agree with him, but that is because I end up using software 
>>RAID and mirror everything and then build LVM devices out of them. 
>>Technically there is not speed advantage for doing it for anything 
>>except for RAID0 in the LVM.  It causes a lot of code duplication 
>>between the software RAID and the LVM.
>>
>>	A strong case could be made for a more GUI/command line capable disk
>>
>>volume management that encompassed RAID/LVM/GFS/ext3/XFS/JFS/ReiserFS/nb 
>>and every other thing under the sun to make administration easier, but 
>>well, somebody will get to it, just not today.
>>
>>http://tech.sistina.com/cgi-bin/lvm-faqprocessor.cgi?q=Why%20does%20LVM%20
>>not%20support%20mirroring%3F
>>
>>
>>	Kirby
>>
>>
>>Michael O'Rourke wrote:
>>
>>
>>>To whom it may concern,
>>>
>>>Not that this is a show stopper, but it seems that the LVM is missing 
>>>important capabilities such as RAID 1 & 5.  I see that you already 
>>>support RAID 0, but that's it.  In my opinion, it makes sense to merge 
>>>the RAID support (seperate product) with the LVM product.  Because the 
>>>two really complement each other. 
>>>Sincerely,
>>>Michael O'Rourke
>>>Unix System Admin
>>>Per-Se' Technologies
>>>
>>>
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@sistina.com
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>
>>
>>-- 
>>Real Programmers view electronic multimedia files with a hex editor.
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
> 
> **************************************************************************
> Bunnings Legal Disclaimer: 
> 
> 1) 	This document is confidential and may contain legally privileged 
> 	information. If you are not the intended recipient you must not 
> 	read, copy, distribute or act in reliance on it.
> 	If you have received this document in error, please telephone
> 	us immediately on (08) 9365-1555. 
> 
> 2)	All e-mails sent to and sent from Bunnings Building Supplies are
> 	scanned for content. Any material deemed to contain inappropriate
> 	subject matter will be reported to the e-mail administrator of
> 	all parties concerned.
> 
> **************************************************************************
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


-- 
Real Programmers view electronic multimedia files with a hex editor.
