Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QGANYT007868
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:10:23 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QGAApN015350
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:10:10 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e1.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9QG8W9b003535
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:08:32 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9QGA6kQ088468
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:10:06 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9QGA6Nh026251
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:10:06 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9QGA5Nf026227
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 12:10:06 -0400
Date: Mon, 26 Oct 2009 09:10:05 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive
Message-ID: <20091026161005.GB23405@us.ibm.com>
References: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> Hi
> 
> I've been using lvm for quite a few years, but only occasionally when I
> need to add/remove new drives. So, my knowledge is limited and a bit
> rusty! I should have removed the old drive when I added a new one a
> couple of years ago, but for reasons I cannot remember, I didn't.
> 
> I only know how to remove a drive when there is a new drive about to
> move the stuff onto. My problem now is that the new drive is fully
> allocated and so this route won't work. There is plenty of free space on
> the new drive so it should be possible to move everything that might be
> on the old physical drive and then remove it from the lvg. I just can't
> work out how. The HOWTOs and threads don't seem to cover this starting
> point.
> 
> My questions are:
> 
> 1. Can I do move the data off the old drive to the new drive without
> adding another new drive?
 
pvmove followed by vgreduce. If you have enough free space, pvmove
should work and there is no need to add another new drive.

> 2. I don't understand the output from pvdisplay - why is it telling me
> about /dev/sda1 at the bottom when this partition is a boot partition
> and tiny?

It also reports a large size! Somehow, it detected PV signature in that
partition. You can remove such signature by running pvremove. Note that
it wipes out LVM label, so back up your data in /dev/sda1 somewhere else
before you run "pvremove /dev/sda1". If the partition is mountable after
'pvremove', you are fine. Otherwise restore the backup!

> 3. Where has the LogVol01 come from and what is it doing? Can I remove
> it?

Try mounting it and see if there is anything there. You can use lvremove
if you don't need it.

> 4. Can I rename the volgroup/logvols to the same pattern used by new
> installations? e.g. vg_hostname and lv_root, etc.

Yes, see lvrename and vgrename commands.
 
> If you've read this far, then thank you! I hope the following extracts
> are sufficient.

You are welcome.
