Date: Tue, 9 Oct 2001 16:58:01 +0100
Subject: Re: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
Message-ID: <20011009165801.B851@btconnect.com>
References: <387040000.1002641567@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <387040000.1002641567@tiny>; from mason@suse.com on Tue, Oct 09, 2001 at 11:32:47AM -0400
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 09, 2001 at 11:32:47AM -0400, Chris Mason wrote:
> 
> Hello everyone,
> 
> Looks like the compatibility code in rc4 doesn't properly snapshot beta7
> logical volumes (2.4.10 kernel).
> 
> To reproduce, I did this:
> 
> Install 0.9.1 beta7 tools
> 
> pvcreate /dev/sdb2
> vgcreate big /dev/sdb2
> lvcreate --size 6G -n lv1 big
> vgchange -a n
> rmmod lvm-mod
> 
> Install rc4 tools
> vgscan
> vchange -a y
> mkfs /dev/big/lv1
> mount /dev/big/lv1 /data
> lvcreate --size 1G -n snap --snapshot /dev/big/lv1
> (trigger COW to snapshot)
> 
> And I get these messages:
> 
> lvm -- _pv_get_number failed for rdev = 0
> lvm -- giving up to snapshot /dev/big/lv1 on /dev/big/snap: couldn't
> prepare kiovec blocks (start probably isn't block aligned).
> 
> Now that I can reliably reproduce on stock kernels/tools, I'm trying to
> trace it further.  If anyone has ideas I'd love to hear them.

Some of the betas misaligned the logical volumes.  If the volumes
aren't page aligned the snapshot code (which uses kiovecs) cannot
work.  You have this problem.  Fixing it isn't easy; you need to
shuffle your extents up or down by the appropriate amount.  No one has
written a program to do this as of yet.  Sorry.

- Joe
