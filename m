Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k63JHCov014152
	for <linux-lvm@redhat.com>; Mon, 3 Jul 2006 15:17:12 -0400
Received: from buraja.hst.terra.com.br (buraja.hst.terra.com.br
	[200.176.10.198])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k63JH9Qw026192
	for <linux-lvm@redhat.com>; Mon, 3 Jul 2006 15:17:10 -0400
Received: from caledonia.hst.terra.com.br (caledonia.hst.terra.com.br
	[200.176.10.7])
	by buraja.hst.terra.com.br (Postfix) with ESMTP id 4179622A418A
	for <linux-lvm@redhat.com>; Mon,  3 Jul 2006 16:17:08 -0300 (BRT)
Received: from [10.0.0.38] (unknown [200.168.58.218])
	(authenticated user minicom024)
	by caledonia.hst.terra.com.br (Postfix) with ESMTP id 05EFB2338168
	for <linux-lvm@redhat.com>; Mon,  3 Jul 2006 16:17:05 -0300 (BRT)
Message-ID: <44A96DAC.5090202@minicom.com.br>
Date: Mon, 03 Jul 2006 16:19:08 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] A problem (probably conceptual) with snapshot
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
