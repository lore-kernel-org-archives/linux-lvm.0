Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8SK5Ir31034
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 16:05:18 -0400
Received: from xserver.local.net (c-24-10-226-185.client.comcast.net
	[24.10.226.185])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8SK5Hwk003497
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 16:05:17 -0400
Received: from [192.168.0.1] (xserver.local.net [192.168.0.1])
	by xserver.local.net (8.12.10/8.12.10/SuSE Linux 0.7) with ESMTP id
	i8SK5ABW027099
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 14:05:10 -0600
From: Chris Worley <cworley@symbionsys.com>
Content-Type: multipart/mixed; boundary="=-pfp73/4GyPoBmTX8DXa2"
Message-Id: <1096401910.26794.6.camel@xserver.local.net>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 14:05:10 -0600
Subject: [linux-lvm] [Fwd: Re: SUSE 9.1 with ReiserFS:  / won't fsck,
	but is otherwise fine]
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-pfp73/4GyPoBmTX8DXa2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I had thought this was a Reiser issue, but am now convinced it's not.

In summary, any attempt by any non-lvm app to read an LVM volume (which
is mounted as the root partition) is told the device does not exist. 
LVM apps seemingly work fine, but I don't want to add disks to this
volume until I know what's going on or have fixed the problem.

I've attached the background info...

--=-pfp73/4GyPoBmTX8DXa2
Content-Type: multipart/digest; boundary="=-7Q0soKh4utNT1YOP+Q5u"
Content-Description: Forwarded messages


--=-7Q0soKh4utNT1YOP+Q5u
Content-Disposition: inline
Content-Description: Forwarded message - Re: SUSE 9.1 with ReiserFS:  /
	won't fsck, but is otherwise fine
Content-Type: message/rfc822

Return-Path: <reiserfs-list-return-21943-cworley=symbionsys.com@namesys.com>
Received: from thebsh.namesys.com (thebsh.namesys.com [212.16.7.65]) by
	xserver.local.net (8.12.10/8.12.10/SuSE Linux 0.7) with SMTP id
	i8RMeRBW013341 for <cworley@symbionsys.com>;
	Mon, 27 Sep 2004 16:40:28 -0600
Received: (qmail 5371 invoked by uid 501); 27 Sep 2004 22:40:16 -0000
Mailing-List: contact reiserfs-list-help@namesys.com; run by ezmlm
Precedence: bulk
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
X-Mailing-List: reiserfs-list@namesys.com
Delivered-To: mailing list reiserfs-list@namesys.com
Received: (qmail 5342 invoked by uid 85); 27 Sep 2004 22:40:15 -0000
Received: from cworley@symbionsys.com by thebsh.namesys.com by uid 82 with
	qmail-scanner-1.15 (spamassassin: 2.43-cvs. Clear:SA:0(0.0/2.0
	tests=none
	autolearn=no version=2.60):.  Processed in 0.608207 secs); 27 Sep 2004
	22:40:15 -0000
Received: from c-24-10-226-185.client.comcast.net (HELO xserver.local.net)
	(24.10.226.185) by thebsh.namesys.com with SMTP;
	27 Sep 2004 22:40:14 -0000
Received: from [192.168.0.1] (xserver.local.net [192.168.0.1]) by
	xserver.local.net (8.12.10/8.12.10/SuSE Linux 0.7) with ESMTP id
	i8RMe2BW013337; Mon, 27 Sep 2004 16:40:02 -0600
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
From: Chris Worley <cworley@symbionsys.com>
To: evilninja <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com
In-Reply-To: <41589155.1050405@gmx.net>
References: <1095996040.10293.18.camel@xserver.local.net>
	<200409241116.09066.vitaly@namesys.com>
	<1096032016.17001.4.camel@xserver.local.net>
	<200409271844.11580.vitaly@namesys.com>
	<1096301165.9096.14.camel@xserver.local.net> <41589155.1050405@gmx.net>
Content-Type: text/plain
Message-Id: <1096324801.9096.41.camel@xserver.local.net>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.6 
Date: Mon, 27 Sep 2004 16:40:02 -0600
X-Spam-DCC: : 
X-Spam-Checker-Version: SpamAssassin 2.63 (2004-01-11) on xserver.local.net
X-Spam-Level: 
X-Spam-Status: No, hits=-2.2 required=5.0 tests=BAYES_00,RCVD_IN_DYNABLOCK,
	RCVD_IN_SORBS autolearn=no version=2.63
Content-Transfer-Encoding: 7bit

On Mon, 2004-09-27 at 16:16, evilninja wrote:
> ah, now this is funny. dd doesn't care about the filesystem and can't even
> read the device. 
> this does not seem like a (reiser-)fs issue, more like a
> corrupted partition table / device

I agree that it's not a reiser issue... but, how did it get mounted in
the first place?

>  (if the data on
> /dev/mapper/system-lvol0 is not (!) important, you could play around with

I find the root partition an invaluable part of the system.  So, I'm not
going to destroy it on purpose.  I'm not quite sure how to boot without
a root partition ;)

I'm really looking for a non-destructive way to test/repair whatever has
happened.  The partitioning seems fine (an ext3 boot directory of a few
MB, an 8GB swap, and the root partition):

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1           5       40131   83  Linux
/dev/hda2               6         979     7823655   82  Linux swap
/dev/hda3             980       30515   237247920   8e  Linux LVM

Chris

--=-7Q0soKh4utNT1YOP+Q5u
Content-Disposition: inline
Content-Description: Forwarded message - Re: SUSE 9.1 with ReiserFS:  /
	won't fsck, but is otherwise fine
Content-Type: message/rfc822

Return-Path: <reiserfs-list-return-21897-cworley=symbionsys.com@namesys.com>
Received: from thebsh.namesys.com (thebsh.namesys.com [212.16.7.65]) by
	xserver.local.net (8.12.10/8.11.6/SuSE Linux 0.5) with SMTP id
	i8O3LRfB010753 for <cworley@symbionsys.com>;
	Thu, 23 Sep 2004 21:21:28 -0600
Received: (qmail 11480 invoked by uid 501); 24 Sep 2004 03:20:55 -0000
Mailing-List: contact reiserfs-list-help@namesys.com; run by ezmlm
Precedence: bulk
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
X-Mailing-List: reiserfs-list@namesys.com
Delivered-To: mailing list reiserfs-list@namesys.com
Received: (qmail 11450 invoked by uid 85); 24 Sep 2004 03:20:49 -0000
Received: from cworley@symbionsys.com by thebsh.namesys.com by uid 82 with
	qmail-scanner-1.15 (spamassassin: 2.43-cvs. Clear:SA:0(0.0/2.0
	tests=none
	autolearn=no version=2.60):.  Processed in 0.855981 secs); 24 Sep 2004
	03:20:49 -0000
Received: from c-24-10-226-185.client.comcast.net (HELO xserver.local.net)
	(24.10.226.185) by thebsh.namesys.com with SMTP;
	24 Sep 2004 03:20:48 -0000
Received: from [192.168.0.1] (xserver.local.net [192.168.0.1]) by
	xserver.local.net (8.12.10/8.11.6/SuSE Linux 0.5) with ESMTP id
	i8O3KefB010750 for <reiserfs-list@namesys.com>;
	Thu, 23 Sep 2004 21:20:41 -0600
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
From: Chris Worley <cworley@symbionsys.com>
To: reiserfs-list@namesys.com
Message-Id: <1095996040.10293.18.camel@xserver.local.net>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.6 
Date: Thu, 23 Sep 2004 21:20:40 -0600
X-Spam-Checker-Version: SpamAssassin 2.60 (1.212-2003-09-23-exp) on 
	thebsh.namesys.com
X-Spam-DCC: : 
X-Spam-Status: No, hits=0.0 required=2.0 tests=none autolearn=no version=2.60
Content-Type: text/plain; CHARSET=US-ASCII
Content-Transfer-Encoding: 7bit

I have a similar problem to:

On 2004-07-15 13:06:46 Vitaly Fertman Wrote:
> Hello,
> 
> >...
> >
> > Boot --> please use fsck manualy on /
> 
> what version of reiserfsck are you using? please update 
> reiserfsprogs to the latest one from our ftp site. 
> 

I'm using 3.6.13... which version do you propose?

> ...

I'm getting the same error where the ReiserFS root partition won't fsck,
but seems otherwise fine:

I "fixed" it by replacing /sbin/mkfs.reiserfs with a script that always
returns true... now the system boots fine ;)

It's a Reiser fs atop an LVM block device of one partition.  The problem
started when I switched from lilo to grub... that could be irrelevant.

Once booted, Reiser still doesn't even recognize the root file system (I
saved the executable in fsck.reiserfs.bak):

        # /sbin/fsck.reiserfs.bak /dev/system/lvol0
        reiserfsck 3.6.13 (2003 www.namesys.com)
        
        *************************************************************
        ** If you are using the latest reiserfsprogs and  it fails **
        ** please  email bug reports to reiserfs-list@namesys.com, **
        ** providing  as  much  information  as  possible --  your **
        ** hardware,  kernel,  patches,  settings,  all reiserfsck **
        ** messages  (including version),  the reiserfsck logfile, **
        ** check  the  syslog file  for  any  related information. **
        ** If you would like advice on using this program, support **
        ** is available  for $25 at  www.namesys.com/support.html. **
        *************************************************************
        
        Will read-only check consistency of the filesystem on /dev/system/lvol0
        Will put log info to 'stdout'
        
        Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
        
        Failed to open the device '/dev/system/lvol0': No such device or address
        
        Aborted
 
Note: I'm running a fully patched 9.1.  I've been able to use this
fsck.reiserfs to examine other LVM based file systems that were created
under previous LVM and ReiserFS versions.  The volume is currently only
made up of /dev/hda3.  Both the lvm block device and reiser format were
created under SuSE9.1 (before patching).  LVM has no problems: 

         # pvscan
          PV /dev/hda3   VG system   lvm2 [226.25 GB / 0    free]
          PV /dev/hdd1               lvm2 [233.76 GB]
          Total: 2 [460.01 GB] / in use: 1 [226.25 GB] / in no VG: 1 [233.76 GB]
         # vgdisplay
          --- Volume group ---
          VG Name               system
          System ID
          Format                lvm2
          Metadata Areas        1
          Metadata Sequence No  2
          VG Access             read/write
          VG Status             resizable
          MAX LV                255
          Cur LV                1
          Open LV               1
          Max PV                255
          Cur PV                1
          Act PV                1
          VG Size               226.25 GB
          PE Size               4.00 MB
          Total PE              57921
          Alloc PE / Size       57921 / 226.25 GB
          Free  PE / Size       0 / 0
          VG UUID               glCBN4-xLPB-eGJO-4YVO-p4Hj-ZRMW-LFvJfJ
        # lvdisplay
          --- Logical volume ---
          LV Name                /dev/system/lvol0
          VG Name                system
          LV UUID                j9z3cd-hY3R-4unM-UwZs-BXVZ-WMJN-iMIvXF
          LV Write Access        read/write
          LV Status              available
          # open                 2
          LV Size                226.25 GB
          Current LE             57921
          Segments               1
          Allocation             next free (default)
          Read ahead sectors     0
          Block device           254:0
        # pvdisplay
          --- Physical volume ---
          PV Name               /dev/hda3
          VG Name               system
          PV Size               226.25 GB / not usable 0
          Allocatable           yes (but full)
          PE Size (KByte)       4096
          Total PE              57921
          Free PE               0
          Allocated PE          57921
          PV UUID               wQnbCq-FQT9-76gh-HjFP-kBi3-7lE8-psDnAj
        
          --- NEW Physical volume ---
          PV Name               /dev/hdd1
          VG Name
          PV Size               233.76 GB
          Allocatable           NO
          PE Size (KByte)       0
          Total PE              0
          Free PE               0
          Allocated PE          0
          PV UUID               lZ0dSs-FR6O-i7fo-z5xZ-APMR-CcBq-Fmm425
        # df
        Filesystem           1K-blocks      Used Available Use% Mounted on
        /dev/mapper/system-lvol0
                             237237168 141678036  95559132  60% /
        tmpfs                   517676         0    517676   0% /dev/shm
        /dev/hda1                38856     18321     18529  50% /boot

Other than fsck, there's no other hint that something is wrong with this
partition.

If this partition were at the beginning of the disk (and not 8GB into
the disk) I'd think grub had destroyed something beyond the MBR... but
this is too far into the disk.

Any idea what's wrong with this root partition and what I could do to
recover it?

Thanks,

Chris


--=-7Q0soKh4utNT1YOP+Q5u--


--=-pfp73/4GyPoBmTX8DXa2--
