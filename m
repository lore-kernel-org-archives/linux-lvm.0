Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n7H1Ubqu023736
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 21:30:37 -0400
Received: from eastrmmtao103.cox.net (eastrmmtao103.cox.net [68.230.240.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n7H1UIfT003828
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 21:30:18 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao103.cox.net
	(InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP
	id <20090817013019.CHZL913.eastrmmtao103.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 21:30:19 -0400
Message-ID: <4A88B2A9.2060202@cox.net>
Date: Sun, 16 Aug 2009 20:30:17 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /dev/dm-* or /dev/mapper/*
References: <1250467733.18434.1330126635@webmail.messagingengine.com>
In-Reply-To: <1250467733.18434.1330126635@webmail.messagingengine.com>
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
To: linux-lvm@redhat.com

On 2009-08-16 19:08, Edward Siefker wrote:
> I originally set up raid-luks-lvm on this machine with debian's
> installer tool, now I am trying to add another encrypted raid1 device to
> the existing volume group.  I already have the raid device set up and
> encrypted, that's no problem.  Now the linux gazette
> (http://linuxgazette.net/140/pfeiffer.html) tells me I should run
> 'pvcreate' on the device in /dev/mapper.  However, if I examine my
> existing physical volumes with 'pvscan' I get the following:
> 
> iblis:/home/hatta# pvscan
>   PV /dev/dm-0   VG iblis-volumes   lvm2 [931.32 GB / 0    free]
>   Total: 1 [931.32 GB] / in use: 1 [931.32 GB] / in no VG: 0 [0   ]
> 
> Apparently I am using /dev/dm-0 instead of /dev/mapper/md1_crypt. I
> wondered if these were maybe two names for the same thing, so I checked
> ls:
> 
> iblis:/home/hatta# ls -ld /dev/dm-0 /dev/mapper/md1_crypt
> brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/dm-0
> brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/mapper/md1_crypt
> 
> Same major and minor number, if that means anything.  Next I ran
> 'dmcrypt info' on each:
> 
> iblis:/home/hatta# dmsetup info /dev/dm-0
> Device /dev/dm-0 not found
> Command failed
> iblis:/home/hatta# dmsetup info /dev/mapper/md1_crypt 
> Name:              md1_crypt
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        7
> Event number:      0
> Major, minor:      253, 0
> Number of targets: 1
> 
> 
> It works on one, and not the other.  So they're not the same thing.  My
> new device 'md2_crypt' corresponds to /dev/dm-8, if I am to trust the
> major/minor numbers. Should I run pvcreate on /dev/dm-8 or
> /dev/mapper/md2_crypt?

/dev/dm-* device names seem to go in sequence of when they are 
discovered at boot time, or order in the config file, or some other 
such algorithm who's input changes as LVs are added and destroyed.

You know, though, that md1_crypt will always be md1_crypt no matter 
what you do to any other LVs.

I'd run interactive commands against dm-8, but would refer to 
md2_crypt in any scripts that I write which need to work tomorrow, 
next week, etc.

-- 
Scooty Puff, Sr
The Doom-Bringer
