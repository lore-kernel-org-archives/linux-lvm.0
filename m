From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020819214738.LPNS1621.imf03bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] Newbie VFS-lock question
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
Date: Mon Aug 19 16:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

Hello all,

I'm new to LVM, but I want to be able to use the snapshot feature with a XFS =
filesystem.

I tried=20

  xfs_freeze -f=20
  lvcreate --snapshot
  xfs_freeze -u

but it was not a reliable solution, and lvcreate would often lock up until I =
executed a xfs_freeze -u on another ssh session.

Adrian Head recommended I use the VFS-lock patch instead of xfs_freeze to =
accomplish my goal of reliable snapshots.

Since I'm new to LVM, I'm not sure what I need to do. =20

I'm running SuSE 8.0 with there 2.4.18-231 kernel.  This is based on the =
2.4.19pre1aa1 kernel with some extra patches.  They also have a test kernel =
based on 2.4.19aa1.

Both have some level of LVM in them, but I don't know which specific version.

Would either of these have the VFS-lock patch already included, or do I need to =
get the SRPM for one of the above, get the VFS-lock patch from somewhere and =
apply the patch?

If so, where do I get the patch?

Also, once I get an appropriate kernel, do I need to do anything to invoke this =
feature prior to creating a snapshot, or is it automatic?


Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
