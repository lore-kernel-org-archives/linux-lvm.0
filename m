From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] Sharing Logical Volumes via NFS on Redhat 8.0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030218223007.HIJG12463.imf25bis.bellsouth.net@tiger2>
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
Date: Tue Feb 18 16:28:13 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

DJ,

Truly sharing LVs requires a FileSystem that understands shared physical drives =
(often called a Cluster File System of CFS).  Or you must have someway to =
enforce that only one computer (node) at a time owns the LV (i.e. often used in =
High Availability Clusters).

For instance, with the OpenGFS CFS you can take a drive put it into a firewire =
chassis, then connect the firewire to 2 computers.

Now run OpenGFS on both computers and it will allow both computers direct =
firewire access to the drive.  (It takes a lot of cache coherency programming =
to make this work.)

Once you have that, you can export the OpenGFS FS via either Samba or NFS.

Unfortunately, OpenGFS does not work with LVM.  (Sistina sells GFS, but I don't =
know if it talks to LVM either.)

There is discussion that OpenGFS sub-package "pool" should be replaced with =
Data Mapper. I hope they do that, because the OpenGFS pool driver does not =
support software RAID, and a disk failure is not survivable unless you have =
hardware RAID.  If they were using Data Mapper, in theory a shared software =
RAID array could be setup.

Also, the EVMS project (from IBM) is working on userland admin tools for data =
mapper that will allow LVs on shared disks to be administered from either node. =
 i.e. cluster enabled.

The EVMS project is assuming you have the soon to be release Heartbeat 1.0.1 =
package installed and an operational cluster setup.

I don't know the details, but I_hope_ the EVMS cluster support will include a =
way to enforce exclusive ownership of the shared LV until a failover occurs.

Greg Freemyer

 >>  (repost):

 >>  Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from
 >> =20
 >>  another machine while already having a LV on the same machine. Is it ok or
 >> =20
 >>  not ok? I was talking to a buddy and he doesn't think it's a problem or an
 >> =20
 >>  issue but...

 >>  the current documentation on Sistina's site states that sharing LV's is=20
 >>  dangerous unless it's a SCSI or Fibre Storage Device?...and not only that=20
 >>  ...adminisitration can only be done on one node? (is it really possible to
 >> =20
 >>  create/resize lv's from one node/machine to another (that has an LV or was
 >> =20
 >>  it meant to mean that it's only possible on cluster aware network storage=20
 >>  devices)??? ....

 >>  http://tldp.org/HOWTO/LVM-HOWTO/x1232.html
 >>  under "Dangerous Operations - Sharing Logical LVM Volumes"

 >>  ie.

 >>  >If you need to do any changes to the LVM metadata (regardless of >whether
 >> =20
 >>  >it affects volumes mounted on other nodes) you must go through >the=20
 >>  >following sequence. In the steps below ``admin node'' is any >arbirarily=20
 >>  >chosen node in the cluster. Admin node                   >Other nodes
 >>  >----------                   -----------
 >>  >                             Close all Logical volumes (umount)
 >>  >                             vgchange -an
 >>  ><make changes, eg lvextend>
 >>  >                             vgscan
 >>  >                             vgchange -ay

 >>  I'm thinking that it might not be a good idea to try to do maintenance on
 >>  a=20
 >>  LV that is mounted on another system...but i think it makes a whole heck
 >>  of=20
 >>  alot of sense to create/resize/mount an LV on a system before trying to=20
 >>  mount it via an NFS share. :)

 >>  Any comments? I personally don't think it would be an issue either (to
 >>  mount=20
 >>  an LV on another box/system via an NFS mount) but i'd rather not take the=20
 >>  chance of messing up any of the data on those LV's cuz their stuffed :)

 >>  Oh one other thing...if it has been proven that a Redhat 8.0 2.4-24?.x=20
 >>  kernel can be patched to LVM 1.0.6+ ....will the data on those LV's be=20
 >>  affected in any way or will it all be ok? :)







 >>  _________________________________________________________________
 >>  MSN 8 with e-mail virus protection service: 2 months FREE* =20
 >>  http://join.msn.com/?page=3Dfeatures/virus


 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
