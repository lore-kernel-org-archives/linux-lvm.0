Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3RCerO01802
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 08:40:54 -0400
Received: from mailhost.curriculum.edu.au (mailhost.curriculum.edu.au
	[203.24.26.74])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3RCel1F013201
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 08:40:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by mailhost.curriculum.edu.au (Postfix) with ESMTP id 52C361A0D38
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 22:40:31 +1000 (EST)
Received: from mailhost.curriculum.edu.au ([127.0.0.1])
	by localhost (mailhost [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 30742-01-2 for <linux-lvm@redhat.com>;
	Wed, 27 Apr 2005 22:40:28 +1000 (EST)
Received: from monhost.curriculum.edu.au (monhost.curriculum.edu.au
	[192.168.10.13])
	by mailhost.curriculum.edu.au (Postfix) with ESMTP id 122BD1A0D0D
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 22:40:28 +1000 (EST)
Date: Wed, 27 Apr 2005 22:40:27 +1000
Subject: Re: [linux-lvm] Re: LVM2 on RAID
Message-ID: <20050427124027.GP15110@monhost.curriculum.edu.au>
References: <20050427043822.GI15110@monhost.curriculum.edu.au>
	<yw1xacnkseqo.fsf@ford.inprovide.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1xacnkseqo.fsf@ford.inprovide.com>
From: Christian Purnomo <cpurn@cpurn.net>
Reply-To: cpurn@cpurn.net,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks,

I have tried changing the partitions type to 0xFD and the auto detects kicked
in and LVM still worked like a charm.

However I found this from mailling list archive

/* start quote */

From: Luca Berra <bluca comedia it> 
To: linux-lvm redhat com 
Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md 
Date: Fri, 1 Apr 2005 19:41:22 +0200 

quote Neil Brown back in july 2001

"autorun/autodetect just doesn't belong in the kernel.  It should be
done in user space.  The only time the kernel should assemble a raid
array itself is for the root device, and this is best done with
md=0,/dev/whatever,etc


If I could start with a clean slate, I would rip out the autodetect
stuff completely.  But lots of people are depending on it so I cannot."


anyway the major issues are:
1) raid autodetect uses only the minor number stored in the superblock
to identify the array components, move a disk from a different machine
to yours and reboot it to enjoy the show
2) raid autodetect will try to start everything it finds, it will not
scale with shared storage, or other complex configurations

/* end quote */


Can anyone conclude that passing the parameter md=0,/dev/*  to kernel parameter
is a better approach than using auto detect? I don't have a problem with having
a rather long parameters in my grub.conf/lilo.conf.

Thanks

Christian.


Subject: [linux-lvm] Re: LVM2 on RAID
Date: Wed, Apr 27, 2005 at 12:20:15PM +0200
Quoting M?ns Rullg?rd (mru@inprovide.com):

: cpurn@cpurn.net (Christian Purnomo) writes:
: 
: > Hi All
: >
: > I use gentoo, lvm2, raid (lvm on top of raid-1).  My problem is that
: > the kernel doesn't automatically detect my /dev/md[2-8] as the
: > partitions are set to 8e (LVM2) instead of 0xFD ... the solution I
: > have at the moment is to append md=2,/dev/sdXY,/dev/sdAB and so
: > forth to my grub.conf.
: >
: > Is it safe to change the partition types from 8e to 0xFD? will I
: > break my lvm?
: 
: It should be safe.  That's how I have mine set up.
: 
: -- 
: M?ns Rullg?rd
: mru@inprovide.com
: 
: _______________________________________________
: linux-lvm mailing list
: linux-lvm@redhat.com
: https://www.redhat.com/mailman/listinfo/linux-lvm
: read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
