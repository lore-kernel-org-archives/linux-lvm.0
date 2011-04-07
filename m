Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p375lq0i000403
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2011 01:47:52 -0400
Received: from ns.mindbit.ro (ns.mindbit.ro [80.86.127.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p375llda020819
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2011 01:47:48 -0400
Received: from [10.0.1.134] (Rendec.iNES.RO [80.86.127.25])
	(authenticated bits=0)
	by ns.mindbit.ro (8.13.8/8.13.8) with ESMTP id p375ljrM022627
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2011 08:47:45 +0300
From: Radu Rendec <radu.rendec@mindbit.ro>
In-Reply-To: <4D9D1C2D.5040907@omiha.com>
References: <4D9A9E2A.7070106@diala.gl3>
	<1302079983.27047.454.camel@localhost>	<4D9CDC03.9020507@omiha.com>
	<4D9CE08C.2010202@cox.net>  <4D9D1C2D.5040907@omiha.com>
Date: Thu, 07 Apr 2011 08:47:44 +0300
Message-ID: <1302155264.27047.469.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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

On Thu, 2011-04-07 at 14:06 +1200, Jan Bakuwel wrote:
> Problem solved. It was my brain mixing /dev/d/ and /dev/mapper.
> Releasing the partition device with kpartx -d worked - as long as I use
> the correct path and not mix the VG name with "mapper".
>
> Radu: the first test I'll do is not to zero the partition but to restore
> the image now the partition device (/dev/d/xm.wxp1) is gone. I don't
> understand why it's there in the first place (dom0 has no business
> there). If that helps, the presence of that partition device apparently
> interferes with the VM. If that doesn't help, I'll zero the blocks and
> report back (some time next week).

I don't think that mapping the partitions with kpartx could affect the
VM (that reads/writes to the LV directly).

But what I know for sure is that when you map a block device with
kpartx, the "partition" devices that kpartx creates under /dev/mapper
have different read/write caches than the original block device (the LV
in your case).

One issue that I experienced is that when you write data to a kpartx
mapped device (partition) and some (or all) of the blocks that you write
happen to be in the read cache of the original block device (the LV),
then you'll read "old" data from the LV, even if you first unmap the
partitions with kpartx -d.

This issue can be simply addressed by using "blockdev --flushbufs" on
the LV, after you do "kpartx -d" and before you use the LV (start the VM
for instance).

What type of image are you restoring? The whole LV (including its
partition table) or just the partition inside the LV (perhaps with
ntfsclone)? Because if you're restoring the partition (and not using
"kpartx -d" and "blockdev --flushbufs", it's very likely that you ran
into caching issues.

Best regards,

Radu
