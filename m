From: Turbo Fredriksson <turbo@bayour.com>
Message-ID: <87wutolm26.fsf@papadoc.bayour.com>
MIME-Version: 1.0
Subject: [linux-lvm] ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg1" from physical volume(s)
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
Date: Tue May 28 10:26:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Here we go again... Second or third time I lost my LVM... :(
What's wrong this time?

----- s n i p -----
[papadoc.root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg1" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

[papadoc.root]# vgchange -a y
vgchange -- no volume groups found

[papadoc.root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk"  is associated to unknown VG "vg1" (run vgscan)
pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66"  is associated to unknown VG "vg1" (run vgscan)
pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH"  is associated to unknown VG "vg1" (run vgscan)
pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK"  is associated to unknown VG "vg1" (run vgscan)
pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2"  is associated to unknown VG "vg1" (run vgscan)
pvscan -- total: 5 [34.84 GB] / in use: 5 [34.84 GB] / in no VG: 0 [0]
----- s n i p -----
-- 
ammonium assassination supercomputer $400 million in gold bullion DES
jihad Iran kibo Peking pits killed ammunition Marxist 767 subway
[See http://www.aclu.org/echelonwatch/index.html for more about this]
