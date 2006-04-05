Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35HYPUs029991
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:34:25 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k35HYNKX007751
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:34:23 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k35HYHUm009537
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 19:34:18 +0200
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Wed, 05 Apr 2006 19:34:18 +0200
Message-Id: <1144258458.32119.8.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove to smaller PVs
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
To: linux-lvm@redhat.com

I'm trying to use pvmove to move data from a 300 GB S-ATA disk onto
four, smaller 120 GB IDE disks. However, pvmove tells me that it cannot
allocate enough contiguous PEs to fit 300 GB, like this:

# pvmove /dev/sde1
  Insufficient contiguous allocatable extents (28617) for logical volume
pvmove0: 71541 required
  Unable to allocate temporary LV for pvmove.

I can, of course, understand that it can't find contiguous PEs
corresponding to 300 GB, but I don't understand why it should need it to
be contiguous. Can pvmove not just divide that storage into three
"partitions", each fitting on one 120 GB disk, and move them? Is there a
way for me to tell it to do so?

I seem to be able to use something like "pvmove /dev/sde1:0-28616" to
tell pvmove manually to do this for me, but this poses a small problem
for me, as not all of the data on the disks I want to move from are
allocated where I know them to be. This particular disk is fully
allocated, so that I know what I could do with that syntax, but is there
really no way to tell pvmove to do this automatically? It just seems
kind of strange to me.

Fredrik Tolf
