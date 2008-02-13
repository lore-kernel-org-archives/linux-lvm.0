Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1DDakbA031330
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 08:36:46 -0500
Received: from g5t0008.atlanta.hp.com (g5t0008.atlanta.hp.com [15.192.0.45])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1DDaBPs018134
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 08:36:11 -0500
Received: from g5t0008.atlanta.hp.com (localhost.localdomain [127.0.0.1])
	by receive-from-antispam-filter (Postfix) with SMTP id DE5032450A
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 13:36:05 +0000 (UTC)
Received: from hppinf00.gbr.hp.com (hppinf00.gbr.hp.com [16.25.249.33])
	by g5t0008.atlanta.hp.com (Postfix) with ESMTP id 86E20244DB
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 13:36:05 +0000 (UTC)
Received: from hppine99.gbr.hp.com (hppine99.gbr.hp.com [16.25.249.62])
	by hppinf00.gbr.hp.com (8.11.1 (PHNE_35951)/8.11.1 SMKit7.05) with
	ESMTP id m1DDa4612947
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 13:36:04 GMT
Subject: Re: [linux-lvm] LVM2 tools lvmcmdline.c major and minor number limits
From: Darren Lavender <dl1@hppine99.gbr.hp.com>
In-Reply-To: <20080213121530.GQ29914@agk.fab.redhat.com>
References: <1202900520.4345.115.camel@localhost.localdomain>
	<20080213121530.GQ29914@agk.fab.redhat.com>
Date: Wed, 13 Feb 2008 13:36:03 +0000
Message-Id: <1202909763.4345.129.camel@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair 

> On Wed, Feb 13, 2008 at 11:02:00AM +0000, Darren Lavender wrote:
> > I was wondering whether there was any particular reason why the
> > limitations below are still present given that these were changed
> > between 2.4 and 2.6 linux kernels?
>  
> Yes, it's probably time we changed that - nobody's noticed it before.
> We just have to check the code copes OK if someone sets it to a large number
> then reboots with a kernel that doesn't support it.

Sure.


> Setting the major number at device creation time is *still* not supported in
> 2.6.  (2.4 does support it.)

I think the interest is _only_ in the minor number but I noticed that I
had to specify --major at the command line or I received an error:


# lvcreate -n bigminor -l 5 -M y  --minor 70 vgtest
  Please specify major number with --major when using -My
  lvcreate: Create a logical volume



Without the -M  I get a different error:

# lvcreate -n new -l 5  --minor 72 vgtest
  Couldn't read major number for logical volume bigminor.
  Couldn't read major number for logical volume bigminor.
  Couldn't read major number for logical volume bigminor.
  Couldn't read major number for logical volume new.
  Couldn't read major number for logical volume bigminor.
  Couldn't read major number for logical volume new.
  Missing major number for persistent device
  Couldn't create ioctl argument
  Couldn't load device 'vgtest-new'.
  Perhaps the persistent device number -1:72 is already in use?
  Failed to activate new LV.


Hence the reason I just provided the DM major number in my original
example.

The man pages seem not to mention --major but it does show in the usage:


lvcreate
        [-A|--autobackup {y|n}]
        [--addtag Tag]
        [--alloc AllocationPolicy]
        [-C|--contiguous {y|n}]
        [-d|--debug]
        [-h|-?|--help]
        [-i|--stripes Stripes [-I|--stripesize StripeSize]]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        [-M|--persistent {y|n}] [--major major] [--minor minor]
.......                          ^^^^^^^^^^^^^


So perhaps this whole area needs a little bit of an overhaul...???



Tested on SLES9SP3 with:

2.6.5-7.308-bigsmp #1 SMP Mon Dec 10 11:36:40 UTC 2007 i686 i686 i386
GNU/Linux

rpm -q lvm2:  
lvm2-2.01.14-3.23


Regards
-- 
Darren Lavender 
