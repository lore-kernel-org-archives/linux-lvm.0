Message-ID: <2D0AFEFEE711D611923E009027D39F2B02F1DC@nasexs1.meridian-data.com>
From: Dale Stephenson <dale.stephenson@quantum.com>
MIME-Version: 1.0
Subject: [linux-lvm] RE: re[2]: Newbie VFS-lock question
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
Date: Tue Aug 20 15:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Greg Freemyer ' <freemyer@NorcrossGroup.com>, ''LVM Mailing list ' ' <linux-lvm@sistina.com>

I wrote:
>>  If you look through the XFS list archives, you'll find some 
>>  patches I posted to help alleviate some of the lockups I 
>>  had seen, but I've still seen a few--generally with 
>>  multiple snapshots of the same source volume with heavy
>>  write I/O directed to the source volume.

Greg wrote:
> Have your patches been incorporated into the XFS code?

With the exception of removing the call to 
xfs_unmountfs_writesb() from the unfreeze, no.  Nor should
they be.  We used a new process flag to exempt certain
processes from getting snagged by the freeze (such as ones
who went through write_some_buffers(), the freeze itself,
sync calls).  It's an ugly hack that works most of the time,
not the sort of thing you want in a CVS tree.

XFS has changed a good deal since we put those patches
together in March and April, so some of the problems we
worked around may be gone.  But as long as messages like
your show up, I'm not in a hurry to yank the hacks from my
build.

>Are you talking about multiple simultaneous snapshots, or creating 
>and destroying them in rapid succession.

Multiple simultaneous snapshots.

[...]
>>  One way that should not experience lockups is to use neither
>>  xfs_freeze nor the VFS lock patch, but use writable snapshots.
>>  The snapshot won't be a consistent filesystem, but mount it with
>>  the nouuid option and let it do recovery.  This way may not give
>>  you what you wanted, but at  least it won't lock up.

>I'm using a SuSE 2.4.19pre1aa1 based kernel currently, and it is not
>clear to me that it does or does not have the VFS lock patch.  If I
>understand you correctly, the fact that I am getting lockups in lvcreate
>that are resolved by xfs_freeze -u is strong indicator that the patch is
>present.  Correct?

Correct.

>Would an even better test be to explicitly call xfs_freeze -f to freeze
>the filesystem, then lvcreate to create a snapshot.  Then check the
>original filesystem and see if it is now unfroze?  I will try that
>regardless.

This will work as well.

>How easy should it be to eliminate the one patch?  Are they typically
>invoked by some kind of specfile that I can edit and keep the patch from
>being applied?

I've not used code from SUSE, but a redhat RPM build would have the
patches mentioned in the spec file.  You could either comment out the
application of the particular task, or add another patch that undoes
part of the earlier patch.  If you don't want to lock the file system at
lvcreate time, for instance, it would be sufficient to replace lvm.c's
fsync_dev_lockfs() with a fsync_dev().  The unlockfs() call should do no
harm.

Dale Stephenson
steph@snapserver.com
