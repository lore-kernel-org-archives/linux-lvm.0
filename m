From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
Message-Id: <20020226095919.F12832@lynx.adilger.int>
References: <m28z9guz53.fsf@isnogud.escape.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m28z9guz53.fsf@isnogud.escape.de>; from
    urs@isnogud.escape.de on Tue, Feb 26, 2002 at 02:54:32PM +0100
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
Date: Tue Feb 26 10:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Urs Thuermann <urs@isnogud.escape.de>
Cc: linux-lvm@sistina.com

On Feb 26, 2002  14:54 +0100, Urs Thuermann wrote:
> I tried creating a snapshot of a ext2 file system on a LV.  I expected
> a fsck on the snapshot device to give no errors, i.e. a consistent
> file system.  This is ok, as long as there is no (or little) load on
> the file system when creating the snapshot.

Yes.

> However, on a busy file system, the created snapshot has lots of
> errors found by fsck.
> 
> Is it this what the VFS lock patch is for?  If so, why hasn't it been
> integrated into the standard kernel?  Has it flaws in it?  Maybe
> performance wise?

The VFS lock patch only applies to journaled filesystems.  There has not
been any attempt to include support for sync_super_lockfs for ext2.  I
_think_ that if you tried to mount the ext2 snapshot, it will still
work, even though it is inconsistent.  Obviously it would be better to
fix it so that ext2 snapshots are always consistent.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
