From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] LVM & LFS support
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030513201453.UJUM4718.imf39bis.bellsouth.net@tiger2>
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
Date: Tue May 13 15:12:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  On Tuesday, 13 May 2003, at 08:47:58 +0200,
 >>  Jon Bendtsen wrote:

 >>  > Other than not being larger than the blockdevice, and doesnt the
 >>  > blockdevice has a limit of 2T ?
 >>  >=20
 >>  Your are right. There has been native support for huge (huge is large than
 >>  large :) block devices in 2.5.x for some time, and I think there is also
 >>  a backport to 2.4.x (I suppose main Linux distributors have some sort of
 >>  support for huge block devices, at least on their latest business-grade
 >>  offerings).

XFS has a couple 2.4.x LBD (Large Block Device) patches available on their ftp =
site.

ftp://oss.sgi.com/projects/xfs/download/patches/weekly-snapshot-patch/

I'm pretty sure they just have them there for convenience.  I don't know where =
the official source is.

I have never used, them nor do I know any specifics.

Greg
--=20
Greg Freemyer
