Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6D8hPJX013205
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:43:25 -0400
Received: from jona ([212.84.244.107])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6D8hJhq007333
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:43:19 -0400
Received: from 212.84.244.108 ([212.84.244.108])
	by jona (JAMES SMTP Server 2.2.0) with SMTP ID 958
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 12:42:49 +0200 (CEST)
Message-ID: <44B6078F.20809@klaiber.com>
Date: Thu, 13 Jul 2006 10:42:55 +0200
From: Simon Klaiber <lists@klaiber.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan -- ERROR "pv_read_pe(): PV size invalid" ...
References: <212696550607090024x3733187fx8b3a2f26b692e020@mail.gmail.com>	<212696550607090633w568b6056u779486d65b422339@mail.gmail.com>
	<44B17C13.40609@klaiber.com>
In-Reply-To: <44B17C13.40609@klaiber.com>
Content-Transfer-Encoding: 7bit
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

After many tries I still have found no solution for my problem.
I'm getting real desperate beacuse there is some important data on the
vg and for some newer stuff i don't have a backup.
I don't care if i can't bring back the vg to fully functional but I need
at least a solution that allows me to copy the files to other disks.

I'm pretty sure that all data is still there also the data i can see
with pvdisplay/pvdata looks good.

I have valid lvmconf files for the fileserver vg and can play them in
using vgcfgrestore

I just don't have an recent backup of lvmtab and lvmtab.d (i think the
most recent one was before the last chage of the LVs.
Can I destroy somethin when I try to activate the VG using these old files?

What is a bit strange to me is the
<333> pv_read_pe -- CALLED with /dev/md0 and 4024434688
Part of the debug information since I don't understand what this (IMHO
to big number means)

It is produce by this source code

debug_enter ( "pv_read_pe -- CALLED with %s and %lu\n",
                 pv != NULL ? pv->pv_name : "NULL",
                 pv != NULL ? pv->pe_total : 0);

and i just cant bring together this number with what i see in pvdisplay

The second thing I don't understand is the exact cause of the error:

The error number is defined as:

#define
LVM_EPV_READ_PE_SIZE                                                277

and the point where it is thrown looks like this:

size = pv->pe_total * sizeof ( pe_disk_t);
   if ( size + pv->pe_on_disk.base > LVM_VGDA_SIZE ( pv)) {
      ret = -LVM_EPV_READ_PE_SIZE;
      goto pv_read_pe_end;
   }

where is defined as
#define    LVM_VGDA_SIZE(pv) ((pv)->pe_on_disk.base + (pv)->pe_on_disk.size)

This means that  pe_on_disk_size is smaller than size

I coud not find out what sizeof ( pe_disk_t) stnds for but it still let
me assume that pv->pe_total is to big

What could have caused this problem?

I would be very happy about any kind of help!

Thanks Simon





Simon Klaiber wrote:

>I have following problem:
>
>I'm running  lvm on a Linux 2.4.20 Kernel since 2 Years now without
>problems
>
>There is only one PV a Software RAID5 (/dev/md0) consiting out of 6 Disks
>
>No I had to exchage the motherboard due to a hw failure.
>
>After this exchage the Software Raid found 5 of the 6 Disks and
>started without redudancy.
>At this point the lvm was still working correct.
>
>I hot added the missing Drive to the RAID again which worked fine.
>
>After that i reebootet the system for other reasons.
>
>The result:
>
>The Raid still work fine but vgscan Fails with following error:
>
>----------------
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- ERROR "pv_read_pe(): PV size invalid" can't get data of
>volume group "fileserver" from physical volume(s)
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of your
>volume group
>----------------
>
>Does anyone knows how I can recover from this error and save my data.
>
>Thanks and greetings from Germany
>Simon
>
>Additional Information:
>
>1) --------- Version of LVM ------------
>Logical Volume Manager 1.0.6(mp-v6)
>Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)
>
>2) --------- possibility of update  ------------
>I cannot do any updates that include Kernel updates since the hdd
>controlor runs only with this kernel version
>
>3) --------- Result of pvscan  ------------
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/md0"  is associated to unknown VG
>"fileserver" (run vgscan)
>pvscan -- total: 1 [8.02 GB] / in use: 1 [8.02 GB] / in no VG: 0 [0]
>
>
>4) --------- Result of pvdisplay /dev/md0  ------------
>--- Physical volume ---
>PV Name               /dev/md0
>VG Name               fileserver
>PV Size               931.55 GB [1953606400 secs] / NOT usable 32.25
>MB [LVM: 244 KB]
>PV#                   1
>PV Status             available
>Allocatable           yes
>Cur LV                10
>PE Size (KByte)       32768
>Total PE              29808
>Free PE               2256
>Allocated PE          27552
>PV UUID               5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4
>
>
>5) --------- Result of pvdata /dev/md0  ------------
>--- Physical volume ---
>PV Name               /dev/md0
>VG Name               fileserver
>PV Size               931.55 GB [1953606400 secs] / NOT usable 32.25
>MB [LVM: 244 KB]
>PV#                   1
>PV Status             available
>Allocatable           yes
>Cur LV                10
>PE Size (KByte)       32768
>Total PE              29808
>Free PE               2256
>Allocated PE          27552
>PV UUID               5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4
>
>--- Volume group ---
>VG Name
>VG Access             read/write
>VG Status             NOT available/resizable
>VG #                  0
>MAX LV                256
>Cur LV                10
>Open LV               0
>MAX LV Size           2 TB
>Max PV                256
>Cur PV                1
>Act PV                1
>VG Size               931.50 GB
>PE Size               32 MB
>Total PE              29808
>Alloc PE / Size       27552 / 861 GB
>Free  PE / Size       2256 / 70.50 GB
>VG UUID               mDIV2I-dJd3-0oJW-XJt3-nHI7-sAjv-8bs8pj
>
>--- List of logical volumes ---
>
>pvdata -- logical volume "/dev/fileserver/db" at offset   0
>pvdata -- logical volume "/dev/fileserver/docs" at offset   1
>pvdata -- logical volume "/dev/fileserver/code" at offset   2
>pvdata -- logical volume "/dev/fileserver/pics" at offset   3
>pvdata -- logical volume "/dev/fileserver/mp3" at offset   4
>pvdata -- logical volume "/dev/fileserver/arch" at offset   5
>pvdata -- logical volume "/dev/fileserver/pg" at offset   6
>pvdata -- logical volume "/dev/fileserver/pt" at offset   7
>pvdata -- logical volume "/dev/fileserver/bak" at offset   8
>pvdata -- logical volume struct at offset   9 is empty
>pvdata -- logical volume "/dev/fileserver/films" at offset  10
>pvdata -- logical volume struct at offset  11 is empty
>pvdata -- logical volume struct at offset  12 is empty
>pvdata -- logical volume struct at offset  13 is empty
>[..... empty volums structs cut out ...]
>pvdata -- logical volume struct at offset 254 is empty
>pvdata -- logical volume struct at offset 255 is empty
>--- List of physical volume UUIDs ---
>
>001: 5fK20C-BzqI-6PIc-nj8b-3DTD-TJ3p-0uJpn4
>
>
>
>6) --------- Result vgscan -d (DEBUG MODE)  ------------
><1> lvm_get_iop_version -- CALLED
><22> lvm_check_special -- CALLED
><22> lvm_check_special -- LEAVING
>[... a lot lines cut out ...]
><333> vg_check_name -- CALLED with VG: fileserver
><4444> lvm_check_chars -- CALLED with name: "fileserver"
><4444> lvm_check_chars -- LEAVING with ret: 0
><333> vg_check_name -- LEAVING with ret: 0
><333> pv_read_all_pv_of_vg -- CALLED with vg_name: "fileserver"
><4444> vg_check_name -- CALLED with VG: fileserver
><55555> lvm_check_chars -- CALLED with name: "fileserver"
><55555> lvm_check_chars -- LEAVING with ret: 0
><4444> vg_check_name -- LEAVING with ret: 0
><333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
><22> pv_read_all_pe_of_vg -- pv_count: 1
><333> pv_read_pe -- CALLED with /dev/md0 and 4024434688
><333> pv_read_pe -- LEAVING with ret: -277
><22> pv_read_all_pe_of_vg -- LEAVING with ret: -277
><1> vg_read_with_pv_and_lv -- LEAVING with ret: -277
><1> lvm_error -- CALLED with: -277
><1> lvm_error -- LEAVING with: "pv_read_pe(): PV size invalid"
>vgscan -- ERROR "pv_read_pe(): PV size invalid" can't get data of
>volume group "fileserver" from physical volume(s)
><1> vg_free -- CALLED
><1> vg_free -- LEAVING with ret: -99
><1> lvm_interrupt -- CALLED
><1> lvm_interrupt -- LEAVING
><1> lvm_unlock -- CALLED
><1> lvm_unlock -- LEAVING with ret: 0
><1> lvm_unlock -- CALLED
><1> lvm_unlock -- LEAVING with ret: -104
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of your
>volume group
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
