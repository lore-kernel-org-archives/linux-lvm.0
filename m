Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j21LLpK01951
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 16:21:51 -0500
Received: from dermis.amis.com (dermis.amis.com [207.141.5.253])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j21LLnqV007583
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 16:21:50 -0500
Received: from [172.16.98.4] (ws4.design.amis.com [172.16.98.4])
	by mxrelayus.pc.amis.com (Postfix) with ESMTP id B6FD058847
	for <linux-lvm@redhat.com>; Tue,  1 Mar 2005 14:21:43 -0700 (MST)
Message-ID: <4224DCE5.1010202@theserrs.net>
Date: Tue, 01 Mar 2005 14:21:41 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA6AM/OwSzgkau2+5tufHyMgEAAAAA@echohome.org>	<42249BB2.7010901@theserrs.net>
	<38256.64.233.217.29.1109708080.squirrel@www.echohome.org>
In-Reply-To: <38256.64.233.217.29.1109708080.squirrel@www.echohome.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Erik Ohrnberger wrote:

>On Tue, March 1, 2005 11:43, Scott Serr said:
>  
>
>>Erik Ohrnberger wrote:
>>
>>    
>>
>>>Dear Peeps of the LVM discussion list,
>>>      
>>>
>
>....snip....
>
>  
>
>>>The Questions:
>>>==============
>>>   It seems to me that RAID5 with at least one hot spare hard disk is
>>>one
>>>of the safest ways to go for this type of storage.  The only concern that
>>>I
>>>have is specific to the wide variety of hard disk sizes that I have
>>>available (2 40GB, 1 60GB, 2 80GB, and I'll probably add the 200GB drive
>>>once I've migrated that data off it to the array).  My limited
>>>understanding
>>>of RAID5 is that it's best if all the hard drives are exactly the same.
>>>Is
>>>this true?  What are the downsides of using such a mix of hard disk
>>>sizes?
>>>
>>>
>>>      
>>>
>>The down side is the partitions that make up a RAID5 have to match in
>>size, if they don't - the RAID5 just uses the minimum partition size of
>>the set for EACH partition.  So if you have 20GB, 30GB, 40GB.  10GB of
>>the 30GB will be wasted.  20GB of the 40GB will be wasted.  So you might
>>as well use the wasted space for scratch etc.  You can optimize your
>>disk use but you never want to include TWO partitions from one disk in
>>the same RAID set.  Right?
>>    
>>
>
>Not including two partitions from the same drive into the same raid set
>would make sense.  What would the redundancy of that be?  It wouldn't be.
>
>However, I've been thinking on this.  What if I took two small drives
>and raid-0'd them into a single larger block device, and then included
>that into the raid5 set.  Is this possible?
>
>20GB + 10GB (of 40GB) = md0 (raid 0)  then
>md0 + 40GB (what's left) + 40 GB = md1 (raid 5)
>
>Umm, right.  That would break the rules, 40GB is contributing twice to the
>raid5 set.  Hmmm.
>
>What if the I broke everything into 10 GB pieces, and created multiple raid5
>sets?  Then I could LVM2 them together and have a large filesystem that way.
>
>a=20GB, b=30GB, c=40GB
>
>a-1 + b-1 + c-1 = md0 (approx 30 GB storage)
>a-2 + b-2 + c-2 = md1 (approx 30 GB storage)
>      b-3 + c-3 = md2 (waiting for one more drive)
>            c-4 = md3 (waiting for two more drives)
>  
>
This is sorta what I do.  But in my opinion the gain of having RAID5 
(over RAID1) is when you get over 3 disks...  at 3 disks you are burning 
33% for redudnacy... 25% or 20% or  17% sounds better to me.  I guess if 
you go too far it costs in calculating the parity.

>>>   Being able to resize the storage is a key, as is having a robust and
>>>reliable storage pool.  As storage demands rise and fall, it's great to
>>>have
>>>the flexibility to add and drop hard disks from the storage pool and use
>>>them for other things, resizing the file system and the volume group as
>>>you
>>>go along, of course.  If the storage pool is RAID5, and I add a larger
>>>hard
>>>disk to the pool as a hot spare, and then use the software tools to fault
>>>out the drive that I want, forcing a reconstruction, couldn't I pull the
>>>faulted drive out, and use it for something else?  What sort of shape or
>>>state will the RAID5 array be in at this point?  Will it use all of the
>>>space on the newly added hot spare?
>>>
>>>
>>>      
>>>
>>I haven't use hot spares on Linux, a little on Solaris.  You could do
>>what you say in theory.  But normally on low budget stuff it's not "hot
>>plug" so you would have to shutdown and pull out your main drive.  In my
>>situation this would be bad, because I don't do my / (root) on RAID5.  I
>>could boot my "backup" root that I make with rsync, but then I would
>>have to fix the fstab and make sure GRUB is installed on there and have
>>a BIOS that will point to hdb (not just hda) for booting.
>>    
>>
>
>Well, I wasn't thinking hot swapping.  I'd shut the machine down to add and
>remove hard disks, but the idea is to make use of the reconstruction as a
>means for migrating hard disks into and out of the raid array, and it sounds
>like that would work OK.
>  
>
I've thought about it...  But once you have close to a terrabyte of 
stuff that isn't backed up, well...  atleast I whimped out on this.  I'm 
sure it would work in theory and 99% in practice.
