From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] iSCSI and LVM
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030513144518.CGIJ8294.imf58bis.bellsouth.net@tiger2>
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
Date: Tue May 13 09:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  Hi,
 >>      Is anyone on this list familiar with iSCSI? I was wondering if
 >>  it'd be possible to setup a Logical Volume as an iSCSI target and export
 >>  it over an IP network for other clients to use. I'm interested in
 >>  setting up an IP SAN, where the storage devices are logical volumes
 >>  managed by LVM. There's this company called SANRAD that makes a hardware
 >>  device called an iSCSI switch. The iSCSI switch is connected to a pool
 >>  of storage disks on the back-end and to a bunch of servers on the
 >>  front-end. It uses logical volume management to carve out logical disks
 >>  from the back-end storage disks, then exports these using iSCSI to the
 >>  front-end servers. (Check out their website http://www.sanrad.com for a
 >>  nice flash movie of this architecture). Anyways, some fellow classmates
 >>  and I are interested in building such an iSCSI switch in software, using
 >>  LVM and other opensource components. Any feedback would be greatly
 >>  appreciated.

 >>  Regards,
 >>  Kai-Min Sung

Ignoring efficiency issues, you should not have any problem putting together a=20
Linux Server with lots of internal disk space, then using LVM to manage that=20
space, and have iSCSI target software share it out to a small collection of =
iSCSI=20
initiators.

FYI: I have only tested iSCSI exporting of partitions, not LVM LVs. =20

I assume you know that iSCSI was formally accepted earlier this year.  I don't=20
know if there is a OSS target and initiator pair available yet or not that =
implements=20
the formal spec.=20

The Intel reference implementation appears not to have been updated yet:
    http://sourceforge.net/projects/intel-iscsi

From my testing of the earlier rev levels (v8, v12, v16) there is not much =
vendor=20
compatibility and definitely there was not rev. level compatibility.

If you care about Win2K, MS is supposed to be releasing a iSCSI initiator =
driver in=20
the summer.  It will meet the formal spec. not the draft releases.

BTW: From an efficiency perspective you should check out iSCSI NICs.  There is =
a=20
lot of TCP/IP overhead associated with iSCSI, and these NICS are designed to =
eliminate=20
that portion of the CPU load.  I have not used them, but I assume the present a =
SCSI=20
interface at the PCI bus level.

FYI2: Snapshots require LV support _and_ FS support.  In what you are =
describing,=20
LVM would provide the LV aspect, but you would need to support only filesystems =
which have a freeze capability.  I use xfs and I know it does.  LV resize would =
also=20
need corresponding FS support.=20

Greg
--=20
Greg Freemyer
