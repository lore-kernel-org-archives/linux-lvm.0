Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB6NmJr13243
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 18:48:19 -0500
Received: from mypxgw01.bco-home.com (fqdn.bco.com [65.212.182.194])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB6NmHae017748
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 18:48:18 -0500
Message-ID: <0F0A80F76F5AC046B9D428F09598451BB03DBA@mypxmail05.bco-home.com>
From: dclark@bco.com
Date: Mon, 6 Dec 2004 15:48:07 -0800 
MIME-Version: 1.0
Subject: [linux-lvm] Steps for adding DASD to existing LVM group using SLES9
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

Running SLES9 for S/390 (31-bit) in an LPAR > (no VM) using a shared IFL

Is there a "Howto" document for adding dasd to an existing LVM system volume
group?


/dev/system/home     /home                reiserfs   acl,user_xattr        1
2
/dev/system/opt      /opt                 reiserfs   acl,user_xattr        1
2
/dev/system/var      /var                 reiserfs   acl,user_xattr        1
2

I would like to add 3 more mod3 devices to my system and extend the capacity
of the /opt and /var filesystems.  

TIA

Doug
-----Original Message-----
From: linux-lvm-request@redhat.com [mailto:linux-lvm-request@redhat.com] 
Sent: Wednesday, September 01, 2004 7:11 PM
To: linux-lvm@redhat.com
Subject: linux-lvm Digest, Vol 7, Issue 1


Send linux-lvm mailing list submissions to
	linux-lvm@redhat.com

To subscribe or unsubscribe via the World Wide Web, visit
	https://www.redhat.com/mailman/listinfo/linux-lvm
or, via email, send a message with subject or body 'help' to
	linux-lvm-request@redhat.com

You can reach the person managing the list at
	linux-lvm-owner@redhat.com

When replying, please edit your Subject line so it is more specific than
"Re: Contents of linux-lvm digest..."


Today's Topics:

   1. LVM2 and Software RAID (Yang, Daniel)
   2. Re: LVM2 and Software RAID (Robin Green)
   3. Re: LVM2 and Software RAID (Peter A. Castro)
   4. LVM and Ghost (James P)
   5. Re: LVM and Ghost (Luca Berra)
   6. Re: LVM and Ghost (Clint Byrum)
   7. Re: LVM and Ghost (rich turner)
   8. Re: partition strategy (Arshavir Grigorian)
   9. Unable to format certain volumes with lvm2 & reiserfs
      (Stephen Boulet)


----------------------------------------------------------------------

Message: 1
Date: Tue, 31 Aug 2004 17:44:04 -0700
From: "Yang, Daniel" <dyang@tickets.com>
Subject: [linux-lvm] LVM2 and Software RAID
To: linux-lvm@redhat.com
Message-ID:
	<63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
Content-Type: text/plain; charset="us-ascii"

What information can you give on the reliability of using LVM2 w/ Software
RAID?  I've done some reading that stated that LVM and Software RAID on
Linux is not a good combination.  Especially b/c the combination does not
allow for adding or removing hard drives. Also, LVM does not allow for
mirroring capabilities so there is no way to mirror w/o the software RAID.
Finally, the combination does not support bad-block replacement mechanisms.
What can one do if a bad-block occurs in this type of setup?

 

Thanks,

 

DY

-------------- next part --------------
An HTML attachment was scrubbed...
URL: /archives/linux-lvm/attachments/20040831/96c2b0dd/attachment.htm

------------------------------

Message: 2
Date: Wed, 1 Sep 2004 16:22:34 +0100
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] LVM2 and Software RAID
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20040901152234.GB4300@localhost.localdomain>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 31, 2004 at 05:44:04PM -0700, Yang, Daniel wrote:
> Finally, the combination does not support bad-block replacement 
> mechanisms.

Bad block replacement has been implemented in hardware for years so this is
not an issue. If you get a huge number of bad blocks you should really
consider replacing the drive concerned.
-- 
Robin

Weblog: http://lrp.greenrd.org/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : /archives/linux-lvm/attachments/20040901/c173d2d9/attachment.bin

------------------------------

Message: 3
Date: Wed, 1 Sep 2004 10:54:13 -0700 (PDT)
From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: [linux-lvm] LVM2 and Software RAID
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Pine.LNX.4.58.0409011018470.4635@ming.fruitbat.org>
Content-Type: TEXT/Plain; charset=US-ASCII

On Tue, 31 Aug 2004, Yang, Daniel wrote:

> What information can you give on the reliability of using LVM2 w/ 
> Software RAID?  I've done some reading that stated that LVM and 
> Software RAID on Linux is not a good combination.  Especially b/c the 
> combination does not allow for adding or removing hard drives. Also, 
> LVM does not allow for mirroring capabilities so there is no way to 
> mirror w/o the software RAID. Finally, the combination does not 
> support bad-block replacement mechanisms. What can one do if a 
> bad-block occurs in this type of setup?

There are always pros and cons for using RAID and LVM.  For my money,
software raid is more flexible and more managable than hardware raid. Others
may disagree, of course :)

RAID is mostly about planning how you want your disks to be spliced together
and what kind of reliability over failure you are willing to live with.
This is true for software and hardware RAID.  Most hardware RAID adapters do
not allow for resizing an existing array.  It is possible to resize a
software RAID, but there is the potential for data loss.  The Software-RAID
HOWTO has a quick section on RAID resizing which might interested you.

See: http://tldp.org/HOWTO/Software-RAID-HOWTO.html

Software RAID, as you are aware, uses the computers processor to perform the
raid functions, where as hardware RAID has a separate processor on the RAID
adapter to perform these functions.  If you have a sufficiently fast
computer, the overhead of raid will hardly be noticed.

LVM, by contrast, is geared for adding and removing physical drives from a
volume group allowing one to add more storage or replace smaller drives with
larger ones.  The problem most people have is that they create one big raid
array and thus have only one volume group with only one physical device in
it.  Kinda hard to remove a device and retain your data in this
configuration :)

Most modern drives have automatic bad-block replacement internally.  If the
drive has more bad-blocks than available replacement blocks, then likely the
drive is header for failure anyways and should be replaced.

Perhaps you should consider what you want to do with your arrays.  If you
expect to be needing to add more redundant storage over time, then perhaps a
solution would be to create several small raid arrays on several drives.
Each array appears as a single "drive" to the system. This way, you can
group several "drives" together in a volume group.  If you need to add
storage, you simple replace one arrays' set of drives. With LVM, you can
move data off of that "drive", remove it from the volume group, change out
the physical drives, create the new array on these drives, then add it back
into the volume group, or simply add new disks, create a new array and add
it to the volume group.

Again, it's all about planning.  With Software RAID and LVM you have more
flexibility, and the above can be done while the system is live.  Most
hardware raids have to be setup from the adapters bios.

Good luck, whichever you choose.

> Thanks,
> DY

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood


------------------------------

Message: 4
Date: Wed, 01 Sep 2004 13:00:40 -0500
From: James P <superfueld@charter.net>
Subject: [linux-lvm] LVM and Ghost
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <41360E48.3030709@charter.net>
Content-Type: text/plain; charset=us-ascii; format=flowed

Some of our admins are running into trouble running Norton Ghost on 
our RHEL ES 3.0 boxes. Ghost claims it doesn't recognize what's on 
the disk so it just does a raw dump of the entire (36 Gig) disk. 
This offers practically zero compression, so we're getting ghost 
images that are many times larger than the amount of actual used 
space on the machine.

The only difference I can think of between these machines and our 
other Linux boxes that ghost perfectly well is that these are using 
LVM. Is this causing the problem with Ghost? Has anyone else run 
into this? What can we do to get Ghost to recognize where the data 
is on the disk so we can get some sort of reasonably sized images? 
Anything?

--James


------------------------------

Message: 5
Date: Wed, 1 Sep 2004 20:21:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and Ghost
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20040901182120.GF7576@percy.comedia.it>
Content-Type: text/plain; charset=us-ascii; format=flowed

do not hijack other people threads,
that said, probably norton ghost does not understand lvm.
you could look at Mondo Rescue (http://www.mondorescue.org/)

L.
On Wed, Sep 01, 2004 at 01:00:40PM -0500, James P wrote:
>The only difference I can think of between these machines and our
>other Linux boxes that ghost perfectly well is that these are using 
>LVM. Is this causing the problem with Ghost? Has anyone else run 

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \


------------------------------

Message: 6
Date: Wed, 01 Sep 2004 11:24:56 -0700
From: Clint Byrum <cbyrum@spamaps.org>
Subject: Re: [linux-lvm] LVM and Ghost
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <1094063096.12875.46.camel@localhost>
Content-Type: text/plain

On Wed, 2004-09-01 at 11:00, James P wrote:
> Some of our admins are running into trouble running Norton Ghost on
> our RHEL ES 3.0 boxes. Ghost claims it doesn't recognize what's on 
> the disk so it just does a raw dump of the entire (36 Gig) disk. 
> This offers practically zero compression, so we're getting ghost 
> images that are many times larger than the amount of actual used 
> space on the machine.
> 
> The only difference I can think of between these machines and our
> other Linux boxes that ghost perfectly well is that these are using 
> LVM. Is this causing the problem with Ghost? Has anyone else run 
> into this? What can we do to get Ghost to recognize where the data 
> is on the disk so we can get some sort of reasonably sized images? 
> Anything?
> 

Yes this is a Ghost problem. Ghost has no idea what LVM is. To it, LVM
appears as an unknown filesystem. You'll have to ask symantec to add LVM
support.

Just curious.. why even use ghost with RH Linux servers? I suppose
multicasting everything is nice.. but a two step process where you use a
kickstart for the install, and then a multicast file copy program (like
mcp, http://www.cl.cam.ac.uk/users/kj234/mcp/) for any data would at
least let you use free tools to accomplish your goal, and not leave you
hanging when you switch filesystems. ;)




------------------------------

Message: 7
Date: Wed, 01 Sep 2004 11:33:33 -0700
From: rich turner <rich@storix.com>
Subject: Re: [linux-lvm] LVM and Ghost
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <1094063612.3399.44.camel@rich>
Content-Type: text/plain

or you could look at Storix which definitely supports LVM.

On Wed, 2004-09-01 at 11:21, Luca Berra wrote:
> do not hijack other people threads,
> that said, probably norton ghost does not understand lvm.
> you could look at Mondo Rescue (http://www.mondorescue.org/)
> 
> L.
> On Wed, Sep 01, 2004 at 01:00:40PM -0500, James P wrote:
> >The only difference I can think of between these machines and our 
> >other Linux boxes that ghost perfectly well is that these are using 
> >LVM. Is this causing the problem with Ghost? Has anyone else run 
> 
> L.



------------------------------

Message: 8
Date: Wed, 01 Sep 2004 17:09:52 -0400
From: Arshavir Grigorian <ag@m-cam.com>
Subject: [linux-lvm] Re: partition strategy
To: linux-lvm@redhat.com
Message-ID: <41363AA0.5030107@m-cam.com>
Content-Type: text/plain; charset=us-ascii; format=flowed

Arshavir Grigorian wrote:

> Hi,
>
> This is my first post, so please bear with me.
>
> I have 2 free disk areas 230G and 231G. I hoping to take advantage of 
> RAID-0.
>
> Is it better to create 3 partitions 2 x230G + 1G - create a striped LV 
> over the first 2, then add the third to the volume group, then extend 
> the LV over to the new 1G extension (since LVM2 allows extending 
> striped lv-s). And if so, does the non-striped area get used as a last 
> resort (after the striped area is completely full)?
>
> OR
>
> Is it better to create 2 paritions 230G and 231G, put both in a vg, 
> create a striped lv and lvm will take care of striping to the 230G 
> mark, then writing linearly afterwards.
>
> TIA for any advice.
>
>
>
> Best,
>
> Arshavir
>
Hi,

I mailed the above message about a week ago and there have not been any 
reponses.
I am wondering whether there is a development list where I might have a 
better chance of getting an answer to my question (the HOWTO page did 
not mention any dev lists, so I am not sure).
Many thanks.


Arshavir


------------------------------

Message: 9
Date: Wed, 1 Sep 2004 21:10:57 -0500
From: Stephen Boulet <stephen@theboulets.net>
Subject: [linux-lvm] Unable to format certain volumes with lvm2 &
	reiserfs
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <200409012110.57955.stephen@theboulets.net>
Content-Type: text/plain;  charset="us-ascii"

I created some striped LVM2 volumes and I'm unable to format all but the
first 
one.

I did:
<<
pvcreate /dev/sda5
pvcreate /dev/sdb5
vgcreate lvm2 /dev/sda5 /dev/sdb5
lvcreate -i2 -I4 -L100G -nhome lvm2
lvcreate -i2 -I4 -L20G -nusr lvm2
lvcreate -i2 -I4 -L10G -nopt lvm2
lvcreate -i2 -I4 -L10G -nvar lvm2
lvcreate -i2 -I4 -L5G -ntmp lvm2
>>

Now I can do:

mkreiserfs /dev/lvm2/home

but trying the same thing on any of the other groups gives me:

<<
# mkreiserfs -f /dev/lvm2/var
mkreiserfs 3.6.18 (2003 www.namesys.com)

[snip]

Guessing about desired format.. Kernel 2.6.9-rc1 is running.
reiserfs_create_journal: cannot create a journal of 8193 blocks with 18
offset 
on 4096 blocks
>>

However, ext3 works:

<<
# mke2fs -j /dev/lvm2/opt
mke2fs 1.35 (28-Feb-2004)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
4096 inodes, 16384 blocks
819 blocks (5.00%) reserved for the super user
First data block=1
2 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks:
        8193

Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 27 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
>>

Did I do something wrong with the initial setup?

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"


------------------------------

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm


End of linux-lvm Digest, Vol 7, Issue 1
***************************************
