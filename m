Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3862613DFD2
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 14:35:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ABAB800183
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 14:35:29 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	09FA0dRb128299
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 10:02:51 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 346g8gh3nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 10:02:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	09FA0cCi030369
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 10:02:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 343pw04ua5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 10:02:50 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FA2n0m013713
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 10:02:49 GMT
From: Annamalai Gurusami <annamalai.gurusami@oracle.com>
Date: Thu, 15 Oct 2020 15:32:45 +0530
Message-ID: <87362fg62i.fsf@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Identifying Unused VG
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi All,

I am new user of LVM.  At home, in a desktop machine, I installed Ubuntu
20.04 LTS and while doing so I opted for LVM.  This desktop computer has
2 hard disks.  I want to remove 1 hard disk and use it for another
computer.  But I need to remove the hard disk without loss of data.  The
problem now is that there are two VG listed, while I think it should be
only one.  How to identify the unwanted VG? Maybe this is because of
multiple attempts at installation.  Any help on this is much
appreciated.

Here are some of the output of the commands in that desktop:

root@desktop02:~# lsblk --scsi
NAME HCTL       TYPE VENDOR   MODEL                 REV TRAN
sda  2:0:0:0    disk ATA      ST2000DM005-2CW102   0001 sata
sdb  8:0:0:0    disk ATA      WDC_WD20EZAZ-00GGJB0 0A80 sata
root@desktop02:~# vgs
  VG       #PV #LV #SN Attr   VSize  VFree
  vgubuntu   1   2   0 wz--n- <1.82t    0 
  vgubuntu   1   2   0 wz--n- <1.82t    0 
root@desktop02:~# pvs
  PV         VG       Fmt  Attr PSize  PFree
  /dev/sda2  vgubuntu lvm2 a--  <1.82t    0 
  /dev/sdb5  vgubuntu lvm2 a--  <1.82t    0 
root@desktop02:~# lvs
  LV     VG       Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root   vgubuntu -wi-ao----  <1.82t                                                    
  root   vgubuntu -wi-------  <1.82t                                                    
  swap_1 vgubuntu -wi-ao---- 976.00m                                                    
  swap_1 vgubuntu -wi------- 976.00m                                                    
root@desktop02:~# lsblk
NAME                MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0                 7:0    0    55M  1 loop /snap/core18/1880
loop1                 7:1    0   251M  1 loop /snap/gimp/292
loop2                 7:2    0 161.4M  1 loop /snap/gnome-3-28-1804/128
loop3                 7:3    0   251M  1 loop /snap/gimp/297
loop4                 7:4    0 162.9M  1 loop /snap/gnome-3-28-1804/145
loop5                 7:5    0  55.3M  1 loop /snap/core18/1885
loop6                 7:6    0 255.6M  1 loop /snap/gnome-3-34-1804/36
loop7                 7:7    0 217.9M  1 loop /snap/gnome-3-34-1804/60
loop8                 7:8    0  62.1M  1 loop /snap/gtk-common-themes/1506
loop9                 7:9    0 138.4M  1 loop /snap/inkscape/7947
loop10                7:10   0 260.7M  1 loop /snap/kde-frameworks-5-core18/32
loop11                7:11   0  43.2M  1 loop /snap/snap-store/415
loop12                7:12   0  50.7M  1 loop /snap/snap-store/481
loop13                7:13   0  30.3M  1 loop /snap/snapd/9279
loop14                7:14   0    31M  1 loop /snap/snapd/9607
loop15                7:15   0 217.5M  1 loop /snap/supertux/229
loop16                7:16   0 290.4M  1 loop /snap/vlc/1700
sda                   8:0    0   1.8T  0 disk 
����sda1                8:1    0   512M  0 part 
����sda2                8:2    0   1.8T  0 part 
sdb                   8:16   0   1.8T  0 disk 
����sdb1                8:17   0   512M  0 part /boot/efi
����sdb2                8:18   0     1K  0 part 
����sdb5                8:21   0   1.8T  0 part 
  ����vgubuntu-root   253:0    0   1.8T  0 lvm  /
  ����vgubuntu-swap_1 253:1    0   976M  0 lvm  [SWAP]
root@desktop02:~# 

Since both the VG is named as "vgubuntu", I am wondering how to identify
the unused or unwanted VG.  And I need to identify which hard disk (sda
or sdb) I can remove.  And what I need to do before unplugging it.

I would appreciate if you people can point me in the right
direction. Thank you.

Rgds,
anna

-- 
mysql> help year data type;
Name: 'YEAR DATA TYPE'
Description:
YEAR[(4)]

A year in 4-digit format. MySQL displays YEAR values in YYYY format,
but permits assignment of values to YEAR columns using either strings
or numbers. Values display as 1901 to 2155, or 0000.
