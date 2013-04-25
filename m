From: Tom Coughlan <coughlan@redhat.com>
In-Reply-To: <51791E1A.8020903@libertytrek.org>
References: <51791E1A.8020903@libertytrek.org>
Date: Thu, 25 Apr 2013 14:35:16 -0400
Message-ID: <1366914916.11473.1153.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshots and filesystem quiescence
Reply-To: coughlan@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2013-04-25 at 08:14 -0400, Tanstaafl wrote:
> Hello,
> 
> I'm totally new to LVM snapshots. I've have read the FAQ and docs and 
> searched the list archives and can't find an answer to my question...
> 
> I know that you have to quiesce SQL databases using their own native 
> tools if you want to have a consistent snapshot of the raw db files, but 
> what about other programs like postfix or dovecot that are constantly 
> (on a busy server) writing to disk? Do you need to stop these, take the 
> snapshot, then restart them? Or will the filesystem itself handle this 
> (similar to how VSS works on windows)?

The LVM management tools will automatically suspend the file system
before taking the snapshot. Refer to the following, from the RHEL 6.4
Storage Administration Guide:

----------

To suspend or resume write activity to a file system, use xfs_freeze.
Suspending write activity allows hardware-based device snapshots to be
used to capture the file system in a consistent state. 
Note
The xfs_freeze utility is provided by the xfsprogs package, which is
only available on x86_64. 

To suspend (i.e. freeze) an XFS file system, use: 
# xfs_freeze -f /mount/point
To unfreeze an XFS file system, use: 
# xfs_freeze -u /mount/point

When taking an LVM snapshot, it is not necessary to use xfs_freeze to
suspend the file system first. Rather, the LVM management tools will
automatically suspend the XFS file system before taking the snapshot. 
Note
You can also use the xfs_freeze utility to freeze/unfreeze an ext3,
ext4, GFS2, XFS, and BTRFS, file system. The syntax for doing so is also
the same. 

For more information about freezing and unfreezing an XFS file system,
refer to man xfs_freeze. 

------------

Tom 
