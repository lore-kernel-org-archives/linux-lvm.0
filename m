Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAPIcOig019275
	for <linux-lvm@redhat.com>; Thu, 25 Nov 2010 13:38:24 -0500
Received: from BLADE3.ISTI.CNR.IT (blade3.isti.cnr.it [194.119.192.19])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAPIcDx6028802
	for <linux-lvm@redhat.com>; Thu, 25 Nov 2010 13:38:13 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5 #31825) id <01NUOO68SSZ4LKOMDP@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 25 Nov 2010 19:37:49 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it (PMDF V6.5 #31825)
	id <01NUOO687AZKLS4GIG@mx.isti.cnr.it> for linux-lvm@redhat.com; Thu,
	25 Nov 2010 19:37:47 +0100 (MET)
Received: from [192.168.7.52] (firewall.itb.cnr.it [155.253.6.254])
	by mx.isti.cnr.it (PMDF V6.5 #31826)
	with ESMTPSA id <01NUOO67RFIMLOECW1@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 25 Nov 2010 19:37:47 +0100 (MET)
Date: Thu, 25 Nov 2010 19:39:57 +0100
From: Spelic <spelic@shiftmail.org>
Message-id: <4CEEAD7D.5040506@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Losing one of various PVs in VG
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,
I am planning our new storage system.

I would like the ability to migrate LVs between the various RAID arrays 
we have.
This would require we have a PV per array and all PVs under the same VG.

Now I'm wondering what happens if we lose an array: all data on all 
arrays will be lost because the VG is lost?

I did spot one way to prevent this:

I could create one VG per PV, then just before the migration I would do 
vgmerge between the two VGs source and destination, then perform 
migration of the LV with pvmove, then wait for it to complete (by not 
sending it to background probably), then do vgsplit to return to initial 
condition.

It's quite complex and unconvenient though. Also if I forget to wait 
completion for pvmove and/or I forget to do vgsplit, and then one of the 
two array fails, I would probably lose data from both.

What do you suggest?

Thanks for your help
