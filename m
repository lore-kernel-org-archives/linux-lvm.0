From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Summary - Snapshot Effort
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020904192446.WBJT14662.imf17bis.bellsouth.net@TAZ2>
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
Date: Wed Sep  4 14:23:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  On Mon, Aug 26, 2002 at 03:10:51PM -0400, Greg Freemyer wrote:
 >>  >  >>  On Thu, Aug 22, 2002 at 05:43:42PM -0400, Greg Freemyer wrote:
 >>  >  >>  > I have not been successful at getting reliable Read-Only
 >>  snapshots
 >>  >  >>  > of XFS via LVM.  Since XFS is being used in Enterprise quality
 >>  >  >>  > applications, I suggest this is a major shortcoming that should
 >>  be
 >>  >  >>  > prioritized.
 >>  >=20
 >>  >  >>  Have you tried LVM2 ?
 >>  >=20
 >>  >  >>  - Joe
 >>  >=20
 >>  > No I haven't. =20
 >>  >=20
 >>  > Instead of trying a bunch of configs myself, I have decided to write a
 >>  xfs/LVM snapshot regression module to add the xfs test suite. (They don't
 >>  have one currently.)

 >>  Yes, I read that they don't on the list.
 >>  Thanks for this effort.

 >>  >=20
 >>  > Once that is done, I hope that a few different LVM configs can be
 >>  tested. =20

 >>  Could you offer the regression modules and test configs on the LVM and XFS
 >>  lists so that everybody can take advantage?

This test is now in XFS cvs.

Using a current XFS CVS kernel, I have run over 1,000 iterations of the test =
with no errors.

FYI:  Using a xfs cvs kernel from last week, the kernel would lock up after =
just a few iterations. =20
FYI:  Using a SuSE 8.0 kernal (XFS 1.1 release based), lvcreate would lockup =
after a few iterations.

=3D=3D=3D=3D=3D=3D Details
See test 068 at =
http://oss.sgi.com/cgi-bin/cvsweb.cgi/linux-2.4-xfs/cmd/xfstests/

It uses the fsstress executable that can be found at

http://oss.sgi.com/cgi-bin/cvsweb.cgi/linux-2.4-xfs/cmd/xfstests/src/

It assumes there is a subdirectory of where it is run that has the fsstress =
executable in it.  i.e. ./src/fsstress must exist.

It currently assumes you have an existing VG (LVscratch) and that you have an =
existing LV (scratch) that you want to run the test against.

It will lvremove the scratch LV at the end of test, so be sure it is truly =
scratch.

I put in logic to have it create the PV, VG, and LV, but this is all untested =
and commented out with a # TODO

It also currently assumes that a few environmental variables are set before it =
is invoked.  This is because the XFS check routine sets them.

If you want to run it standalone, you will find the appropriate variable =
assignments commented out at the beginning of the file.

Last, but now least, this test should be easily modified to test any Linux FS, =
not just XFS.


Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
