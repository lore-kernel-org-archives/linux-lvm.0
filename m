Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0DA9O8T025949
	for <linux-lvm@redhat.com>; Tue, 13 Jan 2009 05:09:24 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0DA99eJ029801
	for <linux-lvm@redhat.com>; Tue, 13 Jan 2009 05:09:10 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0DA98GR023307
	for <linux-lvm@redhat.com>; Tue, 13 Jan 2009 11:09:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 094E72C0B6
	for <linux-lvm@redhat.com>; Tue, 13 Jan 2009 11:09:03 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5bqBihll8KUl for <linux-lvm@redhat.com>;
	Tue, 13 Jan 2009 11:09:02 +0100 (CET)
Date: Tue, 13 Jan 2009 11:09:02 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Message-ID: <20090113100902.GJ21131@lupe-christoph.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Allocation maps of a mirrored LV?
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

Hi!

I'm about to integrate support for LVM mirrors into the configuration
management system I'm maintaining for a client. This system has a "scan"
function that retrieves the current configuration and compares it
against a database.

My problem is that I'm unable to get the allocation info for the parts
of a mirrored volume under SLES 10 (lvm2 RPM is at 2.02.17, even
OpenSuSE 10.3 has only lvm2 2.02.25).

lvdisplay --maps only gives me:

  --- Segments ---
  Logical extent 0 to 24:
    Type		mirror
    Mirrors		2
    Mirror size		25
    Mirror log volume	testlv0_mlog
    Mirror region size	512.00 KB
    Mirror original:
      Logical volume	testlv0_mimage_0
      Logical extents	0 to 24
    Mirror destinations:
      Logical volume	testlv0_mimage_1
      Logical extents	0 to 24

This is lacking the names of the PVs. (Has this been implemented in the
meantime? It would be useful - nudge, nudge...)

BTW, a simple volume *has* this information:

  --- Segments ---
  Logical extent 0 to 31:
    Type		linear
    Physical volume	/dev/sda3
    Physical extents	1261 to 1292

I'm unable to convince lvdisplay to give me any information on, e.g.,
testlv0_mimage_0. And pvdisplay --maps does not display allocation maps
up to 2.02.27, AFAIK.

So does anybody have a way to find out on which PV the mirror parts are?
Short of installing our own lvm2 RPM, of course. Or parsing the raw LVM
config info on the disks...

Thanks for any hint,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.             |
| /me                                                                    |
