Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9D1RPEh028645
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 21:27:25 -0400
Received: from pbr322.ceingebi.unam.mx (pbr322.ibt.unam.mx [132.248.32.1])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9D1RNAB015131
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 21:27:24 -0400
Received: from [132.248.32.28] (negra [132.248.32.28])
	by pbr322.ceingebi.unam.mx (8.12.3/8.12.3/Debian-7.1) with ESMTP id
	k9D1L0h1017578
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 20:21:01 -0500
Message-ID: <452EEB6C.9040701@ibt.unam.mx>
Date: Thu, 12 Oct 2006 20:27:08 -0500
From: Jerome <jerome@ibt.unam.mx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to restore a PV ??
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi all,
i've made a mistake on deleting the MBR of a disk who was included in a 
Volume Group of three disks.
Now, when i do a pvdisplay command, i have this result:

  pvdisplay
   2 PV(s) found for VG principal: expected 3
   Logical volume (Database) contains an incomplete mapping table.
   PV segment VG free_count mismatch: 0 != 3576
   PV segment VG extent_count mismatch: 7152 != 10728
   Internal error: PV segments corrupted in principal.

And a vgdisplay show me this following:
vgdisplay
   2 PV(s) found for VG principal: expected 3
   2 PV(s) found for VG principal: expected 3
   Volume group "principal" not found

I'm sure that the data on the hard disk are not erased. But i want to 
restore this third disk, that it is part of the "principal" Volume 
Group. (I have a fourth disk with the same physical caracteristics).
So, how can i do to succeed in this?

Best regards.
-- 
-- J�r�me
Si l'on peut trouver moins que rien, c'est que rien vaut d�j� quelque chose.
	(Raymond Devos)
