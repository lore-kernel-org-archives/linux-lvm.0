From: d.levitin@gmx.de
MIME-Version: 1.0
Message-ID: <9732.1028372252@www42.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group
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
Date: Sat Aug  3 05:56:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hello,
I have a problem with my vg00 - the LVM doesn't have it any more. I found
such postings in the list archive, but I don't want to restore - as I think.
To the problem: 
I had 10 disks in my Computer (/dev/sda.../dev/sdj) in the vg00. Then I have
2 of them (/dev/sdj and /dev/sdi) unplugged. I hoped it would be no problem
for the LVM to work with the rest 8, but it doesn't do. I dont' worry about
the volumes on the sdi and sdj, but the other volumes are a problem...
So why the LVM dosn't see the other disks as well?

Thanks a lot for your help
Dmitri
 

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data
of volume group "vg00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume group

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda4"  is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdb3"  is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdc"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdd"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sde"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdf"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdg"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- inactive PV "/dev/sdh"   is associated to unknown VG "vg00"
(run vgscan)
pvscan -- total: 8 [200.21 GB] / in use: 8 [200.21 GB] / in no VG: 0
[0]


-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
