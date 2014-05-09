Message-ID: <536CC710.4030708@redhat.com>
Date: Fri, 09 May 2014 14:16:16 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <20140508104546.GA610@feynman.spatium.org>
In-Reply-To: <20140508104546.GA610@feynman.spatium.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] No device found for PV but is actually fine
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Peter Rajnoha <prajnoha@redhat.com>, lvm@spatium.org

On 05/08/2014 12:45 PM, Michal Svoboda wrote:
> Hi all,
>
> I have a weird issue:
>
> # pvs
>   No device found for PV JszGc1-S16s-bsFQ-weAl-aj8W-d6y4-BeVqcN.
>   PV         VG    Fmt  Attr PSize   PFree
>   /dev/sdc   data2 lvm2 a--  298.09g    0
>   /dev/sdd1  data  lvm2 a--  298.09g    0
>
> # pvscan
>    No device found for PV JszGc1-S16s-bsFQ-weAl-aj8W-d6y4-BeVqcN.
>    No device found for PV JszGc1-S16s-bsFQ-weAl-aj8W-d6y4-BeVqcN.
>    PV /dev/sdc    VG data2   lvm2 [298.09 GiB / 0    free]
>    PV /dev/sdd1   VG data    lvm2 [298.09 GiB / 0    free]
>    Total: 2 [596.18 GiB] / in use: 2 [596.18 GiB] / in no VG: 0 [0   ]
>
> # pvscan --cache
>    Found duplicate PV JszGc1S16sbsFQweAlaj8Wd6y4BeVqcN: using /dev/sde2 not /dev/md0
>    Found duplicate PV JszGc1S16sbsFQweAlaj8Wd6y4BeVqcN: using /dev/sdf2 not /dev/sde2


Peter, is this an error in LVM filtering or is manual filter 
modification required?

Michal(-e), I suggest modifying global_filter to accept only the devices 
you want in the VG.

-- Martian

>
> The VG on the "missing" PV is called "system", but:
>
> # vgdisplay /dev/system
>    No device found for PV JszGc1-S16s-bsFQ-weAl-aj8W-d6y4-BeVqcN.
>    --- Volume group ---
>    VG Name               system
>    System ID
>    Format                lvm2
>    Metadata Areas        0
>    Metadata Sequence No  28
>    VG Access             read/write
>    VG Status             resizable
>    MAX LV                0
>    Cur LV                8
>    Open LV               8
>    Max PV                0
>    Cur PV                1
>    Act PV                0
>    VG Size               232.88 GiB
>    PE Size               4.00 MiB
>    Total PE              59616
>    Alloc PE / Size       33792 / 132.00 GiB
>    Free  PE / Size       25824 / 100.88 GiB
>    VG UUID               fQoJ8p-BI3D-BcEH-BiQX-JJqf-p6TT-6KIoRt
>
> Actually all LVs on the "system" VG are present and accounted for. The
> LVs contain the root file system, and some virtual machine drives, all
> of which are running *fine* (and the system in fact boots up from the
> "missing" PV :). But I can't resize:
>
> # lvextend -L +16G /dev/system/vm-monitor
>    No device found for PV JszGc1-S16s-bsFQ-weAl-aj8W-d6y4-BeVqcN.
>    Cannot change VG system while PVs are missing.
>    Consider vgreduce --removemissing.
>
> The "system" VG is situated on a md raid1. I think it all happened after
> I replaced all the drives of that md with mdadm --replace with bigger
> disks. But I can't be sure, because the system in fact works and except
> the inability to resize there are no problems.
>
> I have googled around a bit, but to no avail. Can someone help me
> diagnose and repair this?
>
> Version info:
>
> # pvs --version
>    LVM version:     2.02.105(2) (2014-01-20)
>    Library version: 1.02.84 (2014-01-20)
>    Driver version:  4.27.0
>
> # cat /proc/version
> Linux version 3.14.0-4-ARCH (nobody@var-lib-archbuild-extra-x86_64-thomas) (gcc version 4.8.2 20140206 (prerelease) (GCC) ) #1 SMP PREEMPT Wed Apr 9 21:11:25 CEST 2014
>
>
> Thanks,
> Michal Svoboda
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
