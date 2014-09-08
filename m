Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s88IlZjp010351
	for <linux-lvm@redhat.com>; Mon, 8 Sep 2014 14:47:35 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s88IlWjO018978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 8 Sep 2014 14:47:33 -0400
Message-ID: <1410202048.13625.27.camel@kurenai.local>
From: Jarkko Oranen <oranenj@iki.fi>
Date: Mon, 08 Sep 2014 21:47:28 +0300
In-Reply-To: <0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
	<1409828800.6181.19.camel@kurenai.local>
	<0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: oranenj+lvm@iki.fi

On Mon, 2014-09-08 at 12:47 -0500, Brassow Jonathan wrote:
> On Sep 4, 2014, at 6:06 AM, Jarkko Oranen wrote:
> 
> >> TRIM is not yet supported in LVM RAID.  However, if MD has a solid TRIM implementation, it should be simple to enable it for LVM.  (This is because the MD kernel modules are used to perform RAID for LVM.  There is only a thin wrapper layer (linux/drivers/md/dm-raid.c) in device-mapper used to set-up the device.)
> > 
> > Thanks for the reply! Unfortunately, "simple" is relative.
> 
> By "simple", I mean that from our side all we should need to do is set 'num_discard_bios = 1' in dm-raid.c.  That is, if things are working fine in MD.  We could even make that conditional depending on the type of RAID (e.g. discards for RAID1, but not RAID5).  It could end up being that simple, but I need to know if MD has proper support for discards and all the kinks have been worked out.
> 

dm-raid.c already has         
 
  ti->num_discard_bios = 1;

in raid_ctr in the kernel source I'm looking at (3.15.6; not the most
recent, but it's what I happen to have locally available). As I said, to
me it looks like it should already work, but it doesn't, so I spent a
bit of time trying to understand why. 

Digging at it again, eg. lsblk -D seems to report discard information
identical to other discard-supporting block devices, suggesting that
discard passthrough should work fine, but the actual ioctl fails (when
testing via either fstrim or blkdiscard) with "not supported" for
whatever reason.

As far as I know, discard support in MD is stable, and has been so for a
long while; my current setup consists of linear logical volumes on top
of a software RAID PV created with mdadm, and I haven't had a single
issue with discards. It seems RAID1 discard support was merged in
January 2011 (git commit 5fc2ffeabb9ee0fc0e71ff16b49f34f0ed3d05b4), so
it's definitely not new.

--
Jarkko
