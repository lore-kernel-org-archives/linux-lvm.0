From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] reiserfs panic
Message-ID: <20011130093239.E15936@lynx.no>
References: <20011129164915.I1408@tykepenguin.com> <20011130102423.E1452@tykepenguin.com> <742840000.1007128632@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <742840000.1007128632@tiny>; from mason@suse.com on Fri, Nov 30, 2001 at 08:57:12AM -0500
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
Date: Fri Nov 30 10:31:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com

On Nov 30, 2001  08:57 -0500, Chris Mason wrote:
> Now that 2.5.x is out I expect more of these to get cleaned up, and I'm
> workin on patches to turn reiserfs_panic into a forced readonly mount.

Just as an FYI, ext2 has a distinction between "ext2_panic", "ext2_error",
and "ext2_warning".  The panic is just what it sounds like (and can only
be triggered by something like memory corruption, it is almost unused).
The error has a configurable behaviour - panic also, ro-mount, warning.
In all cases, it marks the filesystem superblock with an error.  The
default is ro-mounting the filesystem.  The warning is just a warning
(unusual condition, but a 100% recoverable situation).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
