From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020820182143.CJYR1228.imf06bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] re[2]: Newbie VFS-lock question
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
Date: Tue Aug 20 13:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: Dale Stephenson <dale.stephenson@quantum.com>, 'LVM Mailing list ' <linux-lvm@sistina.com>

Dale,

Thanks for the response, Questions below:

 >>  I am still having lvcreate lockups, even though I am no longer calling
 >>  xfs_freeze.  Even stranger, calling xfs_freeze -u causes lvcreate to
 >>  continue, even though I had not called xfs_freeze -f.

 >>  It was my understanding that the VFS-lock patch (or lack thereof) would
 >>  allow the mount step to be reliable, not that it would have any impact
 >>  on lvcreate being able to run to completion.
 >>  [snip]
 >>  ---end original message

 >>  With the VFS lock patch, the calls made inside the lvm layer to freeze and
 >>  unfreeze are functionally identical to the ioctls made by xfs_freeze -f
 >>  and
 >>  xfs_freeze -u.  So you are susceptible to the same sort of lockups.=20
 >>  That's
 >>  also why xfs_freeze -u jogged the lvcreate loose.

 >>  If you look through the XFS list archives, you'll find some patches I
 >>  posted
 >>  to help alleviate some of the lockups I had seen, but I've still seen a
 >>  few--generally with multiple snapshots of the same source volume with
 >>  heavy
 >>  write I/O directed to the source volume.

Have your patches been incorporated into the XFS code?

Are you talking about multiple simultaneous snapshots, or creating and =
destroying them in rapid succession.

The later is what my tests does, but my target environment is just to to a =
single nightly backup, so my test may be overly stressful.

 >>  One way that should not experience lockups is to use neither xfs_freeze
 >>  nor
 >>  the VFS lock patch, but use writable snapshots.  The snapshot won't be a
 >>  consistent filesystem, but mount it with
 >>  the nouuid option and let it do recovery.  This way may not give you what
 >>  you wanted, but at  least it won't lock up.

 >>  Dale J. Stephenson
 >>  steph@snapserver.com

I'm using a SuSE 2.4.19pre1aa1 based kernel currently, and it is not clear to =
me that it does or does not have the VFS lock patch.  If I understand you =
correctly, the fact that I am getting lockups in lvcreate that are resolved by =
xfs_freeze -u is strong indicator that the patch is present.  Correct?

Would an even better test be to explicitly call xfs_freeze -f to freeze the =
filesystem, then lvcreate to create a snapshot.  Then check the original =
filesystem and see if it is now unfroze?  I will try that regardless.

I have never compiled a Linux kernel, but I'm sure I can.

How easy should it be to eliminate the one patch?  Are they typically invoked =
by some kind of specfile that I can edit and keep the patch from being applied?

I guess I'm off to download the source for my kernel and see if I can figure =
this stuff out.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
