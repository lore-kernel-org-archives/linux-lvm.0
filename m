Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2TL2jj25837
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 16:02:45 -0500
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.25])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2TL2i1X031588
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 16:02:44 -0500
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with ESMTP id <20040329210243.OEVS15612.pegasus@kudu.siol.net>
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 23:02:43 +0200
Received: from vector ([193.77.156.30]) by kudu.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with SMTP id <20040329210243.SZSF773.kudu@vector>
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 23:02:43 +0200
Message-ID: <001d01c415d1$38140200$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
Date: Mon, 29 Mar 2004 23:02:57 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] HD failed, how to recover ?
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
To: linux-lvm@redhat.com

LVM driver LVM version 1.0.5+(22/07/2002)
Debian Linux 2.4.22

I have a VG called 'vgmu' consisting of 5 drives and containing a LV called 'mu'
taking up the whole VG. (/dev/vgmu/mu)

Now one of those 5 drives (hdc) failed and after I powered the box down, removed the
bad drive and powered back up, I got this after running vgscan:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vgmu" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

And pvscan gives me this:
(hdc is now the previous hdd drive - it changed letters)

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "vgmu" (run vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "vgmu" (run vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "vgmu" (run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "vgmu" (run vgscan)

Can I restore and reactivate this volume group (although now smaller) to run without
the failed drive ? What can I do ?

Thanks in advance.

---------
Perplexer
