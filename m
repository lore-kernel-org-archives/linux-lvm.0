Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m670lcuH009176
	for <linux-lvm@redhat.com>; Sun, 6 Jul 2008 20:47:38 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.183])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m670lLIl027214
	for <linux-lvm@redhat.com>; Sun, 6 Jul 2008 20:47:22 -0400
From: Eckhard Kosin <Eckhard.Kosin@online.de>
Date: Mon, 07 Jul 2008 02:47:15 +0200
Message-Id: <1215391635.29815.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Replace lvm-disk without being able to connect two
	disks at the same time
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi all,

on my laptop I have to replace the disk.  The filesystem is on lvm2.
The old disk has 40GB, the new one 250GB.  Of course on the new disk vg
and lv sizes will differ from the old one.  With the laptop there is no
possibility to plug in the old and the new disk at the same time.

So my plan is as follows:

      * Backup all data.
      * Remove old disk and plugin new disk.
      * Create vgs  and lvs on the new disk as desired.
      * Restore all data.

However I suspect that in the last step the new lvm-metadata will be
overwritten by the metadata of the old disk.  Which files I have to
exclude from the restore to do not touch the new metadata?

Or is there a better strategy to replace a lvm-disk without the
possibility to connect the new disk and the old disk at the same time to
the box?

    Thanks for any advise

          Ecki

--=20
  Eckhard Kosin
  Kaspar-Kerll-Str. 41
D-81245 M=C3=BCnchen, Germany
  Tel.: (+49)(+89) 88 88 479
  Tel., Fax: (+49)(+89) 835 844
  mailto:Eckhard.Kosin@online.de
