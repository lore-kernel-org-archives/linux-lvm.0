Message-ID: <909EA7234316394F80BBB70A85A1EB389609C8@hermes.dimac.net>
From: "Conny Brunnkvist / dimac.net" <conny@dimac.net>
Subject: RE: [linux-lvm] success report 2.4.10 + 1.0.1-rc2 + diff
Date: Mon, 1 Oct 2001 09:43:27 +0200 
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I tried the exact same approach, except having earlier (at v1.0) run
pvversion and converted to v2 metadata as I was upgrading from 0.9.x betaY.

But it did NOT work properly for me. Compiles OK, but after a reboot vgscan
fails:
 ERROR "pv_read_pe(): PV size invalid" can't get data of volume groups "vg0"
from physical volumes.

I really can't afford to loose my vg, so I'm sort of desperate for a
solution right now. Btw, going back to my old kernel version (2.4.4) didn't
help, either. 911!


> and possibly a couple manual edits to lvm-*.c;

"Possibly" - what does that mean? You don't remember?! :)

//conny

> -----Original Message-----
> From: Jim Cromie [mailto:jcromie@divsol.com]
> Sent: den 28 september 2001 08:15
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] success report 2.4.10 + 1.0.1-rc2 + diff
> 
> 
> fwiw,
> 
> Im pleased to report success using linux-2.4.10, LVM-1.0.1-rc2,
> and this patch: 
> http://incandescent.mp3revolution.net/lvm/inline_fix.diff
> on a basically stock RH-7.1 installation.
> 
> I made 1 minor patch to /etc/rc.d/rc.sysinit, probably theres a better
> way..
> 
> + # LVM initialization
> + action "loading LVM:" /sbin/insmod lvm-mod
> if [ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
>         action $"Setting up LVM:" /sbin/vgscan && /sbin/vgchange -a y
> fi
> 
> and possibly a couple manual edits to lvm-*.c;
> min(z,x,y) -> min(x,y), max() too
> 
> so now, bootup works, and shows results as follows
> 
> [jimc@groucho jimc]$ df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> ...
> /dev/hdc5              4031656   3762168     64692  99% /home
> /dev/_vgb/vl_tmp        495844        24    470220   1% /tmp
> /dev/_vgb/vl_t2        1511856    326156   1108900  23% /mnt/new
> 
> [root@groucho /root]# vgdisplay
> --- Volume group ---
> VG Name               _vgb
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                2
> Open LV               2
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                1
> Act PV                1
> VG Size               9.36 GB
> PE Size               4.00 MB
> Total PE              2397
> Alloc PE / Size       500 / 1.95 GB
> Free  PE / Size       1897 / 7.41 GB
> VG UUID               6w4vI8-x2Qp-rqFg-soa6-eYOF-2Uwp-8sB7z8
> 
> [root@groucho /root]# lvdisplay /dev/_vgb/vl_t*
> --- Logical volume ---
> LV Name                /dev/_vgb/vl_t2
> VG Name                _vgb
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                1.46 GB
> Current LE             375
> Allocated LE           375
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> --- Logical volume ---
> LV Name                /dev/_vgb/vl_tmp
> VG Name                _vgb
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                500.00 MB
> Current LE             125
> Allocated LE           125
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
> 
> 
> 
> the only hitch I had configing was using lvrename, vgrename;
> IIRC. I had to mv the /dev/_vgb special files myself,
> causing a couple of fstab-umount-reboot-to-single
> sessions to clean up errs.  I used the 2nd cmd-form,
> "vgrename vg02 my_volume_group", if that matters.
> 
> 
> Perhaps a FAQ entry explaining what I may have mis-understood:
> 
> {lv,vg} rename dont change names of /dev/ special-files,
> nor corresponding entries in /etc/fstab.  You must manually 
> edit your mount
> points.
> 
> 
> looking forward, I plan to fix the problem with 99% on /home
> 
> thanks for great software.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
