From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] need to restore corrupted VG, help needed!
Message-ID: <20021112132009.A29161@sistina.com>
References: <20021111225402.29940.1223.Mailman@hermes.sistina.com> <52541.195.212.29.226.1037092283.squirrel@webmail.nnm.ee>
Mime-Version: 1.0
In-Reply-To: <52541.195.212.29.226.1037092283.squirrel@webmail.nnm.ee>; from liivo@nnm.ee on Tue, Nov 12, 2002 at 11:11:23AM +0200
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
Date: Tue Nov 12 06:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Liivo,
pvdata shows that you had _two_ physical volumes in your volume group before
and that "vg" is exported?

Why is it exported when your other drive crashed and where's the other
physical volume belonging to "vg"? Was it eventually on the dead drive?
In that case it is pretty unlikely that you can retrieve a lot of your logical
volume date anyways. Even if you replace that drive, you won't get that data
back which went down the drain woth it.

If you don't find the other physical volume with "pvscan -u" (look for
UUID Zy48rM-UOIi-0gP7-TvjK-apfK-4oJ1-0rvV2b) and 
if my assumptions are correct you want to go for a restore.
Hopefully you've got a recent backup.

Regards,
Heinz    -- The LVM Guy --


On Tue, Nov 12, 2002 at 11:11:23AM +0200, Liivo Liivrand wrote:
> Hello All!
> 
> I had a disk crash on my system and now I need to have my VG back, but
> how? I had two HDDs, one containing root partition and one with LVM. HDD
> with root partition crashed and backup was too old to restore :-( Now I
> installed new system (RedHat 8.0) and need urgently to have my files from
> old LVs, but I can't. Please help me! Look down, I think that problem is
> in PV#, but how can I change it?
> 
> Output follows:
> --- Cut ---
> # fdisk -l /dev/hde
> 
> Disk /dev/hde: 16 heads, 63 sectors, 79780 cylinders
> Units = cylinders of 1008 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hde1   *         1       203    102280+  fd  Linux raid autodetect
> /dev/hde2           204      1243    524160   8e  Linux LVM
> /dev/hde3          1244      1446    102312   fd  Linux raid autodetect
> /dev/hde4          1447     79780  39480336   85  Linux extended
> /dev/hde5          1447     79780  39480304+  8e  Linux LVM
> 
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "sys"
> vgscan -- found exported volume group "vgPV_EXP"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "vg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> # vgimport -f vg /dev/hde5
> vgimport -- ERROR: wrong number of physical volumes to import volume group
> "vg"
> 
> # pvdisplay /dev/hde5
> --- Physical volume ---
> PV Name               /dev/hde5
> VG Name               vg
> PV Size               37.65 GB [78960609 secs] / NOT usable 4.18 MB [LVM:
> 161 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              9637
> Free PE               9637
> Allocated PE          0
> PV UUID               7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp
> 
> # pvdata -v /dev/hde5
> --- Physical volume ---
> PV Name               /dev/hde5
> VG Name               vg
> PV Size               37.65 GB [78960609 secs] / NOT usable 4.18 MB [LVM:
> 161 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              9637
> Free PE               9637
> Allocated PE          0
> PV UUID               7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp
> 
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                11
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                2
> Act PV                2
> VG Size               75.29 GB
> PE Size               4 MB
> Total PE              19274
> Alloc PE / Size       9583 / 37.43 GB
> Free  PE / Size       9691 / 37.86 GB

<SNIP>

> pvdata -- logical volume struct at offset 254 is empty
> --- List of physical volume UUIDs ---
> 
> 001: Zy48rM-UOIi-0gP7-TvjK-apfK-4oJ1-0rvV2b
> 002: 7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp
> 
> --- Cut ---
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
