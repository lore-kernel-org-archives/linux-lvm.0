Date: Fri, 30 May 2014 15:29:48 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530142948.GO1302@redhat.com>
References: <20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com>
	<20140530135529.GC8830@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530135529.GC8830@redhat.com>
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

On Fri, May 30, 2014 at 09:55:29AM -0400, Mike Snitzer wrote:
> So unless you have misaligned IO you _should_ be able to avoid reading
> from the origin.  But XFS is in play here.. I'm wondering if it is

The filesystem is ext4.

> If you set read_promote_adjustment to 0 it should pull the associated
> blocks into the cache.  What makes you think it isn't?

The fio test is about twice as fast as when I ran the fio test
directly on the hard disk array.  This test runs about 5 times slower
than when I ran it directly on the SSD.

I'm not measuring the speed of the md5sum operation.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top
