Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j21GhdK08079
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 11:43:39 -0500
Received: from dermis.amis.com (dermis.amis.com [207.141.5.253])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j21GhcMr023369
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 11:43:39 -0500
Message-ID: <42249BB2.7010901@theserrs.net>
Date: Tue, 01 Mar 2005 09:43:30 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA6AM/OwSzgkau2+5tufHyMgEAAAAA@echohome.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA6AM/OwSzgkau2+5tufHyMgEAAAAA@echohome.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

Erik Ohrnberger wrote:

>Dear Peeps of the LVM discussion list,
>
>    In the past you've come to my rescue a number of times, and I wish to
>thank you all for this assistance.
>
>    I fear that my desires have once again out stripped my hands on
>practical knowledge.  So I pose to you this discussion.  Mind you that if
>there is a web page that covers the topic, please don't hesitate to point
>into that direction.  This has been a self study project all along.
>
>Some History: (skip if you want - see The Questions below)
>=============
>    I've had a LVM up and running for some time for large file storage.  As
>the storage needs grew, it was easy to add another hard disk, add it to the
>volume group, and grow the file system.  This worked fairly seamlessly and
>easily, and I figured it all out from the howtos and other information
>resources.  The same held true for when the need for storage decreased and I
>squeezed hard drives out of the file system and then the volume group.
>Cool!  Up until one of the active hard disks with data died, and I lost
>nearly all my data.  Oh well.  That's the way that it goes.  Thank the
>computer gods that there was nothing of the data really all that terribly
>irreplaceable, but still....
>
>    After this I just went and got a 200 GB drive and left it at that (I was
>going to school and had limited time for my computer addiction).  But now
>that I'm done with that, I'm thinking of building a MythTV system, and I'm
>certain that I will want to have a large amount of robust storage available
>on the network.  So the question is what's the best way to build it?
>
>The Questions:
>==============
>    It seems to me that RAID5 with at least one hot spare hard disk is one
>of the safest ways to go for this type of storage.  The only concern that I
>have is specific to the wide variety of hard disk sizes that I have
>available (2 40GB, 1 60GB, 2 80GB, and I'll probably add the 200GB drive
>once I've migrated that data off it to the array).  My limited understanding
>of RAID5 is that it's best if all the hard drives are exactly the same.  Is
>this true?  What are the downsides of using such a mix of hard disk sizes?
>  
>
The down side is the partitions that make up a RAID5 have to match in 
size, if they don't - the RAID5 just uses the minimum partition size of 
the set for EACH partition.  So if you have 20GB, 30GB, 40GB.  10GB of 
the 30GB will be wasted.  20GB of the 40GB will be wasted.  So you might 
as well use the wasted space for scratch etc.  You can optimize your 
disk use but you never want to include TWO partitions from one disk in 
the same RAID set.  Right?

>    Being able to resize the storage is a key, as is having a robust and
>reliable storage pool.  As storage demands rise and fall, it's great to have
>the flexibility to add and drop hard disks from the storage pool and use
>them for other things, resizing the file system and the volume group as you
>go along, of course.  If the storage pool is RAID5, and I add a larger hard
>disk to the pool as a hot spare, and then use the software tools to fault
>out the drive that I want, forcing a reconstruction, couldn't I pull the
>faulted drive out, and use it for something else?  What sort of shape or
>state will the RAID5 array be in at this point?  Will it use all of the
>space on the newly added hot spare?
>  
>
I haven't use hot spares on Linux, a little on Solaris.  You could do 
what you say in theory.  But normally on low budget stuff it's not "hot 
plug" so you would have to shutdown and pull out your main drive.  In my 
situation this would be bad, because I don't do my / (root) on RAID5.  I 
could boot my "backup" root that I make with rsync, but then I would 
have to fix the fstab and make sure GRUB is installed on there and have 
a BIOS that will point to hdb (not just hda) for booting. 

>    Again, if there is a discussion thread that I've not found that covers
>these questions and this topic, I will not be offended by a mere pointer to
>the web page, I wish to educate myself about the trade offs to arrive at the
>best possible compromise for my needs.
>
>    Thanks as always and in advance.
>        Erik.
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>
