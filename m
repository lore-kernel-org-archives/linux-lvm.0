Message-ID: <006001c32661$b055c4c0$e0bba5cc@patni.com>
From: "Sameer Halgatti" <sameer.halgatti@patni.com>
References: <23233866A70C32479532C8D0B8AE7B96032AAC5E@i2km07-ukbr.domain1.systemhost.net>
Subject: Re: [linux-lvm] help needed
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu May 29 23:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: narsimha.kulkarni@bt.com

hi narsimha,
If u want to completely remove ur PV (i.e. if u want to lose ur data) then
there is a very simple way to get rid of this problem. Just do following....
dd of=/dev/hda3                  ......hda3 becuse ur PV resides on that
<enter approx 50 chars>
<press cntrl+d>

Of course it not the recommend solution, but it will solve ur problem :-)
Actually ur VGDA data on the disk may be corrupted, that's why u r getting
this error message.
When u create a PV/VG, some data is written on the disk (on some initial
disk blocks). So if u erase that by doing 'dd', then u can create fresh
PV/VG using that disk.


----- Original Message -----
From: <narsimha.kulkarni@bt.com>
To: <linux-lvm@sistina.com>
Sent: Thursday, May 29, 2003 8:03 PM
Subject: [linux-lvm] help needed


> hi following is the log of the commands....
> i want to remove the volume group completely....
> or i want to restore it....
>
> how do i do it
>
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "helena_vg"
> vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume
> group)
> vgscan -- found active volume group "volg"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
>
> vgremove -- ERROR: can't remove active volume group "helena_vg"
>
>
> vgcfgrestore -- locking logical volume manager
> vgcfgrestore -- restoring volume group "helena_vg" from
> "/etc/lvmconf/helena_vg.conf"
> vgcfgrestore -- checking existence of "/etc/lvmconf/helena_vg.conf"
> vgcfgrestore -- "/etc/lvmconf/helena_vg.conf" doesn't exist
> vgcfgrestore -- a backup for volume group helena_vg is not available
>
>
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
> vgscan)
> pvscan -- ACTIVE   PV "/dev/hdb1" of VG "volg"      [31.48 GB / 31.48 GB
> free]
> pvscan -- total: 2 [39.08 GB] / in use: 2 [39.08 GB] / in no VG: 0 [0]
>
> pvchange -- locking logical volume manager
> pvchange -- reading physical volume data /dev/hda3 from disk
> pvchange -- checking physical volume "/dev/hda3" consistency
> pvchange -- finding volume group of physical volume "/dev/hda3"
> pvchange -- unable to find volume group of "/dev/hda3" (VG not active?)
> pvchange -- unlocking logical volume manager
> pvchange -- 0 physical volumes changed / 0 physical volumes already o.k.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
