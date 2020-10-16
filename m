Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 112F22166B28
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2020 14:59:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D31811E76
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2020 14:59:22 +0000 (UTC)
Received: from quad.stoffel.org (066-189-075-104.res.spectrum.com
	[66.189.75.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 81FF31E21E
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2020 10:52:24 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <24457.45991.672260.342062@quad.stoffel.home>
Date: Fri, 16 Oct 2020 10:52:23 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <87362fg62i.fsf@oracle.com>
References: <87362fg62i.fsf@oracle.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Identifying Unused VG
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Annamalai" == Annamalai Gurusami <annamalai.gurusami@oracle.com> writes:

Annamalai> I am new user of LVM.  At home, in a desktop machine, I
Annamalai> installed Ubuntu 20.04 LTS and while doing so I opted for
Annamalai> LVM.  This desktop computer has 2 hard disks.  I want to
Annamalai> remove 1 hard disk and use it for another computer.  But I
Annamalai> need to remove the hard disk without loss of data.  The
Annamalai> problem now is that there are two VG listed, while I think
Annamalai> it should be only one.  How to identify the unwanted VG?
Annamalai> Maybe this is because of multiple attempts at installation.
Annamalai> Any help on this is much appreciated.

Ugh!  How did you do this?  Did you clone one disk on top of another?

Can you boot off a liveCD and do the same command again please?   Also
please run the 'blkid' command show that output as well.  And show the
output of 'cat /proc/partitions' and /proc/mdstat as well.  Are you
running RAID on this system?  Or did you try to do that?  
 
Annamalai> Here are some of the output of the commands in that desktop:

Looking at your 'lsblk' output, I suspect you can remove drive sda,
the Seagate.  So I'd probably try to shutdown cleanly, then remove
that drive and boot up again.  


Annamalai> root@desktop02:~# lsblk --scsi
Annamalai> NAME HCTL       TYPE VENDOR   MODEL                 REV TRAN
Annamalai> sda  2:0:0:0    disk ATA      ST2000DM005-2CW102   0001 sata
Annamalai> sdb  8:0:0:0    disk ATA      WDC_WD20EZAZ-00GGJB0 0A80 sata
Annamalai> root@desktop02:~# vgs
Annamalai>   VG       #PV #LV #SN Attr   VSize  VFree
Annamalai>   vgubuntu   1   2   0 wz--n- <1.82t    0 
Annamalai>   vgubuntu   1   2   0 wz--n- <1.82t    0 
Annamalai> root@desktop02:~# pvs
Annamalai>   PV         VG       Fmt  Attr PSize  PFree
Annamalai>   /dev/sda2  vgubuntu lvm2 a--  <1.82t    0 
Annamalai>   /dev/sdb5  vgubuntu lvm2 a--  <1.82t    0 
Annamalai> root@desktop02:~# lvs
Annamalai>   LV     VG       Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
Annamalai>   root   vgubuntu -wi-ao----  <1.82t                                                    
Annamalai>   root   vgubuntu -wi-------  <1.82t                                                    
Annamalai>   swap_1 vgubuntu -wi-ao---- 976.00m                                                    
Annamalai>   swap_1 vgubuntu -wi------- 976.00m                                                    
Annamalai> root@desktop02:~# lsblk
Annamalai> NAME                MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
Annamalai> loop0                 7:0    0    55M  1 loop /snap/core18/1880
Annamalai> loop1                 7:1    0   251M  1 loop /snap/gimp/292
Annamalai> loop2                 7:2    0 161.4M  1 loop /snap/gnome-3-28-1804/128
Annamalai> loop3                 7:3    0   251M  1 loop /snap/gimp/297
Annamalai> loop4                 7:4    0 162.9M  1 loop /snap/gnome-3-28-1804/145
Annamalai> loop5                 7:5    0  55.3M  1 loop /snap/core18/1885
Annamalai> loop6                 7:6    0 255.6M  1 loop /snap/gnome-3-34-1804/36
Annamalai> loop7                 7:7    0 217.9M  1 loop /snap/gnome-3-34-1804/60
Annamalai> loop8                 7:8    0  62.1M  1 loop /snap/gtk-common-themes/1506
Annamalai> loop9                 7:9    0 138.4M  1 loop /snap/inkscape/7947
Annamalai> loop10                7:10   0 260.7M  1 loop /snap/kde-frameworks-5-core18/32
Annamalai> loop11                7:11   0  43.2M  1 loop /snap/snap-store/415
Annamalai> loop12                7:12   0  50.7M  1 loop /snap/snap-store/481
Annamalai> loop13                7:13   0  30.3M  1 loop /snap/snapd/9279
Annamalai> loop14                7:14   0    31M  1 loop /snap/snapd/9607
Annamalai> loop15                7:15   0 217.5M  1 loop /snap/supertux/229
Annamalai> loop16                7:16   0 290.4M  1 loop /snap/vlc/1700
Annamalai> sda                   8:0    0   1.8T  0 disk 
Annamalai> ├─sda1                8:1    0   512M  0 part 
Annamalai> └─sda2                8:2    0   1.8T  0 part 
Annamalai> sdb                   8:16   0   1.8T  0 disk 
Annamalai> ├─sdb1                8:17   0   512M  0 part /boot/efi
Annamalai> ├─sdb2                8:18   0     1K  0 part 
Annamalai> └─sdb5                8:21   0   1.8T  0 part 
Annamalai>   ├─vgubuntu-root   253:0    0   1.8T  0 lvm  /
Annamalai>   └─vgubuntu-swap_1 253:1    0   976M  0 lvm  [SWAP]
Annamalai> root@desktop02:~# 

Annamalai> Since both the VG is named as "vgubuntu", I am wondering how to identify
Annamalai> the unused or unwanted VG.  And I need to identify which hard disk (sda
Annamalai> or sdb) I can remove.  And what I need to do before unplugging it.

Annamalai> I would appreciate if you people can point me in the right
Annamalai> direction. Thank you.

Annamalai> Rgds,
Annamalai> anna

Annamalai> -- 
mysql> help year data type;
Annamalai> Name: 'YEAR DATA TYPE'
Annamalai> Description:
Annamalai> YEAR[(4)]

Annamalai> A year in 4-digit format. MySQL displays YEAR values in YYYY format,
Annamalai> but permits assignment of values to YEAR columns using either strings
Annamalai> or numbers. Values display as 1901 to 2155, or 0000.



Annamalai> _______________________________________________
Annamalai> linux-lvm mailing list
Annamalai> linux-lvm@redhat.com
Annamalai> https://www.redhat.com/mailman/listinfo/linux-lvm
Annamalai> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
