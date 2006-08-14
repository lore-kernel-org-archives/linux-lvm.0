Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7E8YlPm031836
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 04:34:47 -0400
Received: from ns1.ufreight.com.hk ([202.82.54.121])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7E8YaCS025169
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 04:34:37 -0400
Received: from icilszxlx01 (icilszxlx01 [192.168.18.225])
	by ns1.ufreight.com.hk (8.13.4/8.13.4) with ESMTP id k7E7oZQh019203
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 15:50:36 +0800 (CST)
Received: from ICILSZXPC14.ufreight.com ([192.168.18.114])
	(authenticated user bladesun@icil.net)
	by icilszxlx01 (Kerio MailServer 6.2.0) for linux-lvm@redhat.com;
	Mon, 14 Aug 2006 15:43:07 +0800
Date: Mon, 14 Aug 2006 15:53:48 +0800
Message-ID: <CDED7FBC-DE78-4E45-AC9B-904959EBBF56@icil.net>
From: "Blade Sun/ICILSZX" <bladesun@icil.net>
Sender: "Blade Sun/ICILSZX" <bladesun@icil.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Error in RHEL 4: Can't create or delete LV or VG
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi:

I got problem when I configuring the LVM in RHEL 4, I set it as follow, as " A". There are 2 VG, and the problem is in VGICIL. VGICIL contains 3 PV on 2 disks. It was set by vendor, but it doesn't follow our requirement due to they didn't set mirror on original LV, so I deleted the old LV and wanted to create mirrored LV.  But when I create LV, it came out the error, in B section, but it really created the mlog of this LV. And now I can't create a LV or delete the VG, anyone please help to fix it? Thanks.

A
========================
[root@uflonlx01 mapper]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  vgicil   3   3   0 wz--n- 136.70G 136.69G
  vgroot   1   5   0 wz--n-  68.25G  48.66G
[root@uflonlx01 mapper]# vgdisplay
  --- Volume group ---
  VG Name               vgicil
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               136.70 GB
  PE Size               4.00 MB
  Total PE              34996
  Alloc PE / Size       3 / 12.00 MB
  Free  PE / Size       34993 / 136.69 GB
  VG UUID               lqXCtq-J6Bw-vw2u-rS6P-I9DO-cSRS-HHY7XY

  --- Volume group ---
  VG Name               vgroot
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
  Open LV               5
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               68.25 GB
  PE Size               32.00 MB
  Total PE              2184
  Alloc PE / Size       627 / 19.59 GB
  Free  PE / Size       1557 / 48.66 GB
  VG UUID               XUkcTx-6IsZ-Hts7-vZRO-giuO-OgQd-dIatvz


[root@uflonlx01 mapper]# lvs
  LV            VG     Attr   LSize Origin Snap%  Move Log Copy%
  lvmail_mlog   vgicil -wi-a- 4.00M
  lvmail_mlog_0 vgicil -wi-a- 4.00M
  lvshare_mlog  vgicil -wi-a- 4.00M
  lgvar         vgroot -wi-ao 2.94G
  lvopt         vgroot -wi-ao 4.91G
  lvroot        vgroot -wi-ao 2.94G
  lvswap        vgroot -wi-ao 2.94G
  lvusr         vgroot -wi-ao 5.88G


B
========================
[root@uflonlx01 mapper]# lvm
lvm> lvcreate -m1 -n lvhome  -L 1G vgicil
  device-mapper: table ioctl failed: Invalid argument
  Aborting. Failed to activate mirror log. Remove new LVs and retry.
lvm> lvs
  LV            VG     Attr   LSize Origin Snap%  Move Log Copy%
  lvhome_mlog   vgicil -wi-d- 4.00M
  lvmail_mlog   vgicil -wi-a- 4.00M
  lvmail_mlog_0 vgicil -wi-a- 4.00M
  lvshare_mlog  vgicil -wi-a- 4.00M
  lgvar         vgroot -wi-ao 2.94G
  lvopt         vgroot -wi-ao 4.91G
  lvroot        vgroot -wi-ao 2.94G
  lvswap        vgroot -wi-ao 2.94G
  lvusr         vgroot -wi-ao 5.88G

 
Thanks&Regards
Blade Sun/ICILSZX
