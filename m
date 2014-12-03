Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB3GUKAc003518
	for <linux-lvm@redhat.com>; Wed, 3 Dec 2014 11:30:20 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB3GUE5V004269
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 3 Dec 2014 11:30:15 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1XwCa0-00067H-6d
	for linux-lvm@redhat.com; Wed, 03 Dec 2014 17:15:04 +0100
Received: from 156.40.186.133 ([156.40.186.133])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 03 Dec 2014 17:15:04 +0100
Received: from roark.maccado by 156.40.186.133 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 03 Dec 2014 17:15:04 +0100
From: Rock <roark.maccado@gmail.com>
Date: Wed, 3 Dec 2014 16:12:18 +0000 (UTC)
Message-ID: <loom.20141203T163029-461@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] ThinProvisioned lvm's Don't Activate or Mount
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello All,

I have two PV's with Thin Volumes within them.
Im not able to mount or activate either after trying to 
vgcfgrestore one of them.
PV,VG and LV display/scan all show volumes 
but cant activate them or mount them.


I ran the following command to restore the thin volume 
from the metadata file in /etc/lvm/archive.

vgcfgrestore --force -f 
/etc/lvm/archive/vg_sfim_00640-658506285.vg vg_sfim 
Scan commands:

[root@erbium ~]# pvs
  PV         VG        Fmt  Attr PSize  PFree
  /dev/sda2  vg_erbium lvm2 a--  59.51g    0 
  /dev/sdb   vg_sfim   lvm2 a--  29.80t    0 
  /dev/sdc   vg_sfim   lvm2 a--   6.58t    0 
  /dev/sdd   vg_fmrif  lvm2 a--  36.39t    0 
You have new mail in /var/spool/mail/root
[root@erbium ~]# vgs
  VG        #PV #LV #SN Attr   VSize  VFree
  vg_erbium   1   3   0 wz--n- 59.51g    0 
  vg_fmrif    1  14   0 wz--n- 36.39t    0 
  vg_sfim     2   3   0 wz--n- 36.39t    0 
[root@erbium ~]# lvs
  lv_home                   vg_erbium -wi-ao----  3.19g 
  lv_root                   vg_erbium -wi-ao---- 32.68g
  lv_swap                   vg_erbium -wi-ao---- 23.64g
  lv_fmrif                  vg_fmrif  Vwi---tz-- 20.00t thinpool
  lv_fmrif_2014_11_20_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_fmrif_2014_11_21_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_fmrif_2014_11_22_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_fmrif_2014_11_23_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_fmrif_2014_11_24_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_fmrif_2014_11_25_23_00 vg_fmrif  Vwi---tz-k 20.00t thinpool      lv_fmrif
  lv_users                  vg_fmrif  Vwi---tz--  1.00t thinpool
  lv_users_2014_11_21_23_00 vg_fmrif  Vwi---tz-k  1.00t thinpool      lv_users
  lv_users_2014_11_22_23_00 vg_fmrif  Vwi---tz-k  1.00t thinpool      lv_users
  lv_users_2014_11_23_23_00 vg_fmrif  Vwi---tz-k  1.00t thinpool      lv_users
  lv_users_2014_11_24_23_00 vg_fmrif  Vwi---tz-k  1.00t thinpool      lv_users
  lv_users_2014_11_25_23_00 vg_fmrif  Vwi---tz-k  1.00t thinpool      lv_users
  thinpool                  vg_fmrif  twi---tz-- 36.39t
  lv_sfim                   vg_sfim   Vwi---tz-k 35.00t sfim_thinpool
  lv_sfim_2014_11_23_23_00  vg_sfim   Vwi---tz-k 35.00t sfim_thinpool
  sfim_thinpool             vg_sfim   twi---tz-- 36.39t

cant seam to activate them when i do a vgchange.

Get the following output:

[root@erbium ~]# vgchange -ay
  Check of pool vg_fmrif/thinpool failed (status:1). Manual repair required!
  0 logical volume(s) in volume group "vg_fmrif" now active
  Thin pool transaction_id is 649, while expected 647.
  0 logical volume(s) in volume group "vg_sfim" now active
  3 logical volume(s) in volume group "vg_erbium" now active

Also dmsetup command used to show me the volumes in question,
however after reboot it does not

[root@erbium ~]# dmsetup info -c
Name              Maj Min Stat Open Targ Event  UUID
vg_erbium-lv_root 253   0 L--w    1    1      0 LVM-
vg_erbium-lv_home 253   2 L--w    1    1      0 LVM-
vg_erbium-lv_swap 253   1 L--w    1    1      0 LVM-

[root@erbium ~]# dmsetup table
vg_erbium-lv_root: 0 68534272 linear 8:2 2048
vg_erbium-lv_home: 0 6684672 linear 8:2 68536320
vg_erbium-lv_swap: 0 49577984 linear 8:2 75220992

[root@erbium ~]# dmsetup status
vg_erbium-lv_root: 0 68534272 linear 
vg_erbium-lv_home: 0 6684672 linear 
vg_erbium-lv_swap: 0 49577984 linear 

Any help would be greatly appreciated.
Thanks in advance 
Rock
