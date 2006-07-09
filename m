Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k69Lwo4u002355
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 17:58:50 -0400
Received: from jona ([212.84.244.107])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k69LwmFs004002
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 17:58:48 -0400
Received: from 212.84.244.108 ([212.84.244.108])
	by jona (JAMES SMTP Server 2.2.0) with SMTP ID 546
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 01:58:39 +0200 (CEST)
Message-ID: <44B17C13.40609@klaiber.com>
Date: Sun, 09 Jul 2006 23:58:43 +0200
From: Simon Klaiber <lists@klaiber.com>
MIME-Version: 1.0
References: <212696550607090024x3733187fx8b3a2f26b692e020@mail.gmail.com>
	<212696550607090633w568b6056u779486d65b422339@mail.gmail.com>
In-Reply-To: <212696550607090633w568b6056u779486d65b422339@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan -- ERROR "pv_read_pe(): PV size invalid"  ...
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I have following problem:

I'm running  lvm on a Linux 2.4.20 Kernel since 2 Years now without
problems

There is only one PV a Software RAID5 (/dev/md0) consiting out of 6 Disks

No I had to exchage the motherboard due to a hw failure.

After this exchage the Software Raid found 5 of the 6 Disks and
started without redudancy.
At this point the lvm was still working correct.

I hot added the missing Drive to the RAID again which worked fine.

After that i reebootet the system for other reasons.

The result:

The Raid still work fine but vgscan Fails with following error:

----------------
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "pv_read_pe(): PV size invalid" can't get data of
volume group "fileserver" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume group
----------------

Does anyone knows how I can recover from this error and save my data.

Thanks and greetings from Germany
Simon

Additional Information:

1) --------- Version of LVM ------------
Logical Volume Manager 1.0.6(mp-v6)
Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)

2) --------- possibility of update  ------------
I cannot do any updates that include Kernel updates since the hdd
controlor runs only with this kernel version

3) --------- Result of pvscan  ------------
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"  is associated to unknown VG
"fileserver" (run vgscan)
pvscan -- total: 1 [8.02 GB] / in use: 1 [8.02 GB] / in no VG: 0 [0]


4) --------- Result of pvdisplay /dev/md0  ------------
--- Physical volume ---
PV Name               /dev/md0
VG Name               fileserver
PV Size               931.55 GB [1953606400 secs] / NOT usable 32.25
MB [LVM: 244 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                10
PE Size (KByte)       32768
Total PE              29808
Free PE               2256
Allocated PE          27552
PV UUID               5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4


5) --------- Result of pvdata /dev/md0  ------------
--- Physical volume ---
PV Name               /dev/md0
VG Name               fileserver
PV Size               931.55 GB [1953606400 secs] / NOT usable 32.25
MB [LVM: 244 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                10
PE Size (KByte)       32768
Total PE              29808
Free PE               2256
Allocated PE          27552
PV UUID               5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                10
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               931.50 GB
PE Size               32 MB
Total PE              29808
Alloc PE / Size       27552 / 861 GB
Free  PE / Size       2256 / 70.50 GB
VG UUID               mDIV2I-dJd3-0oJW-XJt3-nHI7-sAjv-8bs8pj

--- List of logical volumes ---

pvdata -- logical volume "/dev/fileserver/db" at offset   0
pvdata -- logical volume "/dev/fileserver/docs" at offset   1
pvdata -- logical volume "/dev/fileserver/code" at offset   2
pvdata -- logical volume "/dev/fileserver/pics" at offset   3
pvdata -- logical volume "/dev/fileserver/mp3" at offset   4
pvdata -- logical volume "/dev/fileserver/arch" at offset   5
pvdata -- logical volume "/dev/fileserver/pg" at offset   6
pvdata -- logical volume "/dev/fileserver/pt" at offset   7
pvdata -- logical volume "/dev/fileserver/bak" at offset   8
pvdata -- logical volume struct at offset   9 is empty
pvdata -- logical volume "/dev/fileserver/films" at offset  10
pvdata -- logical volume struct at offset  11 is empty
pvdata -- logical volume struct at offset  12 is empty
pvdata -- logical volume struct at offset  13 is empty
[..... empty volums structs cut out ...]
pvdata -- logical volume struct at offset 254 is empty
pvdata -- logical volume struct at offset 255 is empty
--- List of physical volume UUIDs ---

001: 5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4



6) --------- Result vgscan -d (DEBUG MODE)  ------------
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
[... a lot lines cut out ...]
<333> vg_check_name -- CALLED with VG: fileserver
<4444> lvm_check_chars -- CALLED with name: "fileserver"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "fileserver"
<4444> vg_check_name -- CALLED with VG: fileserver
<55555> lvm_check_chars -- CALLED with name: "fileserver"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- pv_count: 1
<333> pv_read_pe -- CALLED with /dev/md0 and 4024434688
<333> pv_read_pe -- LEAVING with ret: -277
<22> pv_read_all_pe_of_vg -- LEAVING with ret: -277
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -277
<1> lvm_error -- CALLED with: -277
<1> lvm_error -- LEAVING with: "pv_read_pe(): PV size invalid"
vgscan -- ERROR "pv_read_pe(): PV size invalid" can't get data of
volume group "fileserver" from physical volume(s)
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume group
