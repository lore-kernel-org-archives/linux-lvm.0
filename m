Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4G4GrvG015892
	for <linux-lvm@redhat.com>; Sun, 16 May 2010 00:16:53 -0400
Received: from mail-ew0-f227.google.com (mail-ew0-f227.google.com
	[209.85.219.227])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4G4GiW0024919
	for <linux-lvm@redhat.com>; Sun, 16 May 2010 00:16:45 -0400
Received: by ewy27 with SMTP id 27so1112842ewy.30
	for <linux-lvm@redhat.com>; Sat, 15 May 2010 21:16:44 -0700 (PDT)
Message-ID: <4BEF71AA.8090104@gmail.com>
Date: Sun, 16 May 2010 06:16:42 +0200
From: kanonmatswe <kanonmatswe@gmail.com>
MIME-Version: 1.0
References: <1273879056.3562.1375146815@webmail.messagingengine.com>
In-Reply-To: <1273879056.3562.1375146815@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 05/15/2010 01:17 AM, giovanni_re wrote:
> I got no answer on the Ubuntu list, so trying here.
>
> ==
> KU 10.4.  Desktop with2 hdisks. 1.5TB has 9.04, was hda/sda. Now install
> a 2TB as sda, move old disk to sdb.
>
> Alternate install 10.4 on the 2TB sda.  Grub finds the 9.04 install on
> sdb,&  installs fine on sda.
>
> Both installs have a /home partition in their sda4 logical partition,
> probably sda5 on each drive when they were installed.
>
> 10.4 boots fine on the 2tb, but 9.4 refuses to boot off now sdb.
>
> Less important question:  Suggestions for getting the 9.4 to boot when
> that drive has been moved from sda to sdb (data connector on the
> motherboard).  It's probably a mount issue?
>
>
> ==  How does one see the logical partitions??
>
> fdisk -l,&  parted -l,&  gparted, I have used - a few days ago, so I
> don't recall the specifics right now.
>
> IIRC, on 9.04 as sda, gparted would see the LVs,&  show some info about
> them.
>
> When I boot 10.4, IIRC gparted doesn't pull up any info about the LV's,
> even on the sda drive with the 10.4 os it booted from. :(
>
> IIRC, none of those programs show info about the LV's on sdb, which has
> the 9.4 install on it.
>
> So, is LVM properly supported in some partition creation/diagnostic
> sw??? ex: fdisk, parted, gparted?  Is there some other program that will
> at least see,&  perhaps show some info about those partitions?
>
> How about creating more LVs in the free space on the drives?  What sw
> can do that from the running 10.4 system? (ie, I don't want to have to
> use the alternate installer disk to do partitioning, now that the os is
> installed.  I'm hoping that is possible - hasn't LVM been out for quite
> a while?  Why don't fdisk&  parted support it properly yet?  BTW, what
> orgs create&  support the LVM sw? GNU? Linux Kernel?? Other?
>
> ==
> Most Important:  How can I get 10.4 to be able to see&  mount the 9.4
> /home partition which is now on (probably) sdb5?  What info will be
> needed by the mount command? UDEV #?  What sw (parted, fdisk,???) will
> show the info necessary to use in the mount commnad??
>
>
> ==
> Refs:
> http://en.wikipedia.org/wiki/Logical_Volume_Manager_%28Linux%29
> http://sourceware.org/lvm2/
> http://sunoano.name/ws/lvm.html
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> ==
> Any other suggestions about mail lists or places to get other informed
> answers about this?
>
> Thanks for all thoughts/suggestions. :)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>    
Logical partitions don't have much to do with lvm, which is a layer above disk partitions. Maybe you mean "logical volumes"? To see what you can do with lvm: "man lvm" if you have the lvm2 pkg installed.
Have you read the howto?http://tldp.org/HOWTO/LVM-HOWTO/   After a read, I suggest "modprobe dm_mod" to load the necessary module into the kernel and "vgchange -ay", then see what lvm stuff you have with "pvdisplay", "vgdisplay" and "lvdisplay". I think there might be a lvm2 init script, but I don't know where ubuntu places those. This may be offtopic, but you can use labels or UUIDs (for example in grub and fstab) to keep track of partitions. My logical volumes have UUIDs, but I usually mount them with the "mapper" path. Something like: /dev/mapper/<VOLUMEGROUP>/<VOLUMENAME>
