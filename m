Date: Fri, 16 Jun 2000 00:26:06 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] Problems activating VG (2.4.0-test1 / raid 0.9)]
Message-ID: <20000616002606.A9103@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Please provide the stdout/stderr of "vgscan -d" and "vgchange -day" to the list.

Regards,
Heinz

On Thu, Jun 15, 2000 at 09:23:49PM +0200, stk@rmi.de wrote:
> Hello everyone,
> 
> at the moment im experimenting with lvm on top of raid1 (v0.9)
> but ran into a problem with the pv and vg activation. That is
> that I'm able to create md0, a pv on md0 a vg in that pv and
> some lv's in the vg, also no problem with making (reiser) 
> filesystems in the logical volumes. But after a vgchange -a n 
> it is not possible to activate the vg again. pvchange -a y 
> exits with errorcode 0 (wich should be fine) but a vgdisplay -D
> will always report the vg (or pv) as inactive. Nethertheless vgscan 
> is still detecting the volume group.
> 
> Any ideas on this? I have read the documentation and faq, butI may 
> have overlooked something, have I ?
> 
> Hopefully someone can comment on this, attached are (some) of the 
> details, if needed i will provide even more of them :)
> 
> thanx in advance
> Stefan
> 
> 
> Now here are the details:
> 
> Linux 2.4.0-test1 (with reiserfs patch)
> raidtools 0.9
> lvm_0.8final (+ patch2)
> 
> 
> [root@host42 /etc]# pvcreate /dev/md0 -ff
> pvcreate -- really INITIALIZE physical volume "/dev/md0" of volume group "vg01" [y/n]? y
> pvcreate -- WARNING: forcing physical volume creation on "/dev/md0" of volume group "vg01"
> pvcreate -- removing lvmtab entry
> pvcreate -- physical volume "/dev/md0" successfully created
> 
> [root@host42 /etc]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> [root@host42 /etc]# vgcreate vg01 /dev/md0
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- doing automatic backup of volume group "vg01"
> vgcreate -- volume group "vg01" successfully created and activated
> 
> [root@host42 /etc]# vgdisplay 
> --- Volume group ---
> VG Name               vg01
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               18.45 GB
> PE Size               4 MB
> Total PE              4724
> Alloc PE / Size       0 / 0
> Free  PE / Size       4724 / 18.45 GB
> 
> 
> [root@host42 /etc]# cat /proc/lvm 
> LVM module version 0.8final  (15/02/2000)
> 
> Total:  1 VG  1 PV  0 LVs (0 LVs open)
> Global: 3089 bytes malloced   IOP version: 6   0:01:43 active
> 
> VG:  vg01  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 19349504 /4724 total  0 /0 used  19349504 /4724 free
>   PV:  [AA] md0                   19349504 /4724           0 /0       19349504 /4724  
>     LVs: none
> 
> [root@host42 /root]# vgchange -a n 
> vgchange -- volume group "vg01" successfully deactivated
> 
> [root@host42 /root]#  cat /proc/mdstat 
> Personalities : [raid1] 
> read_ahead 1024 sectors
> md0 : active raid1 hdc3[1] hda3[0]
>       19350208 blocks [2/2] [UU]
>       
> unused devices: <none>
> 
> [root@host42 /root]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vg01"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: you may not have an actual VGDA backup of your volume group
> 
> [root@host42 /root]# cat /proc/lvm 
> LVM module version 0.8final  (15/02/2000)
> 
> Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
> Global: 143 bytes malloced   IOP version: 6   0:00:19 active
> 
> 
> [root@host42 /root]# vgchange -a y
> 
> [root@host42 /root]# echo $?
> 0
> 
> [root@host42 /root]# cat /proc/lvm 
> LVM module version 0.8final  (15/02/2000)
> 
> Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
> Global: 143 bytes malloced   IOP version: 6   0:02:58 active
> 
> [root@host42 /root]# vgdisplay -D
> --- Volume group ---
> VG Name               vg01
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               18.45 GB
> PE Size               4 MB
> Total PE              4724
> Alloc PE / Size       0 / 0
> Free  PE / Size       4724 / 18.45 GB
> 
> 
> [root@host42 /root]# pvdisplay /dev/md0
> --- Physical volume ---
> PV Name               /dev/md0
> VG Name               vg01
> PV Size               18.45 GB / NOT usable 704 KB [LVM: 197 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              4724
> Free PE               4724
> Allocated PE          0
> 
> 
> 
> -- 
>  Stefan K                                       email:     stk@rmi.de
>  Aix-la-Chapelle                                fax/data: +49-241-533353

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
