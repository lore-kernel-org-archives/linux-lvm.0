From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Problem getting snapshots mounted for ext3 &
    resierfs on 2.4.17-xfs+lvm-1.0.1
Message-Id: <20011227094754.A12868@lynx.no>
References: <E16JQhG-0003WI-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16JQhG-0003WI-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Thu, Dec 27, 2001 at 12:58:00PM +1000
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
Date: Thu Dec 27 10:46:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

On Dec 27, 2001  12:58 +1000, Adrian Head wrote:
> The order of patches was:
> Standard 2.4.17-xfs CVS tree
> + VFS-lock patch
> + lvm-1.0.1 self generated patch
> There were no rejects
> 
> The problem I have now is that I cannot mount the snapshot - I get the 
> standard "wrong fs type, bad option, bad superblock" etc..... error.  Has 
> anyone with the XFS CVS kernel ever come up against this before?  This mount 
> error occurs for ext3, reiserfs filesystems.  Snapshots on XFS volumes work 
> fine as long as they are done with xfs_freeze.

Probably need to apply the VFS lock patch after the LVM patch is applied.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
