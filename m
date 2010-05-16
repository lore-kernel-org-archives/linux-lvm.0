Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4G4dMDU018688
	for <linux-lvm@redhat.com>; Sun, 16 May 2010 00:39:22 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4G4dEgY025293
	for <linux-lvm@redhat.com>; Sun, 16 May 2010 00:39:15 -0400
Date: Sat, 15 May 2010 23:37:43 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4BEF71AA.8090104@gmail.com> (from kanonmatswe@gmail.com on Sat
	May 15 23:16:42 2010)
Message-Id: <1273984663.14159.12@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM Logical Volumes viewing partitions, mounting,
 creating, sda moved to sdb. KUbuntu 10.4
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

    Most of your questions are probably answered by
"man lvm".  The "lvm" command also goes by other names,
each with their own man page, and you'll probably want
to start with the tools to scan for LVM "things":

pvscan
vgscan
lvscan

> Why don't fdisk&  parted support it properly yet?

    The same reason that screwdrivers don't know
anything about televisions.  Screwdrivers are for
screws.  Televisions may have screws as one of their
parts, just as partitions may be used to build physical
volumes, but the partition tools only care about the
partitions, not what you might be building from them.

    Generally, physical volumes go on partitions, volume
groups go on partitions, and logical volumes go on volume
groups.  So a logical volume is three steps removed from
a partition, maybe four if RAID is included.  Is it confusing -
yeah, a little bit at first, but the same indirection that
makes it a little complicated makes it SUPER flexible.
Some people actually partition their logical volumes,
putting what I consider to be the "bottom" level on
top.  I normally do RAID on the bottom, then partitions,
then physical volumes, but I've seen people mix up
the order in all sorts of ways for their specific needs.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/15/2010 11:16:42 PM, kanonmatswe wrote:
> On 05/15/2010 01:17 AM, giovanni_re wrote:
>> I got no answer on the Ubuntu list, so trying here.
>> 
>> ==
>> KU 10.4.  Desktop with2 hdisks. 1.5TB has 9.04, was hda/sda. Now  
>> install
>> a 2TB as sda, move old disk to sdb.
>> 
>> Alternate install 10.4 on the 2TB sda.  Grub finds the 9.04 install  
>> on
>> sdb,&  installs fine on sda.
>> 
>> Both installs have a /home partition in their sda4 logical partition,
>> probably sda5 on each drive when they were installed.
>> 
>> 10.4 boots fine on the 2tb, but 9.4 refuses to boot off now sdb.
>> 
>> Less important question:  Suggestions for getting the 9.4 to boot  
>> when
>> that drive has been moved from sda to sdb (data connector on the
>> motherboard).  It's probably a mount issue?
>> 
>> 
>> ==  How does one see the logical partitions??
>> 
>> fdisk -l,&  parted -l,&  gparted, I have used - a few days ago, so I
>> don't recall the specifics right now.
>> 
>> IIRC, on 9.04 as sda, gparted would see the LVs,&  show some info  
>> about
>> them.
>> 
>> When I boot 10.4, IIRC gparted doesn't pull up any info about the  
>> LV's,
>> even on the sda drive with the 10.4 os it booted from. :(
>> 
>> IIRC, none of those programs show info about the LV's on sdb, which  
>> has
>> the 9.4 install on it.
>> 
>> So, is LVM properly supported in some partition creation/diagnostic
>> sw??? ex: fdisk, parted, gparted?  Is there some other program that  
>> will
>> at least see,&  perhaps show some info about those partitions?
>> 
>> How about creating more LVs in the free space on the drives?  What sw
>> can do that from the running 10.4 system? (ie, I don't want to have  
>> to
>> use the alternate installer disk to do partitioning, now that the os  
>> is
>> installed.  I'm hoping that is possible - hasn't LVM been out for  
>> quite
>> a while?  Why don't fdisk&  parted support it properly yet?  BTW,  
>> what
>> orgs create&  support the LVM sw? GNU? Linux Kernel?? Other?
>> 
>> ==
>> Most Important:  How can I get 10.4 to be able to see&  mount the 9.4
>> /home partition which is now on (probably) sdb5?  What info will be
>> needed by the mount command? UDEV #?  What sw (parted, fdisk,???)  
>> will
>> show the info necessary to use in the mount commnad??
>> 
>> 
>> ==
>> Refs:
>> http://en.wikipedia.org/wiki/Logical_Volume_Manager_%28Linux%29
>> http://sourceware.org/lvm2/
>> http://sunoano.name/ws/lvm.html
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> 
>> ==
>> Any other suggestions about mail lists or places to get other  
>> informed
>> answers about this?
>> 
>> Thanks for all thoughts/suggestions. :)
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
> Logical partitions don't have much to do with lvm, which is a layer  
> above disk partitions. Maybe you mean "logical volumes"? To see what  
> you can do with lvm: "man lvm" if you have the lvm2 pkg installed.
> Have you read the howto?http://tldp.org/HOWTO/LVM-HOWTO/   After a  
> read, I suggest "modprobe dm_mod" to load the necessary module into  
> the kernel and "vgchange -ay", then see what lvm stuff you have with  
> "pvdisplay", "vgdisplay" and "lvdisplay". I think there might be a  
> lvm2 init script, but I don't know where ubuntu places those. This  
> may be offtopic, but you can use labels or UUIDs (for example in grub  
> and fstab) to keep track of partitions. My logical volumes have  
> UUIDs, but I usually mount them with the "mapper" path. Something  
> like: /dev/mapper/<VOLUMEGROUP>/<VOLUMENAME>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
