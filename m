From: Turbo Fredriksson <turbo@bayour.com>
Message-Id: <878zad8qrx.fsf@papadoc.bayour.com>
MIME-Version: 1.0
Subject: [linux-lvm] one PV crashed
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
Date: Fri Feb  1 04:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have (had) 6 PV's in my VG. The last one crashed (the whole disk
seems to have broken totaly).

It don't seem possible to restore the information (not without spending
$$$ to a data recovery company), so how do I get the data stored on the
OTHER disks?


[papadoc.root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk" of VG "vg1" [5.87 GB / 0 free]
pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66" of VG "vg1" [1004.00 MB / 0 free]
pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH" of VG "vg1" [2.37 GB / 0 free]
pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK" of VG "vg1" [8.50 GB / 0 free]
pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2" of VG "vg1" [17.09 GB / 0 free]
pvscan -- total: 5 [34.84 GB] / in use: 5 [34.84 GB] / in no VG: 0 [0]
[papadoc.root]# /etc/init.d/lvm start
Setting up LVM Volume Groups...
vgchange -- ERROR: physical volume "/dev/sdg1" of volume group "vg1" is offline
vgchange -- run vgscan
[papadoc.root]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group
[papadoc.root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2"  is associated to an unknown VG (run vgscan)
pvscan -- total: 5 [34.84 GB] / in use: 5 [34.84 GB] / in no VG: 0 [0]


This was the info the sg1 disk had:
PV#     PV Name    VG Name PV UUID                                 PV Size
6       /dev/sdg1  vg1     7x1CdK-50u6-NAmJ-6bHY-Ho09-U3hC-K7c18w  15.55 GB 0 free

World Trade Center FSF spy Nazi terrorist supercomputer cryptographic
toluene [Hello to all my fans in domestic surveillance] assassination
counter-intelligence Ft. Bragg subway Rule Psix security
[See http://www.aclu.org/echelonwatch/index.html for more about this]
