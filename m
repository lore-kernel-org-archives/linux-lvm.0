Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 15:25:35 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan can't find vg after system crash
Message-ID: <20010717152535.A18152@sistina.com>
References: <87117853BCEBD4118E9F0000D11E22E208D410@MRAGVS23.DPMA.DE>
Mime-Version: 1.0
In-Reply-To: <87117853BCEBD4118E9F0000D11E22E208D410@MRAGVS23.DPMA.DE>; from Volker.Jahns@dpma.de on Tue, Jul 17, 2001 at 02:49:43PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 17, 2001 at 02:49:43PM +0200, Jahns Volker Dr. wrote:
> vgscan will not find any volume groups after system crash, where one pv was
> lost.
> 
> 
> pvdisplay reports
> 	--- Physical volume ---
> PV Name               /dev/hdb3
> VG Name               vg01
> PV Size               5.86 GB / NOT usable 264 KB [LVM: 235 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1500
> Free PE               0
> Allocated PE          1500
> PV UUID               /dev/h-db3
> 
> Other than vgscan I have tried to restore by using the vgcfgrestore tool
> 
> cp /etc/lvmconf/vg01.conf /etc/lvmtab.d/vg01
> echo -ne 'vg01\0' >/etc/lvmtab
> 
> vgcfgrestore -n vg01 exits w/ error message:
> 
> vgcfgrestore -- ERROR: different structure size stored in
> "/etc/lvmconf/vg01.conf" than expected in file vg_cfgrestore.c [line 120]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "vg01"

You seem to have upgraded the LVM software and didn't take metadata backups
afterwards. Sorry, in order to use that old backup, you need to downgrade 
the software again :-(

> 
> 
> Otherwise, pvdata reports
> --- Physical volume ---
> PV Name               
> VG Name               vg01
> PV Size               5.86 GB / NOT usable 264 KB [LVM: 235 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1500
> Free PE               0
> Allocated PE          1500
> PV UUID               /dev/h-db3
> 
> --- Volume group ---
> VG Name               
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               7.18 GB
> PE Size               4 MB
> Total PE              1838
> Alloc PE / Size       1838 / 7.18 GB
> Free  PE / Size       0 / 0
> VG UUID               vg01
> 
> --- List of logical volumes ---
> 
> pvdata -- logical volume "/dev/vg01/lvol1" at offset   0
> pvdata -- logical volume struct at offset   1 is empty
> pvdata -- logical volume struct at offset   2 is empty
> pvdata -- logical volume struct at offset   3 is empty
> pvdata -- logical volume struct at offset   4 is empty
> pvdata -- logical volume struct at offset   5 is empty
> pvdata -- logical volume struct at offset   6 is empty
> ...
> 
> --- List of physical extents ---
> 
> PE: 00000  LV: 001  LE: 00000
> PE: 00001  LV: 001  LE: 00001
> PE: 00002  LV: 001  LE: 00002
> PE: 00003  LV: 001  LE: 00003
> PE: 00004  LV: 001  LE: 00004
> PE: 00005  LV: 001  LE: 00005
> PE: 00006  LV: 001  LE: 00006
> ...
> LE
> 
> pvdata exits w/ error message:
> pvdata -- ERROR "pv_read_uuidlist(): open" reading physical volume uuid list
> from physical volume "/dev/hdb3"
> 
> How come that pvdata doesn't show the PV resp. VG name? 
> Is it possible to change the PV status to available and how would I do so?

As mentioned: you need to have actual metadata backups which you can only
get in your case, if you downgrade, replace the broken PV, vgcfgrestore
the metadata from the old backup and upgrade the LVM software again.
Maybe you still have the old LVM version you used before on some recovery media?

After the upgrade, you should create a dummy LV
with 1 LE size and remove it, which will create the UUIDs in the VGDA.

Please remember to take backups of /etc/lvmconf!

> 
> Is there anything I can do to restore the data present on the harddrive?
> That would be really great.

See above.

> 
> 
> --
> Volker Jahns, Volker.Jahns@dpma.de
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
