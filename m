From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] one PV crashed
Message-Id: <20020201111151.B15491@sistina.com>
References: <878zad8qrx.fsf@papadoc.bayour.com>
MIME-Version: 1.0
In-Reply-To: <878zad8qrx.fsf@papadoc.bayour.com>; from turbo@bayour.com on
    Fri, Feb 01, 2002 at 11:01:22AM +0100
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
Date: Fri Feb  1 04:16:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 01, 2002 at 11:01:22AM +0100, Turbo Fredriksson wrote:
> I have (had) 6 PV's in my VG. The last one crashed (the whole disk
> seems to have broken totaly).
> 
> It don't seem possible to restore the information (not without spending
> $$$ to a data recovery company), so how do I get the data stored on the
> OTHER disks?

You don't spend a single dollar :-)


There's 2 solutions:

A:
--

Buy a replacemeent drive (say /dev/sdg1 ;-) and run

fdisk # to partition it the same way the broken one was
pvcreate /dev/sdg1
vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/sdg1
vgscan


B:
--

If you don't have a replacement drive at hand you can even be faster by
faking one (you must have loop configured in the kernel and use LVM 1.0.2):

dd if=/dev/zero of=/tmp/my_sdg1.vgda bs=1k count=512
losetup /dev/loop0 /tmp/my_sdg1.vgda
pvcreate /dev/loop0
vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /devloop0
vgscan


After either of the above aproaches you need to lvreduce/lvremove those
LVs which had extents allocated on the failed drive.

You can figure out which those are by

pvdisplay -v /dev/sdg1

- or -

pvdisplay -v /dev/loop0

respectively.

If you had a replacement drive (case A), you can continue to use it because
it will jsut be an empty PV which belonngs to your VG after the
lvreduce/lvremove runs recommended above.

If you used the loop0 fake (case B) run

vgreduce vg1 /dev/loop0
losetup -d /dev/loop0
rm /tmp/my_sdg1.vgda


Hope that helps :-)

Regards,
Heinz    -- The LVM Guy --

> 
> 
> [papadoc.root]# pvscan -u
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk" of VG "vg1" [5.87 GB / 0 free]
> pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66" of VG "vg1" [1004.00 MB / 0 free]
> pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH" of VG "vg1" [2.37 GB / 0 free]
> pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK" of VG "vg1" [8.50 GB / 0 free]
> pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2" of VG "vg1" [17.09 GB / 0 free]
> pvscan -- total: 5 [34.84 GB] / in use: 5 [34.84 GB] / in no VG: 0 [0]
> [papadoc.root]# /etc/init.d/lvm start
> Setting up LVM Volume Groups...
> vgchange -- ERROR: physical volume "/dev/sdg1" of volume group "vg1" is offline
> vgchange -- run vgscan
> [papadoc.root]# vgscan 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> [papadoc.root]# pvscan -u
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2"  is associated to an unknown VG (run vgscan)
> pvscan -- total: 5 [34.84 GB] / in use: 5 [34.84 GB] / in no VG: 0 [0]
> 
> 
> This was the info the sg1 disk had:
> PV#     PV Name    VG Name PV UUID                                 PV Size
> 6       /dev/sdg1  vg1     7x1CdK-50u6-NAmJ-6bHY-Ho09-U3hC-K7c18w  15.55 GB 0 free
> 
> World Trade Center FSF spy Nazi terrorist supercomputer cryptographic
> toluene [Hello to all my fans in domestic surveillance] assassination
> counter-intelligence Ft. Bragg subway Rule Psix security
> [See http://www.aclu.org/echelonwatch/index.html for more about this]
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
