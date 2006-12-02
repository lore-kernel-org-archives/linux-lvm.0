Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB2HN3CN012578
	for <linux-lvm@redhat.com>; Sat, 2 Dec 2006 12:23:03 -0500
Received: from smtp2.berklee.edu (smtp.berklee.edu [192.136.22.34])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kB2HMhkc014101
	for <linux-lvm@redhat.com>; Sat, 2 Dec 2006 12:22:43 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp2.berklee.edu (Postfix) with ESMTP id 807E82C00BD
	for <linux-lvm@redhat.com>; Sat,  2 Dec 2006 12:22:33 -0500 (EST)
Received: from smtp2.berklee.edu ([127.0.0.1])
	by localhost (smtp2.berklee.edu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U3u-eENfZB9Z for <linux-lvm@redhat.com>;
	Sat,  2 Dec 2006 12:18:42 -0500 (EST)
Received: from [192.168.1.202]
	(216-15-121-70.c3-0.frm-ubr3.sbo-frm.ma.static.cable.rcn.com
	[216.15.121.70])
	by smtp2.berklee.edu (Postfix) with ESMTP id 1D82B2C000A
	for <linux-lvm@redhat.com>; Sat,  2 Dec 2006 12:18:42 -0500 (EST)
Message-ID: <4571B56F.9050506@berklee.edu>
Date: Sat, 02 Dec 2006 12:18:39 -0500
From: Louis Guillaume <lguillaume@berklee.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Stability of pvresize
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

Hi,

I've seen a couple messages recently about pvresize. Since I'm about to
implement a system that might depend on this functionality, I'd like to
know whether it works well!!!

Here's the scenario:

  . Using an San.
  . A meta-LUN is created consisting of 2 `real' LUNs.
  . Meta-LUN is incorporated as a PV on the Linux Host.
  . We add a third LUN to the meta-LUN on the SAN.

This is where pvresize is supposed to come in. Once the PV is resized,
is the VG automatically aware of the new PEs? Are there any pitfalls in
this scheme?

The alternative is to not use meta-LUNs and just add a new PV as needed
and vgextend. But this puts more work on the server's CPU. Opinions?

Louis
