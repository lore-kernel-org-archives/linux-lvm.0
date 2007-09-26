Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8QEJ2SC029405
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 10:19:02 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8QEJ2dX021879
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 10:19:02 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l8QEIui7009985
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 10:18:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l8QEIum6008916
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 10:18:56 -0400
Date: Wed, 26 Sep 2007 10:18:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Copy LVs
In-Reply-To: <46FA2B68.8040908@ciber.com>
Message-ID: <Pine.LNX.4.44.0709261000270.8753-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 26 Sep 2007, Peter Larsen wrote:

> What's the "official" procedure of cloning Volume Groups or Logical
> Volumes across systems?
> 
> Let's say I want to clone the OS to a new box. Do I dd everything over,
> or is there a better "lvm" way?

Pardon a little "blue sky" here.  There is a better way that is easy
to script for a particular case, but there is no robust general purpose
script for linux - yet.  This description is patterned off of AIX vgsave.

1) From source vg, write text description of all logical volumes.  Keep in
   mind that "vgrest" has to parse it reliably - so simply copying the
   VG metadata, already in text form for LVM2, is not necessarily the
   best approach.  For one, I would write a script that creates 
   logical volumes with the same names and sizes.  For two, the description
   needs additional metadata similar to that collected by a linux installer -
   where LV is mounted, filesystem type, swap partition, etc.
   I can see creating a directly executable shell script here, or perhaps
   XML or other structured data and a python script to parse and execute it.

2) Create target VG, and create all logical volumes from script/data.
   (Optional - resize file system LVs to minimum required to restore archive.)

3) rsync, or tar and untar (preserving extended attributes) each 
   logical volume, format swap partitions.

When cloning to a tape, write the VG metadata (or simplified description)
first, followed by tar archives of each LV.  AIX saves only mounted LVs,
and creates one big archive, remembering where each LV was mounted in the
metadata.  I'm not convinced that is the best approach.

In short, something like vgsave and vgrest that could clone a VG directly
to a target and/or to tape/archive file would be a great addition to LVM.
I will even write it, but it will be at least 6 months before I can get
past a lot of system upgrades - so feel free to beat me to it.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
