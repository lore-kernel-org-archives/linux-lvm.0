From: 'Greg Freemyer '   <freemyer@norcrossgroup.com>
Subject: re: [linux-lvm] RE: re[2]: Newbie VFS-lock question
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020820223325.HNLC12335.imf01bis.bellsouth.net@TAZ2>
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
Date: Tue Aug 20 17:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

Dale / Adrian,

During my testing I had noticed that the more rapidly I created snapshots, the =
more slowly the lvcreate accrued.

I decided to add a 5 minute delay, so for the last couple of hours, I have been =
doing:

while true
do
sleep 300
lvcreate --snapshot
mount ...
df
umount ...
lvremove
done

At the same time, I have
while true
do
dd if=3Dlarge_file of=3Djunk bs=3D64k
sleep 1
done

running on the same LV.
=20
I have not seen any problems yet.

I'm going to leave it running overnight like this, and if this works without =
any lockups I'm going to move on to other types of testing.

FYI: I have seen failures when the sleep 300 is a sleep 60.

My guess it takes a minute or two for the lvremove to fully work its way thru =
the LV.

Since I only need to make one set of snapshots per night. I'm not overly =
concerned about that.

OTOH, you may want to add that as a test case.

Thanks for your help.
Greg
 >>  I wrote:
 >>  >>  If you look through the XFS list archives, you'll find some=20
 >>  >>  patches I posted to help alleviate some of the lockups I=20
 >>  >>  had seen, but I've still seen a few--generally with=20
 >>  >>  multiple snapshots of the same source volume with heavy
 >>  >>  write I/O directed to the source volume.

 >>  Greg wrote:
 >>  > Have your patches been incorporated into the XFS code?

 >>  With the exception of removing the call to=20
 >>  xfs_unmountfs_writesb() from the unfreeze, no.  Nor should
 >>  they be.  We used a new process flag to exempt certain
 >>  processes from getting snagged by the freeze (such as ones
 >>  who went through write_some_buffers(), the freeze itself,
 >>  sync calls).  It's an ugly hack that works most of the time,
 >>  not the sort of thing you want in a CVS tree.

 >>  XFS has changed a good deal since we put those patches
 >>  together in March and April, so some of the problems we
 >>  worked around may be gone.  But as long as messages like
 >>  your show up, I'm not in a hurry to yank the hacks from my
 >>  build.

 >>  >Are you talking about multiple simultaneous snapshots, or creating=20
 >>  >and destroying them in rapid succession.

 >>  Multiple simultaneous snapshots.

 >>  [...]
 >>  >>  One way that should not experience lockups is to use neither
 >>  >>  xfs_freeze nor the VFS lock patch, but use writable snapshots.
 >>  >>  The snapshot won't be a consistent filesystem, but mount it with
 >>  >>  the nouuid option and let it do recovery.  This way may not give
 >>  >>  you what you wanted, but at  least it won't lock up.

 >>  >I'm using a SuSE 2.4.19pre1aa1 based kernel currently, and it is not
 >>  >clear to me that it does or does not have the VFS lock patch.  If I
 >>  >understand you correctly, the fact that I am getting lockups in lvcreate
 >>  >that are resolved by xfs_freeze -u is strong indicator that the patch is
 >>  >present.  Correct?

 >>  Correct.

 >>  >Would an even better test be to explicitly call xfs_freeze -f to freeze
 >>  >the filesystem, then lvcreate to create a snapshot.  Then check the
 >>  >original filesystem and see if it is now unfroze?  I will try that
 >>  >regardless.

 >>  This will work as well.

 >>  >How easy should it be to eliminate the one patch?  Are they typically
 >>  >invoked by some kind of specfile that I can edit and keep the patch from
 >>  >being applied?

 >>  I've not used code from SUSE, but a redhat RPM build would have the
 >>  patches mentioned in the spec file.  You could either comment out the
 >>  application of the particular task, or add another patch that undoes
 >>  part of the earlier patch.  If you don't want to lock the file system at
 >>  lvcreate time, for instance, it would be sufficient to replace lvm.c's
 >>  fsync_dev_lockfs() with a fsync_dev().  The unlockfs() call should do no
 >>  harm.

 >>  Dale Stephenson
 >>  steph@snapserver.com

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html





Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
