Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5D1SE009019
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 21:28:14 -0400
Received: from www.sk-tech.com ([65.112.244.170])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5D1S8Xn019553
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 21:28:08 -0400
Received: from www.sk-tech.com
	(IDENT:m8FE1n70DkBsFdeHYtTKGOT4gaOFM4eb@www.sk-tech.com
	[192.168.1.2])
	by www.sk-tech.com (8.11.6/8.11.6) with ESMTP id i5D1S2w18668
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 20:28:02 -0500
Date: Sat, 12 Jun 2004 20:28:02 -0500 (CDT)
From: Lance Dillon <ldillon@sk-tech.com>
Subject: RE: [linux-lvm] decommision disks in LVM2 & 2.6 kernel? (pvmove
	broken)
In-Reply-To: <000501c450c0$25673440$0201a8c0@fosi>
Message-ID: <Pine.LNX.4.44.0406122022570.18491-100000@www.sk-tech.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 13 Jun 2004, Steve Wray wrote:

> Replying to my own post, I have found and installed
> the patches from;
> http://people.sistina.com/~thornber/dm/
> specifically;
> http://people.sistina.com/~thornber/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.
> tar.bz2
> 
> to a pristine 2.6.6 kernel, configured it appropriately,
> compiled and booted from it; pvmove still doesn't work.
> 
> Is there any special magick I need to apply or documentation
> that I'm missing? Do I need to update my version of pvmove
> (currently at;
> 
> pvmove --version
>   LVM version:     2.00.08 (2003-11-14)
>   Library version: 1.00.07-ioctl (2003-11-21)
>   Driver version:  4.0.0)
> (although that is as booted with the mandrake 2.6.3-13 kernel,
> not the 2.6.6 + dm patches kernel)
> 
> Thanks!
> 
> (and these disks are failing; I need to decommission them ASAP,
> if I can't pvmove the extents on them or move the files which occupy
> extents on them, then I am in trouble).
> 

I've had a problem with a pvmove failing because of errors on the disk, so 
I couldn't use pvmove at all.


First I do a lvdisplay -v on the lv's, and find which ones are on the disk 
I need to remove.  Then I create a new lv and specify a different pv to 
put it on.  Usually that meant I had to add a new disk and vgextend.  Then 
I copy all the files onto the new lv, usually using (cd /old/vol; tar cf - 
.)|(cd /new/vol; tar xvpf -).  Then I removed the old lv's, vgreduce, then 
I could remove the old disk.

It might be a long way, but it works.

l
