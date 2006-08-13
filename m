Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7DEe7mE017929
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2006 10:40:07 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.173])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7DEdtvc002604
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2006 10:40:01 -0400
Received: by ug-out-1314.google.com with SMTP id c2so1247299ugf
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2006 07:39:55 -0700 (PDT)
Message-ID: <ad7139520608130739u22123d81ue512e7f9ca6a8c20@mail.gmail.com>
Date: Sun, 13 Aug 2006 14:39:55 +0000
From: "newzen newzen" <newzenca@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_122774_29301242.1155479995027"
Subject: [linux-lvm] Howto? Change from VolGroup00 to VolGroupXX on boot
	disk.
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
To: linux-lvm@redhat.com

------=_Part_122774_29301242.1155479995027
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, again

[root@phamm ~]# lvm version
  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2006-01-04)
  Driver version:  4.5.0
[root@phamm ~]# pvscan
  PV /dev/hda2   VG VolGroup00   lvm2 [7.88 GB / 32.00 MB free]
  Total: 1 [7.88 GB] / in use: 1 [7.88 GB] / in no VG: 0 [0   ]
[root@phamm ~]# vgdisplay
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               7.88 GB
  PE Size               32.00 MB
  Total PE              252
  Alloc PE / Size       251 / 7.84 GB
  Free  PE / Size       1 / 32.00 MB
  VG UUID               KcM5Db-Rp6y-fn04-3WiM-RXID-XYs7-taWQfn


Im trying to change the vg name for my boot disk, as follow

reboot the computer with rescue disk ( Centos 4.3 ) and do not charge image
of my file system

lvm vgchange -an

lvm vgchange VolGroup00 VolGroupXX

then change

/etc/fstab, as apropiatte to VolGroupXX
and
/boot/grub/grub.conf in the same way

then im trying to restart but ...

found VolGroupXX using metadata type LVM2
unable to found volume group VolGroup00

so my question what im missing?

Please give me a help on this!!
Thanks in advance NewZen

------=_Part_122774_29301242.1155479995027
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, again<br><br>
[root@phamm ~]# lvm version<br>
&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.01 (2005-11-23)<br>
&nbsp; Library version: 1.02.02 (2006-01-04)<br>
&nbsp; Driver version:&nbsp; 4.5.0<br>[root@phamm ~]# pvscan<br>&nbsp; PV /dev/hda2&nbsp;&nbsp; VG VolGroup00&nbsp;&nbsp; lvm2 [7.88 GB / 32.00 MB free]<br>&nbsp; Total: 1 [7.88 GB] / in use: 1 [7.88 GB] / in no VG: 0 [0&nbsp;&nbsp; ]<br>[root@phamm ~]# vgdisplay<br>&nbsp; --- Volume group ---
<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; System ID<br>&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Metadata Sequence No&nbsp; 7<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>
&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.88 GB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
32.00 MB<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 252<br>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 251 / 7.84 GB<br>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 / 32.00 MB<br>&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KcM5Db-Rp6y-fn04-3WiM-RXID-XYs7-taWQfn<br><br><br>Im trying to change the vg name for my boot disk, as follow
<br><br>reboot the computer with rescue disk ( Centos 4.3 ) and do not charge image of my file system<br><br>lvm vgchange -an<br><br>lvm vgchange VolGroup00 VolGroupXX<br><br>then change <br><br>/etc/fstab, as apropiatte to VolGroupXX
<br>and <br>/boot/grub/grub.conf in the same way<br><br>then im trying to restart but ...<br><br>found VolGroupXX using metadata type LVM2<br>unable to found volume group VolGroup00<br><br>so my question what im missing?<br>
<br>Please give me a help on this!! <br>Thanks in advance NewZen<br><br><br>

------=_Part_122774_29301242.1155479995027--
