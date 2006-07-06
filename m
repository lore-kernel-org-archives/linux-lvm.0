Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k66KgAVh020498
	for <linux-lvm@redhat.com>; Thu, 6 Jul 2006 16:42:10 -0400
Received: from bulimba.hst.terra.com.br (bulimba.hst.terra.com.br
	[200.176.10.194])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k66Kg65K005072
	for <linux-lvm@redhat.com>; Thu, 6 Jul 2006 16:42:07 -0400
Received: from caiguna.hst.terra.com.br (caiguna.hst.terra.com.br
	[200.176.10.4])
	by bulimba.hst.terra.com.br (Postfix) with ESMTP id 9A3C7130C3F4
	for <linux-lvm@redhat.com>; Thu,  6 Jul 2006 17:42:04 -0300 (BRT)
Received: from [10.0.0.38] (unknown [200.168.58.218])
	(authenticated user minicom024)
	by caiguna.hst.terra.com.br (Postfix) with ESMTP id 5516ED2815F
	for <linux-lvm@redhat.com>; Thu,  6 Jul 2006 17:42:03 -0300 (BRT)
Message-ID: <44AD7622.4060500@minicom.com.br>
Date: Thu, 06 Jul 2006 17:44:18 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Subject: [linux-lvm] A problem (probably conceptual) with snapshot
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Today I needed to install Oracle and some other things on my PC, but I
realize that it would be better to make a snapshot and then reboot Linux
with this snapshot mounted instead of root.
Ok, I did that and changed fstab to mount my snapRoot instead root,
ok...I saw with 'df' command that it worked.
And I've installed all what I wanted, some garbage too...by the way,
this snapRoot doesnt means nothing to me, just for testing. And then I
changed the fstab again to mount the root original. But after it, all
the changes I made on snapshot was made on my root LV too. And the
lvdisplay command shows something strange now, about these two LV's. The
output is:

--- Logical volume ---
  LV Name                /dev/dutcheVG/root
  VG Name                dutcheVG
  LV UUID                aAN6BH-GqW3-zhtr-KeIt-BW4m-qEyw-RypMit
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/dutcheVG/snap_root [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                9.27 GB
  Current LE             2372
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:5

  --- Logical volume ---
  LV Name                /dev/dutcheVG/snap_root
  VG Name                dutcheVG
  LV UUID                cj2PD2-4OYX-eCzw-kG5y-r071-icK0-dq7FBr
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/dutcheVG/root
  LV Status              NOT available
  LV Size                9.27 GB
  Current LE             2372
  COW-table size         2.00 GB
  COW-table LE           512
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0


I donno what is really happening, does anybody can explain me? Plz!!

Thanks in advance
