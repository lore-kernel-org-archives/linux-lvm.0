From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Desater Recovery <urgent>
Message-Id: <20020422173145.GF3017@turbolinux.com>
References: <002401c1ea10$873d91a0$6b01a8c0@PC07>
    <20020422170544.GB2967@fib011235813.fsnet.co.uk>
    <00a601c1ea21$1b869630$6b01a8c0@PC07>
    <20020422172214.GA3145@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020422172214.GA3145@fib011235813.fsnet.co.uk>
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
Date: Mon Apr 22 12:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Zerres <rzerres@networkx.de>
Cc: linux-lvm@sistina.com

On Apr 22, 2002  18:22 +0100, Joe Thornber wrote:
> On Mon, Apr 22, 2002 at 07:14:05PM +0200, Ralf Zerres wrote:
> > no, i guess not.
> > I was using e2fsadm which is serializing the steps. As far as I know ...
> 
> Yes e2fsadm should have resized the filesystem itself, so that's not
> the problem.

Unless e2fsadm doesn't work properly with "- 4,5G"...

Out of curiosity, which resizer did e2fsadm use?  resize2fs or
ext2resize?  By default it would have picked resize2fs if it is
installed.

I don't suppose you recall (or better, have saved) any of the output
from e2fsadm, resize2fs, e2fsck, anything?

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
