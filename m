Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5CKxn031883
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 16:59:49 -0400
Received: from linda-3.paradise.net.nz (bm-3a.paradise.net.nz [202.0.58.22])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5CKxli5019408
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 16:59:48 -0400
Received: from smtp-2.paradise.net.nz (smtp-2b.paradise.net.nz [202.0.32.211])
	by linda-3.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0HZ700H9WRMORM@linda-3.paradise.net.nz> for
	linux-lvm@redhat.com; Sun, 13 Jun 2004 08:59:46 +1200 (NZST)
Received: from fosi (203-79-83-162.cable.paradise.net.nz [203.79.83.162])
	by smtp-2.paradise.net.nz (Postfix) with ESMTP id 290F99E683	for
	<linux-lvm@redhat.com>; Sun, 13 Jun 2004 08:59:12 +1200 (NZST)
Date: Sun, 13 Jun 2004 08:59:26 +1200
From: Steve Wray <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] decommision disks in LVM2 & 2.6 kernel? (pvmove
	broken)
In-reply-to: <001601c4500c$8cb7c560$0201a8c0@fosi>
Message-id: <000501c450c0$25673440$0201a8c0@fosi>
MIME-version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Replying to my own post, I have found and installed
the patches from;
http://people.sistina.com/~thornber/dm/
specifically;
http://people.sistina.com/~thornber/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.
tar.bz2

to a pristine 2.6.6 kernel, configured it appropriately,
compiled and booted from it; pvmove still doesn't work.

Is there any special magick I need to apply or documentation
that I'm missing? Do I need to update my version of pvmove
(currently at;

pvmove --version
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.07-ioctl (2003-11-21)
  Driver version:  4.0.0)
(although that is as booted with the mandrake 2.6.3-13 kernel,
not the 2.6.6 + dm patches kernel)

Thanks!

(and these disks are failing; I need to decommission them ASAP,
if I can't pvmove the extents on them or move the files which occupy
extents on them, then I am in trouble).


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Steve Wray
> Sent: Saturday, 12 June 2004 11:34
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] decommision disks in LVM2 & 2.6 kernel? 
> (pvmove broken)
> 
> 
> Hi there!
> 
> I have two disks which I need to decommission.
> 
> I'm running mandrake 10 official, LVM2, 2.6.3-13 kernel.
> 
> Naturally, pvmove doesn't work.
> 
> I get "Temporary mirror activation failed"; I googled for that
> and it wasn't much helpt. In fact I've spent a good couple of
> hours googling for hints on this problem and it hasn't helped. 
> Maybe my google-fu isn't that hot.
> 
> I only need a kernel which can perform pvmove just the once.
> I don't care what other features it has, I just want to boot
> into single user, pvmove, pvremove and bring it back up
> with my regular, distribution kernel.
> 
> Can anyone please direct me to a 2.6 kernel which supports
> pvmove? (or of course, appropriate patches. Oh and I am not
> particularly interested in EVMS support, just pvmove :)
> 
> Alternatively, if I could find out which files are on the PV's which
> I want to decommision, I could just move the files off and 
> then pvremove
> without having to pvmove, right? Suggestions?
> 
> Thanks!
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
