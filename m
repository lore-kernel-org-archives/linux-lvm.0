From: Erkki Seppala <flux-lvm@inside.org>
Message-Id: <20020223015504.GA828@xulfad.ton.tut.fi>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] bug: raid1 sub-devices are scanned too
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
Date: Fri Feb 22 19:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Whether the bugzilla is publicly open is unclear to me, atleast there
didn't seem to be a link there in sistina.com/lvm - or I didn't find
it.

Actually I'm not sure if there is a real reason to fix this, as it
would need making vgscan understand more about the raid-stuff, but it
sure does look confusing. Perhaps a generic facility to "blind out"
devices from it? Perhaps this kind of capability should be in the
kernel, not just for LVM..

I recently had a problem with a volume group reusing an existing
logical volume number, but I resolved that, as vgscan suggested, with
vgexport/vgimport. However, this bug appeared:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "mirror"
vgscan -- found active volume group "ibm9"
vgscan -- found active volume group "archive"
vgscan -- found inactive volume group "mirrorPV_EXP"
vgscan -- ERROR: VG "mirrorPV_EXP" reuses an existing VG number; please vgexport/vgimport that VG or use option -f
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

I imagine this is because /dev/md/1 is raid1 and consists of
/dev/ide/host0/bus1/target1/lun0/part1 and
/dev/ide/host0/bus0/target1/lun0/part1. Output of pvscan:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md/1"                               of VG "mirror"       [55.91 GB / 13.89 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"   is in EXPORTED VG "mirror" [55.91 GB / 13.89 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"   is in EXPORTED VG "mirror" [55.91 GB / 13.89 GB free]
pvscan -- total: 6 [311.82 GB] / in use: 5 [290.79 GB] / in no VG: 1 [21.03 GB]

(some lines removed)

I run kernel 2.4.16 and LVM-tools from today's CVS.

Btw, during the original repairing I saw a situation where one of my
volume groups (archive) was twice in /proc/lvm/global. That's not
healthy, is it? I imagine it had something to do with the fact that
after scanning volume group "archive" it failed to scan volume group
"mirror" (due to the reuse-problem), and I kept trying different
stuff..
 
--
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
