Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <82706A2FAC4D08468A1652B4B7DD0C44CB098F@mx1.bouvet.no>
From: "Kjetil H. Paulsen" <kjetil.paulsen@bouvet.no>
Subject: [linux-lvm] Disk crash - can't remove...
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
Date: Thu Sep 25 15:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

One of the disks in my volume was destroyed, I really don't care about
the data but now I can't remove my volume group.
And I can't add the disks to other volumes either. Tried the UUID fixer,
but no luck :(
Any help appreciated... (using RH9 and LVM 1.0.3)

Pvscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg"  is associated to unknown VG
"stuff_group" (run vgscan)
pvscan -- inactive PV "/dev/hdh" is in no VG  [114.50 GB]
pvscan -- inactive PV "/dev/hde"  is associated to unknown VG
"stuff_group" (run vgscan)
pvscan -- inactive PV "/dev/hdf"  is associated to unknown VG
"stuff_group" (run vgscan)
pvscan -- inactive PV "/dev/hda"  is associated to unknown VG
"stuff_group" (run vgscan)
pvscan -- inactive PV "/dev/hdb"  is associated to unknown VG
"stuff_group" (run vgscan)
pvscan -- total: 6 [296.77 GB] / in use: 5 [182.27 GB] / in no VG: 1
[114.50 GB]

Vgscan:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "stuff_group" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

[root@theone root]# vgchange -a n stuff_group
vgchange -- couldn't  open volume group "stuff_group" group special file
vgchange -- try vgmknodes

[root@theone root]# vgmnodes
-bash: vgmnodes: command not found
[root@theone root]# vgmknodes
vgmknodes -- no volume groups found to create nodes for

[root@theone root]# vgmknodes stuff_group
vgmknodes -- volume group "stuff_group" doesn't exist

[root@theone root]# vgremove stuff_group=20
vgremove -- volume group "stuff_group" doesn't exist


/kjetilhp
