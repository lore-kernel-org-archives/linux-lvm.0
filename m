From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020110152713.GC1018@tykepenguin.com>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <200201050212.TAA16774@cthulhu.turbolabs.com>
    <20020105142527.I12868@lynx.no> <E16Oh1M-0003UB-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16Oh1M-0003UB-00@hermes.sistina.com>
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
Date: Thu Jan 10 09:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 01:21:26AM +1000, Adrian Head wrote:
> In the process of trying to fix this issue I have been playing around with a 
> patch from the great SGI XFS developers.  It certainly fixes the problems I 
> was having but I'm now trying to help clean the patch up.
> 
> The problem now is that when I try to mount a ext3 snapshot using:
> mount /dev/HDA/SNAP /mnt/snapshot
> The kernel mounts the snapshot as ext2.  Is was not happening before the 
> patch and I was wondering if anyone thinks this is a problem.  As ext3 is 
> backward compatible with ext2 there doesn't seem to be any problems during my 
> testing with respect to standard file operations.  I can mount the snapshot 
> as ext3 if I use:
> mount -t ext3 /dev/HDA/SNAP /mnt/snapshot
> 
> The next problem is that when the ext3 snapshot (mounted as ext3) overflows 
> lvm generates an error in the logs:
> lvm -- giving up to snapshot /dev/HDA/XFS on /dev/HDA/SNAP: out of space
> lvm - lvm_map: ll_rw_blk for inactive LV /dev/HDA/SNAP
> 
> The 1st line I understand but the 2nd I don't.  I was hoping that some LVM 
> guru/developer could explain the 2nd line and what it means.

When a snapshot gets full it can no longer be valid so LVM makes it inactive and
fails any further I/O to it.

Because there's no more space for copy-on-write operations into the snapshot
there's no way the filesystem can be consistent. OK this isn't that nice but
it's arguably better than returning corrupted data.

patrick
