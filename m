From: Ajay Shekhawat <ajay@cedar.Buffalo.EDU>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-ID: <20031209045057.GP2015@zaurak.cedar.Buffalo.EDU>
References: <CEADF0D83077F7458B763904E47AA709BD63@exchange.neokimia.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEADF0D83077F7458B763904E47AA709BD63@exchange.neokimia.com>
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
Date: Mon Dec  8 22:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 08, 2003 at 04:20:26PM -0500, Yanick Quirion wrote:
> I'm currently testing XFS. It seems to be better than reiserfs, because
> it supports ACLs and online resizing (I applied all patches with
> success). But is XFS supports shrink? With reiserfs it possible to
> shrink a filesystem, but this function doesn't seems to be available
> with XFS.

No, you can't shrink an XFS filesystem.
But, with HDD prices falling, why would you want to? 
(just kidding :-)

I have put XFS on top of a 2TB LVM (which grew from 600GB to 2TB),
and it was a breeze.
Once we "lost" a pair of disks on a RAID5 together (dang Mylex controller!), 
and it wiped out the main superblock. But, with sweaty palms, I was able
to reconstruct the file system without any data loss.

The performance of XFS is great, at least for our application
(we have large image files). We tried ext2, ext3 and XFS, before
deciding on XFS. Even though (at that time) choosing XFS meant
downloading kernel patches from SGI and building and maintaining custom 
kernels, it was worth it.
As always, YMMV; don't take someone else's word for it, but instead
try it yourself before deciding.

Ajay
