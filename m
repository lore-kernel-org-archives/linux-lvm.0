Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8BKIEr03425
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 16:18:14 -0400
Received: from priv-edtnes32.telusplanet.net (defout.telus.net
	[199.185.220.240])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8BKIDFX001440
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 16:18:13 -0400
Received: from tor.lat ([154.5.5.164]) by priv-edtnes32.telusplanet.net
	(InterMail vM.6.01.03.02 201-2131-111-104-20040324) with ESMTP
	id <20040911201807.GPZ20020.priv-edtnes32.telusplanet.net@tor.lat>
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 14:18:07 -0600
Received: from [192.168.179.43] (fis.lat [192.168.179.43])
	by tor.lat (Postfix) with ESMTP id B22EA10C281
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 13:18:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Message-Id: <B825AF1D-042F-11D9-9080-000A95C71776@freezone.co.uk>
From: ms419@freezone.co.uk
Date: Sat, 11 Sep 2004 13:18:18 -0700
Subject: [linux-lvm] initrd for LVM2 root partition
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

How does one manually build an initrd to mount an LVM2 root partition?

I'm aware of the lvmcreate_initrd tool, but in my distribution (Debian 
unstable) it accompanies LVM1, not 2; besides, I am building the initrd 
for a foreign architecture, so I think I would have to build it 
manually anyway.

I've read the LVM HOWTO, particularly 
http://www.tldp.org/HOWTO/LVM-HOWTO/upgradetolvmroot.html, which 
mentions initrds, but I couldn't find any instructions for manually 
building an LVM initrd. Can someone suggest some documentation to me?

Currently, I am confronted with the following problem, when I run 
vgscan on my initrd:

# vgscan
   Locking type 1 initialization failed.
#

I suspect this may be because I'm using a read-only filesystem? 
According to this (almost ancient?) message: 
http://www.redhat.com/archives/linux-lvm/2003-January/msg00184.html, 
vgscan requires a writable filesystem; Is this still the case?

This message describes using tmpfs to avoid this problem: 
https://www.redhat.com/archives/linux-lvm/2003-January/msg00259.html; 
are these instructions accurate?

Thanks very much; any help much appreciated!

Jack
