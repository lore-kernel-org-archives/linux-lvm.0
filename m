From: Peter Palfrader <peter@palfrader.org>
Subject: Re: [linux-lvm] PV#s are not unique
Message-ID: <20011214051016.GA746@marvin.palfrader.org>
References: <20011208170737.GA15685@marvin.palfrader.org> <20011211123626.C27568@sistina.com> <20011211182356.GA864@marvin.palfrader.org> <20011212091557.C629@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011212091557.C629@sistina.com>
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
Date: Thu Dec 13 23:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

On Wed, 12 Dec 2001, Heinz J . Mauelshagen wrote:

> > I think of trying to restore the metadata on all PVs using vgcfgrestore
> > since I have a few copies of vg_stuff.conf in /etc/lvmconf.  Would this
> > be a stupid idea?
> 
> No, not at all. This is actually the recommended wayx to restore a messy VG ;-)
> You need to run "pvcreate -ff" on all of the (former) PVs and vgcfgrestore on
> each of them afterwards.

Done that. Didn't help.

for PV in PVs.... pvscreate -ff
for PV in PVs.... vgcfgrestore

marvin:~/recover/backup# pvscan 
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/scsi/host0/bus0/target3/lun0/part2" of VG "vg_system" [8.25 GB / 512.00 MB free]
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1"  of VG "vg_stuff"  [76.31 GB / 0 free]
pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1"  of VG "vg_stuff"  [76.28 GB / 0 free]
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1"  of VG "vg_stuff"  [76.28 GB / 0 free]
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1"  of VG "vg_stuff"  [38.31 GB / 38.31 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1"  of VG "vg_stuff"  [57.22 GB / 56.50 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"  of VG "vg_stuff"  [57.22 GB / 57.22 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"  of VG "vg_stuff"  [38.34 GB / 352.00 MB free]
pvscan -- total: 8 [428.54 GB] / in use: 8 [428.54 GB] / in no VG: 0 [0]

marvin:~/recover/backup# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg_system"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

marvin:~/recover/backup# pvscan 
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/scsi/host0/bus0/target3/lun0/part2" of VG "vg_system" [8.25 GB / 512.00 MB free]
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- total: 8 [428.54 GB] / in use: 8 [428.54 GB] / in no VG: 0 [0]


[upgraded tools and kernel to 1.0.1 (formally 1.0.1rc4)]


Some other idea?

> Could you save your VG's metadata before by running
> 
> for PV in YOurPVs
>    do dd if=/dev/$PV of=VGDA.${VGName}.$PV bs=1k count=512
> done
> 
> and storing the copies on tape or something so that we are able to backup
> for potential further investigation?

I put them up at http://www.palfrader.org/~weasel/palfrader-lvm.tar.gz
if you want to fetch it.

					yours,
					peter

-- 
 PGP signed and encrypted  |  .''`.  ** Debian GNU/Linux **
    messages preferred.    | : :' :      The  universal
                           | `. `'      Operating System
 http://www.palfrader.org/ |   `-    http://www.debian.org/
