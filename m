From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030409222402.BMRV1717.imf25bis.bellsouth.net@tiger2>
Subject: [linux-lvm] snapshot performance question
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
Date: Wed Apr  9 17:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

I currently have a 2 disk raid1 implemented via 3ware hardware raid.

The 3ware card makes the ide drives appear to be SCSI drives to the kernel, so =
SCSI disconnect logic/etc. is supported.

Currently I use unused space on the raid 1 array to hold my snapshot lv.

I also have a standalone ide 80 GB drive in the system with lots of unused =
space (~40GBs).

There are 2 contradictory performance statements that can be made:

1) raid 1 w/3ware should be much faster than a JBOD ide.

2) snapshots hosted on a separate physical media are faster.

Is this a clear cut case of moving my snapshot lv to the ide drive would be =
faster, or do I need to do performance testing to be sure?

Greg
--=20
Greg Freemyer =20
