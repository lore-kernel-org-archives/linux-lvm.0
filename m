From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] snapshot questions
Message-ID: <20011102102908.H746@lynx.no>
References: <01110208435117.08803@khayes-lin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01110208435117.08803@khayes-lin>; from khayes@quicknet.net on Fri, Nov 02, 2001 at 08:43:51AM -0800
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
Date: Fri Nov  2 11:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle Hayes <khayes@quicknet.net>
Cc: linux-lvm@sistina.com

On Nov 02, 2001  08:43 -0800, Kyle Hayes wrote:
> 1) how does the snapshot actually work?  My understanding is that the
> creation of a snapshot partition sets up a new LV on the same VG as
> the "source" partition.  This new partition is then used for writes to
> the "source" partition.  When the snapshot LV is removed, do I get
> a disk IO hit as these changes are copied back to the "source" partition?
> Or, does it work more like Veritas where the changed data go to the
> "source" and the original values are copied to the snapshot partition?
> The Veritas method is nice because dropping the snapshot partition
> does not require any data copying.

It is like the veritas method - changes go into the original LV, and the
old data is copied into the snapshot(s).

> 2) are there any people using LVM for database snapshots?  The
> Whitepaper from SuSE has examples for Oracle and the HOWTO's
> talk about it, but is it used in production?  If so, what issues have you
> found?

You probably need to put your tablespaces into "backup" mode temporarily
when doing the snapshot.  Otherwise there is no guarantee that what is
currently on disk is any good.

> 4) It seems that most of the LVM work is going into 2.4.  We have not
> been particularly pleased with the stability of 2.4 in general and would
> like to stay with 2.2 for a while.  How does the stability of LVM on 2.2
> compare to 2.4?

It should be pretty much identical.  There are compatibility hooks for
2.2 and 2.4, and they both use an otherwise identical code base.

> 5) I have seen references to the VFS lock patch in the mailing list.
>    Is this actually supported by any filesystems yet?  Is it in the
>    kernel proper? 

Yes, reiserfs, ext3, and XFS all support the lock interface to the VFS.
Note that the stock 2.4 kernel has the VFS methods for this, but is
missing the code to do it.  There is the capability to support this for
ext3 on 2.2, but it is not in the stock code.  I think the same is true
for reiserfs.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
