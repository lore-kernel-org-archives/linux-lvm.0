From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm problem
Message-Id: <20020115125319.A11005@sistina.com>
References: <OF5335B286.82ADE051-ONC1256B41.004E7A11@hpigmbh.com>
MIME-Version: 1.0
In-Reply-To: <OF5335B286.82ADE051-ONC1256B41.004E7A11@hpigmbh.com>;
    from Matthias.Stoll@eu.icgcommerce.com on Mon, Jan 14, 2002 at 03:21:39PM
    +0100
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
Date: Tue Jan 15 05:56:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 14, 2002 at 03:21:39PM +0100, Matthias Stoll wrote:
> Hi !
> 
> I'm not so firm in linux but:
> 
> We had a LG "smbdata" which went away somehow? ;-)

Hi Matthias.

What does 'somehow' mean? ;-)

LVM/Operator error? I know: in case of an operator error I wouldn't tell
anybody either ;-)

> 
> Searched all threads and followed your instructions on recovering 
> configuration of LV. Didn't work ;-(
> 
> Here is the output of vgcfgrestore -ll -f /etc/lvmconf/smbdata.conf.7.old 
> -n smbdata /dev/sda
> 
> --- Volume group ---
> VG Name               smbdata
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               15.86 GB
> PE Size               4 MB
> Total PE              4060
> Alloc PE / Size       4060 / 15.86 GB
> Free  PE / Size       0 / 0
> VG UUID               zwceZi-TCXm-Ew3a-A5yc-H49M-R1NP-y4qg4T
> 
> --- Logical volume ---
> LV Name                /dev/smbdata/all
> VG Name                smbdata
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                15.86 GB
> Current LE             4060
> Allocated LE           4060
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> 
> --- Physical volume ---
> PV Name               /dev/sda1
> VG Name               smbdata
> PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1015
> Free PE               0
> Allocated PE          1015
> PV UUID               tFA0qy-8u7r-8oBv-MwYS-SUVM-1W7h-P3hHED
> 
> --- Physical volume ---
> PV Name               /dev/sdb1
> VG Name               smbdata
> PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1015
> Free PE               0
> Allocated PE          1015
> PV UUID               cVeBuv-1i2C-hkOO-mUA1-lNrj-Vh8l-vrr6Am
> 
> --- Physical volume ---
> PV Name               /dev/sdc1
> VG Name               smbdata
> PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
> PV#                   3
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1015
> Free PE               0
> Allocated PE          1015
> PV UUID               Rtuhx3-0HR9-V0hN-iLuZ-dkFL-hyih-cEwEII
> 
> --- Physical volume ---
> PV Name               /dev/sdd1
> VG Name               smbdata
> PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
> PV#                   4
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1015
> Free PE               0
> Allocated PE          1015
> PV UUID               HNkTzu-Ok46-4vqM-CJCu-Iqd1-JmQ4-c5yzea
> 
> 
> Could anyone provide me some help?

Please run:


# save your LVM metadata for later use
for d in /dev/sd[a-d]1; do
   dd if=$d of=$d.VGDA count=512 bs=1k
done

# to recreate your PVs because vgcfgrestore needs that
pvcreate -ff /dev/sd[a-d]1

# restore the metadata from backup
for d in /dev/sd[a-d]1; do
   vgcfgrestore -n smbdata -f /etc/lvmconf/smbdata.conf.7.old /dev/$d
done

# scan in the metadata
vgscan

# activate the VG
vgchange -ay smbdata

> 
> Thanx
> 
> Matthias
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
