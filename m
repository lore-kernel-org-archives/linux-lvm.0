Date: Fri, 30 May 2014 15:51:52 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530145152.GQ1302@redhat.com>
References: <20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
	<20140530143659.GP1302@redhat.com>
	<20140530144453.GD9219@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530144453.GD9219@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Mike Snitzer <snitzer@redhat.com>
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 30, 2014 at 10:44:54AM -0400, Mike Snitzer wrote:
> I'm not talking about alignment relative to the physical device's
> limits.  I'm talking about alignment of ext4's data areas relative to
> the 64K block boundaries.
> 
> Also a point of conern would be: how fragmented is the ext4 space?  It
> could be that it cannot get contiguous 64K regions from the namespace.
> If that is the case than a lot more IO would get pulled in.

I would be surprised if it was fragmented, since it's a recently
created filesystem which has only been used to store a few huge disk
images ...

> Can you try reducing the cache blocksize to 32K (lowest we support at
> the moment, it'll require you to remove the cache and recreate) to see
> if performance for this 64K random IO workload improves?  If so it does
> start to add weight to my alignment concerns.

... nevertheless what I will do is recreate the origin LV, ext4
filesystem, and change the block size.

What is the command to set the cache blocksize?  It doesn't seem to be
covered in the documentation anywhere.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html
