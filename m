Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j02CYsr07520
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 07:34:54 -0500
Received: from ratbert.donck.com (ratbert.donck.com [212.204.192.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j02CYmbF013178
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 07:34:48 -0500
Date: Sun, 2 Jan 2005 13:34:47 +0100
From: Fred Donck <fred@donck.com>
Message-ID: <20050102123447.GU326@dogbert>
References: <20050102121805.GT326@dogbert>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050102121805.GT326@dogbert>
Subject: [linux-lvm] Re: LVM2 strange behaviour
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
To: linux-lvm@redhat.com


Fred Donck <fred@donck.com>
   wrote at Sun, Jan 02, 2005 at 01:18:05PM +0100:

> 
> Happy new year all,
> 
> I am new to the mailing list and a new user of Linux LVM although i have
> been using similar technologies for years on Solaris and AIX.
> 
> I have some strange behaviour i am encountering on a newly installed
> machine.
> 
> $> lvm version  
>   LVM version:     2.00.08 (2003-11-14)
>   Library version: 1.00.17-ioctl (2004-04-19)
>   Driver version:  4.3.0
> $> 
> 

I forgot:

$> uname -a
Linux music 2.6.9-gentoo-r13 #2 SMP Thu Dec 30 11:05:38 UTC 2004 i686 Intel(R) Celeron(R) CPU 2.80GHz GenuineIntel GNU/Linux
$> df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/md2               1003932     50568    953364   6% /
/dev/vg/usr           10485436   1858748   8626688  18% /usr
/dev/vg/var           10485436     58412  10427024   1% /var
/dev/vg/tmp            4194172     32840   4161332   1% /tmp
/dev/vg/opt            4194172     32840   4161332   1% /opt
/dev/vg/home           4194172     32968   4161204   1% /home
/dev/vg/music        419417596  18097476 401320120   5% /music
/dev/vg/backup       104854396     32840 104821556   1% /backup
none                    248792         0    248792   0% /dev/shm
$> vgdisplay 
  --- Volume group ---
  VG Name               vg
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  11
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                7
  Open LV               0
  Max PV                255
  Cur PV                3
  Act PV                3
  VG Size               696.62 GB
  PE Size               4.00 MB
  Total PE              178335
  Alloc PE / Size       136192 / 532.00 GB
  Free  PE / Size       42143 / 164.62 GB
  VG UUID		YECo93-H43t-51ST-0mzk-A6OD-QtGh-5dz147
$> 

Machine contains 4x250Gb
hda and hdi are mirrored as /dev/md[0-3]
/dev/md3 is part of volumegroup "vg" including /dev/hde and /dev/hdk

If more info is needed, let me know

--- End of fred@donck.com's quote ---

Cheers,
-- 
Fred
