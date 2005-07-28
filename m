Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6SLQpV14758
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 17:26:51 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6SLQZ6c018511
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 17:26:35 -0400
Subject: Re: [linux-lvm] How do you create large numbers of LVs? (In the
	1000s) Is it even possible?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <cc281aa8b962d8295b3182a731f7d133@redhat.com>
References: <42E92D7E.5090900@levanta.com>
	<1122578286.9888.47.camel@localhost.localdomain>
	<511428deb4d089c0e0d213b7e81a9fe7@redhat.com>
	<1122583121.9888.57.camel@localhost.localdomain>
	<cc281aa8b962d8295b3182a731f7d133@redhat.com>
Date: Thu, 28 Jul 2005 17:26:31 -0400
Message-Id: <1122585991.9888.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I did vgchange -an vg1

and then still fail

[root@fc3-i386-2 ~]# lvcreate -L12M -ntv282 vg1
  VG vg1 metadata writing failed
[root@fc3-i386-2 ~]# lvcreate -vvvvv -L12M -ntv282 vg1
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Getting target version for linear
        dm version
        dm versions
      Getting target version for striped
        dm versions
      Locking /var/lock/lvm/V_vg1 WB
    Finding volume group "vg1"
        Opened /dev/sda
      /dev/sda: No label detected
        Opened /dev/md0
        /dev/md0: Failed to read label area
        Opened /dev/sda1
      /dev/sda1: No label detected
        Opened /dev/sda2
      /dev/sda2: No label detected
        Opened /dev/sda3
      /dev/sda3: No label detected
        Opened /dev/sdb
      /dev/sdb: No label detected
        Opened /dev/sdb1
      /dev/sdb1: lvm2 label detected
      /dev/sdb1: lvm2 label detected
        Read vg1 metadata (710) from /dev/sdb1 at 50688 size 65377
    Creating logical volume tv282
        Allowing allocation on /dev/sdb1 start PE 843 length 180
    Archiving volume group "vg1" metadata.
  VG vg1 metadata writing failed
      Unlocking /var/lock/lvm/V_vg1
        Closed /dev/sda
        Closed /dev/md0
        Closed /dev/sda1
        Closed /dev/sda2
        Closed /dev/sda3
        Closed /dev/sdb
        Closed /dev/sdb1

i use this script to create them

#!/bin/bash
# a simple loop to create large # of LV

LIMIT=300
a=1

while [ "$a" -le $LIMIT ]
do
        lvcreate -L10M -ntv$a vg1
        free
        let "a+=1"
done

not ram problem


[root@fc3-i386-2 ~]# free
             total       used       free     shared    buffers
cached
Mem:        255044      80704     174340          0      17776
47400
-/+ buffers/cache:      15528     239516
Swap:       522104          0     522104

[root@fc3-i386-2 ~]# lvextend --version
  LVM version:     2.00.25 (2004-09-29)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.4.0

shall i try new version?

ming


On Thu, 2005-07-28 at 15:49 -0500, Jonathan E Brassow wrote:
> yeah...  it could be a memory issue which is causing the difference in 
> active lvs.
> 
> It could be the fact that he starts with _inactive_ lvs that allows him 
> to create so many to start.
> 
> To see if you are experiencing the same bug, you could 'vgchange -an 
> <vol_name>' and then try to create a bunch of lvs...  Then, once 
> created, try to activate them.
> 
>   brassow
> 
> On Jul 28, 2005, at 3:38 PM, Ming Zhang wrote:
> 
> > i think this is strange that this guy can at least create 1500 lv but
> > fail to activate them all.
> >
> > here what i found is i even can not create ~300 lv.
> >
> >
> > ming
> >
> >
> > On Thu, 2005-07-28 at 15:32 -0500, Jonathan E Brassow wrote:
> >> I think the problem you are seeing is similar to the one found in
> >> bugzilla (164198).  Would you be willing to add some notes there?  It
> >> will give you a place to track the progress...
> >>
> >> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=164198
> >>
> >>   brassow
> >>
> >> On Jul 28, 2005, at 2:18 PM, Ming Zhang wrote:
> >>
> >>> On Thu, 2005-07-28 at 12:09 -0700, Nathaniel Stahl wrote:
> >>>> We'd like to be able to create a large number of LVs (potentially
> >>>> numbering in the low thousands).  I get failure after LV 226 or so,
> >>>> though - "VG VolGroup01 metadata writing failed".
> >>>>
> >>>> RedHat claims this should be possible with LVM2 on the following web
> >>>> page:
> >>>>
> >>>> http://www.redhat.com/magazine/009jul05/features/lvm2/
> >>>>
> >>>> I admit to being a little suprised at the 2^32 max LV claim - I was
> >>>> figuring 2^20 as the theoretical max given 2.6's 32 bit device
> >>>> numbering
> >>>> scheme (20 bits for minor, 12 bits for major).
> >>>>
> >>>> The LVM2 code, at least version 2.00.25 as distributed in FC3, 
> >>>> appears
> >>>> to have a check that the minor number is strictly less than 256.
> >>>> Removing this check allows for the creation of working LVs using
> >>>> minors
> >>>> greater than 256, but LV creation fails with the error "VG 
> >>>> VolGroup01
> >>>> metadata writing failed" creating the 227th LV.  Even with the minor
> >>>> limit in place - I can't create more than 226 LVs.
> >>>
> >>> i asked this question before. there is a hard coded limitation in lvm
> >>> metadata, so the real number is like this, limited around 2xx. the
> >>> limitation will be removed in near future. how near? i do not know. 
> >>> :)
> >>>
> >>>
> >>>>
> >>>> Is there a patch that allows this limit to be broken?  Should I be
> >>>> using
> >>>> a newer version of the tools?  If not currently possible, is this
> >>>> something that will be in the near future?
> >>>>
> >>>> Thanks for any help/advice you can give.
> >>>>
> >>>> -Nate Stahl
> >>>>
> >>>> _______________________________________________
> >>>> linux-lvm mailing list
> >>>> linux-lvm@redhat.com
> >>>> https://www.redhat.com/mailman/listinfo/linux-lvm
> >>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>>
> >>> _______________________________________________
> >>> linux-lvm mailing list
> >>> linux-lvm@redhat.com
> >>> https://www.redhat.com/mailman/listinfo/linux-lvm
> >>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>>
> >>
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
