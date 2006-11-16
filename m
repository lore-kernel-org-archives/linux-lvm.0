Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAG8vPM9008529
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 03:57:25 -0500
Received: from gws-mail.gws-muenster.de (gws-mail.gws-muenster.de
	[62.156.166.236])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAG8vMTl011997
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 03:57:23 -0500
Received: from [195.145.186.100] (helo=kenny.gws-muenster.de)
	by gws-mail.gws-muenster.de with esmtp (Exim 4.50 #1 (Debian))
	id 1Gkd3f-0003tI-G0
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 09:57:19 +0100
Received: from kyle.gws-muenster.de ([217.6.136.6] helo=cards ident=balance)
	by kenny.gws-muenster.de with esmtps (Exim 4.50 #1 (Debian))
	id 1Gkd3g-0004GO-IF
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 09:57:20 +0100
Received: from inside.gws-muenster.de
	([195.145.186.81] helo=pelota.gws-muenster.de ident=balance)
	by cards with esmtp (Exim 4.32 #1 (Debian)) id 1Gkd3e-0003fL-UO
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 09:57:18 +0100
Message-ID: <C43D74B62BA19A45ADD74C1AB7AEE54202B7B184@nt-gws2.gws-muenster.de>
From: "Steverding, Kai" <Kai.Steverding@gws.ms>
Date: Thu, 16 Nov 2006 09:57:22 +0100
MIME-Version: 1.0
Subject: [linux-lvm] Changing the UUID of a VG and a LV
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Hi !
I have the following problem : 

For backup purposes, i take SAN-Snapshot Copies of my Linux machine. I
deploy my new machines from those copies, too. This has the effect, that a
clone of a machine has the exact same disk the original has including PV
UUID, VG name, VG UUID, LV name and lv uuid. I found out that i can change
the PV UUID with pvchange -u and the VG name with vgrename , but is there a
way to change the UUID's of the VG and the LV's ? I need it, because i mount
all those snapshots on a backup-server and this doesn't work because of the
same UUIDs.

Thanks

Kai
