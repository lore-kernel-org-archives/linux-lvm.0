Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA60tUxN004588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 5 Nov 2016 20:55:30 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A27F64E4CC
	for <linux-lvm@redhat.com>; Sun,  6 Nov 2016 00:55:29 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 64F9A1F83C
	for <linux-lvm@redhat.com>; Sun,  6 Nov 2016 01:49:02 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 06 Nov 2016 01:49:02 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <af56dc3b8b8dee6b36edba635380a517@xenhideout.nl>
Subject: [linux-lvm] boot volume in activated containing PV does not activate
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

Quick question.

I have a mirrored LV which I boot from (/boot).

The mirror is within an embedded PV  (PV -> LV = PV -> LV = mirror of 
other one sitting on other disk).

My initrd activates both the external (outer) PV as well as the root LV.

So:

Collection PV is called "coll" (its VG is called "coll").

Coll contains a PV called "coll/msata-lv" which is an LV that is a PV to 
the "msata" volume group that contains the 2 mirrors.

Now at boot (prior to running of systemd) I activate both coll/msata-lv 
and msata/root.

This works fine when both mirrors are present.

As a test I removed the primary (SSD) mirror of the root volume (and the 
boot volume). Now the system still boots (off of another disk which has 
grub on it, but only the grub core and boot image, nothing else, so it 
still references my VG) and the root volume still gets activated but the 
boot volume doesn't get activated anymore.

What can cause this? It ought to get activated by udev rules.

You remember I patched the udev file to ensure a PV directly on disk 
always gets activated but this is not that disk.

Could it be that the msata/boot volume doesn't get activated because the 
PV had already been activated in the initrd but only as an LV and not 
its volumes?

I mean:

coll/msata-lv is already activated and it contains (is) the PV that has 
parts of both msata/root and msata/boot. These are both half of a mirror 
that is not present at present (at current). msata/root is explicitly 
activated in the initrd, but msata/boot isn't.

As the system starts msata/boot is not activated and the system enters 
emergency mode. A simple vgchange -ay msata does the job and msata/boot 
gets activated now.

Therefore a simple vgchange -ay at boot (using .e.g. /etc/init.d/lvm2) 
also solves it.
