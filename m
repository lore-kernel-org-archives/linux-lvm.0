Message-ID: <2D0AFEFEE711D611923E009027D39F2B02F1DB@nasexs1.meridian-data.com>
From: Dale Stephenson <dale.stephenson@quantum.com>
MIME-Version: 1.0
Subject: [linux-lvm] RE: Newbie VFS-lock question
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
Date: Tue Aug 20 12:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'LVM Mailing list ' <linux-lvm@sistina.com>
Cc: "'linux-xfs@oss.sgi.com '" <linux-xfs@oss.sgi.com>

Greg Freemeyer writes: 

-----Original Message-----
[snip]
I don't not know if my problem is with xfs or lvm, or some form of
interaction.
 
I am still having lvcreate lockups, even though I am no longer calling
xfs_freeze.  Even stranger, calling xfs_freeze -u causes lvcreate to
continue, even though I had not called xfs_freeze -f.

I have rebooted the server, and this is repeatable, but it does not
occur until the 6th or 7th repeat of my snapshot test script.

It was my understanding that the VFS-lock patch (or lack thereof) would
allow the mount step to be reliable, not that it would have any impact
on lvcreate being able to run to completion.
[snip]
---end original message

With the VFS lock patch, the calls made inside the lvm layer to freeze and
unfreeze are functionally identical to the ioctls made by xfs_freeze -f and
xfs_freeze -u.  So you are susceptible to the same sort of lockups.  That's
also why xfs_freeze -u jogged the lvcreate loose.

If you look through the XFS list archives, you'll find some patches I posted
to help alleviate some of the lockups I had seen, but I've still seen a
few--generally with multiple snapshots of the same source volume with heavy
write I/O directed to the source volume.

One way that should not experience lockups is to use neither xfs_freeze nor
the VFS lock patch, but use writable snapshots.  The snapshot won't be a
consistent filesystem, but mount it with
the nouuid option and let it do recovery.  This way may not give you what
you wanted, but at  least it won't lock up.

Dale J. Stephenson
steph@snapserver.com
