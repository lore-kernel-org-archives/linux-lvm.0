From: Greg Freemyer <freemyer@norcrossgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020820161939.CKFF5321.imf05bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] re[2]: [Newbie VFS-lock question
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
Date: Tue Aug 20 11:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>
Cc: linux-xfs@oss.sgi.com

Adrian,

Thanks for the help.

Due to the strangeness of my test results, I have also cross-posted this to the =
LVM and XFS list.

I don't not know if my problem is with xfs or lvm, or some form of interaction.
=20
I am still having lvcreate lockups, even though I am no longer calling =
xfs_freeze.  Even stranger, calling xfs_freeze -u causes lvcreate to continue, =
even though I had not called xfs_freeze -f.

I have rebooted the server, and this is repeatable, but it does not occur until =
the 6th or 7th repeat of my snapshot test script.

It was my understanding that the VFS-lock patch (or lack thereof) would allow =
the mount step to be reliable, not that it would have any impact on lvcreate =
being able to run to completion.

More below:
 >>  Gday Greg,

 >>  On Tue, 20 Aug 2002 07:44, Greg Freemyer wrote:
 >>  >
 >>  > I'm running SuSE 8.0 with there 2.4.18-231 kernel.  This is based on the
 >>  > 2.4.19pre1aa1 kernel with some extra patches.  They also have a test
 >>  kernel
 >>  > based on 2.4.19aa1.

 >>  First is to issue a "lvm version" and please let me know of the results.

The exact response is "bash: lvm: command not found".  :<

Should it have worked?  I do have lots of lv* binaries in /sbin, but not lvm =
itself.

rpm -qa | grep lvm    gives   lvm-1.0.3-22   if that is what you were looking =
for.

If it was kernel lvm version # maybe looking at the list of -aa patches will =
help.

I have never looked for a list of the -aa patches before, but I _assume_ I =
found them:
=20
The -aa kernels seem to have a bunch of patches as shown@=
http://www.kernel.org/pub/linux/kernel/people/andrea/kernels/v2.4

For 2.4.19pre1aa1, see =
http://www.kernel.org/pub/linux/kernel/people/andrea/kernels/v2.4/2.4.19pre1aa1=
/

The above is kernel I'm currently testing.

For 2.4.19 release, see =
http://www.kernel.org/pub/linux/kernel/people/andrea/kernels/v2.4/2.4.19rc5aa1/ =
  (note rc5 became the release version.)

I can also test this one if it is likely to help.

The only lvm specific patch I see is lvm-snapshot-check-[12]    =
http://www.kernel.org/pub/linux/kernel/people/andrea/kernels/v2.4/2.4.19rc5aa1/=
10_lvm-snapshot-check-2

That does not look like it has anything to do with VFS-locks.

I guess this means that the majority of the LVM kernel changes are part of the =
official kernel?  But that the VFS locks patch is not?

 >>  > Both have some level of LVM in them, but I don't know which specific
 >>  > version.
 >>  >
 >>  > Would either of these have the VFS-lock patch already included, or do I
 >>  > need to get the SRPM for one of the above, get the VFS-lock patch from
 >>  > somewhere and apply the patch?

 >>  Not sure - we'll have to work it out.  The easiest way is to comment out
 >>  the=20
 >>  xfs_freeze above and still run the script - if you are able to mount the=20
 >>  resulting snapshot then you most likely have the VFS-lock patch.

I just tried this and I have a surprising result.  (Surprising to me anyway.)

My script has:
        lvcreate --snapshot -L 2500m --name Data_snap /dev/VG/Data
        mount -t xfs -o ro,nouuid /dev/VG/Data_snap /data_snap
           df /data_snap
        umount /data_snap
        lvremove -f /dev/VG/Data_snap

I manually invoked the above 10 times with, no i/o load, heavy read load, and =
heavy read/write load.  (I used a single instance of dd to copy a 20 Gig file =
to generate the load.)

I paused only a few second between iterations of this script.

Under no load and with heavy read only load, I had no problems.

With the heavy read/write load, the lvcreate locked up!!! on the 6th or 7th =
iteration.  Prior to this the lvcreate and mount steps had been taking longer =
and longer, but never more than 60 seconds,

It displayed=20
   lvcreate -- WARNING: the snapshot will be automatically disabled once it =
gets full
  lvcreate -- INFO: using default snapshot chunk size of 64 KB for =
"/dev/TruStore-Data/TruStore-Data_snap"
prior to locking up, but nothing else.

lvcreate had been running for 20 minutes before I tried the xfs_freeze -u =
described below.  The rest of the server seemed to be working fine during this =
time.  I did NOT try to access any other LV on the same VG, so I don't know if =
that would have worked or not.

iostat -x -d 10  showed no activity to the drive at all, although the dd =
command had only copied 700 megs of the 20 Gigs to copy.!!!

The /data FS still has 11 Gigs of free space and I should have lots of =
unallocated space in the VG.

lvscan is showing my 3 permanent LVs, but then gives a segmentation fault.

I performed a xfs_freeze -u /data, just because this looked so similar to my =
previous tests.

Much to my surprise, this caused the lvcreate to continue!!!!

I know this sounds like I am still calling xfs_freeze, but it is definitely NOT =
being called by my script.=20

Is there some other way it could be being invoked??????

The above is repeatable, and rebooting the server does NOT cause the problem to =
go away.

 >>  > If so, where do I get the patch?

 >>  From either the tarballs or from CVS.

 >>  > Also, once I get an appropriate kernel, do I need to do anything to
 >>  invoke
 >>  > this feature prior to creating a snapshot, or is it automatic?

 >>  The VFS-lock is automatic - it deals with the writing out of pending I/O=20
 >>  before the snapshot is writen.

I'm going to look for the tarball now, but do you think that the VFS-lock patch =
will help with this problem.

I'm also going to create a ext3 LV on the same VG and see if that has the same =
problem.

 >>  --=20
 >>  Adrian Head

 >>  (Public Key available on request.)

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Thanks for helping me on this,
Greg
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
