Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9BCmSmr028208
	for <linux-lvm@redhat.com>; Sat, 11 Oct 2008 08:48:28 -0400
Received: from rediffmail.com (f4mail-235-145.rediffmail.com [202.137.235.145])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m9BCm6YT003194
	for <linux-lvm@redhat.com>; Sat, 11 Oct 2008 08:48:07 -0400
Date: 11 Oct 2008 12:53:55 -0000
MIME-Version: 1.0
Message-ID: <1223727743.722.autosave.old.1223729635.25709@webmail.rediffmail.com>
From: "prashant laxman waman" <prashant_waman@rediffmail.com>
Content-Type: multipart/alternative;
	boundary="=_ef7c93cc729601b81c1d402a6a127407"
Subject: [linux-lvm] Help - Can't find the ext3 filesystem on dm-0
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

--=_ef7c93cc729601b81c1d402a6a127407
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,
I have a problem with lvm as described below:
1. I had a system with on 80GB and 1000GB HDD with one /boot (ext3) and on VolGroup00 wth LogVol00 and working fine.2. Now i added one more HDD (1000 GB), created partition using fdisk and tried to create the filesystem with mkfs.3. while executing mkfs, it started giving some i/o errors. I restarted the system.4. After boot it started giving errors like xxx uuid not found-- VolGroup00 not found -- kernel panic -- killing5. After searching on google for more than one week, i performed following operations:6. As /root was inside the LVM partition, can't access the /etc/lvm/backup, so copied the Volume Group data from 80GB HDD using hex editor on windows.7. Created a file (vol.vg) from it.8. Executed following commands from rescue disk&nbsp;pvcreate -ff --uuid xxx --restorefile vol.vg /dev/sda2&nbsp;pvcreate -ff --uuid xxx --restorefile vol.vg /dev/sdb1&nbsp;vgcfgrestore -f vol.vg&nbsp;vgchange -ay&nbsp;lvscan&nbsp;mount /dev/VolGroup00/Logvol00 /mnt/volIt gives error: file/di!
 rectory not founddmesg shows error: EXT3 global descriptor corrupt
9. If i boot from the disk, while booting it gives error: VFS: can't find ext3 filesystem on dm-0
Sorry for such lengthy mail but i am working for last one week on this and panic now.
I wan't to recover my 950 GB data from it.
Please help me.
Thanks in advanced.
Prashant
--=_ef7c93cc729601b81c1d402a6a127407
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<p>Hi all,</p>
<p>I have a problem with lvm as described below:</p>
<p>1. I had a system with on 80GB and 1000GB HDD with one /boot (ext3) and =
on VolGroup00 wth LogVol00 and working fine.<br />2. Now i added one more H=
DD (1000 GB), created partition using fdisk and tried to create the filesys=
tem with mkfs.<br />3. while executing mkfs, it started giving some i/o err=
ors. I restarted the system.<br />4. After boot it started giving errors li=
ke xxx uuid not found-- VolGroup00 not found -- kernel panic -- killing<br =
/>5. After searching on google for more than one week, i performed followin=
g operations:<br />6. As /root was inside the LVM partition, can't access t=
he /etc/lvm/backup, so copied the Volume Group data from 80GB HDD using hex=
 editor on windows.<br />7. Created a file (vol.vg) from it.<br />8. Execut=
ed following commands from rescue disk<br />&nbsp;pvcreate -ff --uuid xxx -=
-restorefile vol.vg /dev/sda2<br />&nbsp;pvcreate -ff --uuid xxx --restoref=
ile vol.vg /dev/sdb1<br />&nbsp;vgcfgrestore -f vol.vg<br />&nbsp;vgchange =
-ay<br />&nbsp;lvscan<br />&nbsp;mount /dev/VolGroup00/Logvol00 /mnt/vol<br=
 />It gives error: file/directory not found<br />dmesg shows error: EXT3 gl=
obal descriptor corrupt</p>
<p>9. If i boot from the disk, while booting it gives error: VFS: can't fin=
d ext3 filesystem on dm-0</p>
<p>Sorry for such lengthy mail but i am working for last one week on this a=
nd panic now.</p>
<p>I wan't to recover my 950 GB data from it.</p>
<p>Please help me.</p>
<p>Thanks in advanced.</p>
<p>Prashant<br /></p><br><Table border=3D0 Width=3D644 Height=3D57 cellspac=
ing=3D0 cellpadding=3D0 style=3D'font-family:Verdana;font-size:11px;line-he=
ight:15px;'><TR><td><a href=3D'http://adworks.rediff.com/cgi-bin/AdWorks/cl=
ick.cgi/www.rediff.com/signature-home.htm/1050715198@Middle5/2606998_259929=
0/2602379/1?PARTNER=3D3&OAS_QUERY=3Dnull' target=3Dnew ><img src =3D'http:/=
/imadworks.rediff.com/cgi-bin/AdWorks/adimage.cgi/2606998_2599290/creative_=
2602379.gif'  alt=3D'Black578x38_banner2.gif'  border=3D0></a></td></TR></T=
able>
--=_ef7c93cc729601b81c1d402a6a127407--
