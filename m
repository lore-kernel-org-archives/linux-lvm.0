From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] filesystem corruption...
Message-Id: <20020227164228.A964@lynx.adilger.int>
References: <224974437.20020227233630@tnonline.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <224974437.20020227233630@tnonline.net>; from
    andewid@tnonline.net on Wed, Feb 27, 2002 at 11:36:30PM +0100
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
Date: Wed Feb 27 17:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: linux-lvm@sistina.com

On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
> Unfortunatley, something went seriously wrong. I can't mount the disk
> any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
> a valid filesystem on the device. Vgscan does however find all devices
> and can activate the volume group, but reiserfsck doesn't work.
> 
> What should I do to be able to save a s much data as possible?

dd if=/dev/vg/lv of=/new/disk conv=sync,noerror

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
