Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6RNAKa04388
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:10:20 -0400
Received: from smtp101.mail.sc5.yahoo.com (smtp101.mail.sc5.yahoo.com
	[216.136.174.139])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6RNAJe1012268
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:10:19 -0400
Sender: frank@redhat.com
Message-ID: <4106E0D6.10D6AA3D@yahoo.de>
Date: Wed, 28 Jul 2004 01:10:14 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvscan fails 
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi

after a system crash my system can't find it's LVM volumes:

System:
- SuSE 7.3 with last 7.3 patches, own Kernel Update to 2.4.26
- was running for some longer time with SuSE lvm-1.0.0.2_rc2-6
  (vgscan --help -> LVM 1.0.1-rc2 - 30/08/2001 (IOP 10))
- I've updated LVM to LVM 1.0.8 - 17/11/2003 (IOP 10)
  in the hope to fix the problem

vgscan dies with a Segmentation fault

odie:~/LVM/1.0.8/tools # vgscan -v    
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "DATAVG" from physical volume(s)
Segmentation fault
odie:~/LVM/1.0.8/tools # 

pvscan finds the volumes of the VG

odie:~/LVM/1.0.8/tools # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "DATAVG"
(run vgscan)
pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "DATAVG"
(run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "DATAVG"
(run vgscan)
pvscan -- total: 3 [306.23 GB] / in use: 3 [306.23 GB] / in no VG: 0 [0]

odie:~/LVM/1.0.8/tools # 

Running vgscan -dv results in

...
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 3 
vg_this->pv_max: 255  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 32500
Segmentation fault

(copied the last few lines - didn't want to send 72k debug output)

Is there any chance to fix this without loosing the data on the disks?


Frank
