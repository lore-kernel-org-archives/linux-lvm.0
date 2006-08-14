Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EH9Gpo014894
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 13:09:16 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7EH97i3004475
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 13:09:07 -0400
Received: by ug-out-1314.google.com with SMTP id c2so200953ugf
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 10:09:06 -0700 (PDT)
Message-ID: <87f94c370608141009j7e20fbe1y2067bfac5a07048@mail.gmail.com>
Date: Mon, 14 Aug 2006 13:09:06 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Then XFS will hang after snapshotting in xfs_freeze
	-f in kernel-2.4
In-Reply-To: <BAY12-F2134EF7C50BBDDDE61EABE8B500@phx.gbl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <BAY12-F2134EF7C50BBDDDE61EABE8B500@phx.gbl>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 8/4/06, kong wei <viken_one@hotmail.com> wrote:
> he problem is may very old. But I have searched this maillist by google.
> The messages are so much but none can help me.
> So ask for help here.
>
> It's about the patch linux-2.4.18-lvm-VFSlock.patch.
>
> The kernel is linux-2.4.21-47EL with above patch been patched.
> And I also have tried this two patch
> linux-2.4.21-VFS-lock.patch
> linux-2.4.21-VFS-lock-erperimental.patch(See attached files)
>
> The xfs come from linux-2.4-xfs(http://oss.sgi.com/projects/xfs/).
> The xfsprogs version is 2.6.13
> The lvm version is 1.0.8
>
> Steps to reproduce this problem:
> 1: Assume a LV(/dev/testvg/testlv) has been created.
>    mkfs.xfs this LV.(mkfs.xfs /dev/testvg/testlv)
>    mount it on directory /LVM. (mount /dev/testvg/testlv /LVM)
> 2. xfs_freeze -f  /LVM
> 3. lvcreate -L100M -snTEST_SNAPSHOT /dev/testvg/testlv
> 4. xfs_freeze -u /LVM
> 5. umount /LVM
> The the umount command will not return forever, something operator may
> also hang there as sync.
>
> In 2.6.9, after xfs_freeze -f, the operator lvcreate a snapshot may hang.
> Only xfs_freeze -u in another session. the snapshot can be done.
>
> So in 2.4 also should be done like this, It's the problem about the lock
> s_umount(in fs/super.c) or the lock bd_mount_sem(fs/buffer.c in 2.6kernel).
>
> Thanks && Best Regards
>
> Wei Kong
Wei,

Your taking me back a ways but in the fall of 2002 I did extensive
2.4.x kernel xfs/snapshot testing.  I reported any issues I uncovered
to the XFS team and they resolved them all.

This was prior to XFS being integrated into the mainline kernel.  Also
the VFS-lock patch was not in the mainline kernel.

I was just looking back at an old e-mail I sent to the xfs mailing
list and per a status update I sent, the issues I could detect were
corrected as of Sept. 3 -2002.

http://marc.theaimsgroup.com/?l=linux-xfs&m=103108332308710&w=2

Note that as part of the process I wrote some pretty heavy duty
snapshot tests and submitted them to the xfs project.  In my tests I
did NOT use the VFS-lock patch.  Instead I called xfs_freeze -f and
xfs_freeze -u as required.  There have been issues at times with doing
both.  ie. You should either use the VFS-lock patch to automatically
freeze the filesystem, or you should call xfs_freeze -f, but doing
both has caused lockup problems at various times in the kernels
history.

To see exactly what my snapshot test did see xfstests/068 in the xfs
tree.  I have not updated the test to work with 2.6.x kernels, so it
should still be a good tool to test 2.4.x kernels.  That is unless
someone else updated it.  I'm not part of the core XFS team and I have
not been following their mailing list for a couple of years now.

Greg
--
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
