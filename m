From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020822214631.CUZO1228.imf06bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] Summary - Snapshot Effort
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
Date: Thu Aug 22 16:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: xfs mailing list <linux-xfs@oss.sgi.com>
Cc: LVM Mailing list <linux-lvm@sistina.com>

All,

I have not been successful at getting reliable Read-Only snapshots of XFS via =
LVM.  Since XFS is being used in Enterprise quality applications, I suggest =
this is a major shortcoming that should be prioritized.

BTW: Are there any snapshot related tests in the XFS regression tests?

Since my testing is based on XFS V1.1, this may have been resolved in XFS CVS =
code.  My responses from Dale Stephenson imply that there is little in the LVM =
CVS code that would address this.

I believe there is a bug in one of the two products, or more likely it is an =
integration issue between the two.=20

( It would be great in my mind if the future XFS V1.2 release had a specific =
LVM configuration that reliably supported snapshots. )

Dale Stephenson has made some LVM related suggestions which I have not yet =
tried, but they appear more exotic than I am willing to try at the moment.
=20
I thought I would summarize what I have attempted and then move on to other =
issues.

I am testing with the most recently release SuSE kernel based on 2.4.19pre1aa1. =
 Apparently this uses the XFS V1.1 patches.

This kernel does have the VFS-lock patch recommended by Adrian Head included.  =
(I don't know if it is in the base kernel, or if Andrea or SuSE put it in =
there.)=20

First with no i/o load, or read-only load I have had no problems.

With a heavy read/write load of the xfs filesystem induced with a simple dd =
command, I have not been able to repeatably create a snapshot.

I have never had as many as 20 consecutive successful attempts.  My latest test =
had a 60 minute sleep between the lvremove and the lvcreate --snapshot.  (This =
was in the hope that the LVM needed time to completely remove the previous =
snapshot before the new one could be created.)=20

When a failure occurs the lvcreate --snapshot command will freeze up.   =20

A manually entered xfs_freeze -u will release the lvcreate.  (The VFS-lock =
patch effectively is calling xfs_freeze -f internally prior to starting the =
snapshot process.)

Obviously, if a xfs_freeze -u is required to allow lvcreate --snapshot to =
complete, there is the small chance of ending up with a non-mountable snapshot. =
 At least one of my tests had this result.

FYI: Adrian Head believes that the VFS-lock patch is more reliable than not =
having it and wrapping the lvcreate --snapshot call with explicit xfs_freeze =
calls.  I have not tried that.

There are a set of LVM kernel patches to help with this lockup available from =
Dale Stephenson, but he describes them as "an ugly hack that works most of the =
time,
not the sort of thing you want in a CVS tree."

Since I am trying to test a system for production deployment, this was enough =
to scare me away.

An alternative solution from Dale:

>> One way that should not experience lockups is to use neither
>> xfs_freeze nor the VFS lock patch, but use writable snapshots.
>> The snapshot won't be a consistent filesystem, but mount it with
>> the nouuid option and let it do recovery. This way may not give
>> you what you wanted, but at least it won't lock up.

I am considering this option, but it does not sound optimal to me.

=3D=3D=3D
One more FYI: How to know if your kernel has the VFS lock patch.

Explicitly call xfs_freeze -f to freeze the filesystem, then lvcreate to create =
a snapshot. Assuming the lvcreate runs to completion, check the
original filesystem and see if it is now unfroze.

If the filesystem is unfrozen, you have the patch.

If it is still frozen, you don't have the patch.

Hope someone finds that informative,
Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
