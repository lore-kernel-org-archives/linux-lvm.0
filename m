Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CM98i04038
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 17:09:08 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040212220813.GC20172@drinkel.cistron.nl>
References: <20040212015710.3b0dee67.akpm@osdl.org> <20040212203306.GA13192@cistron.nl> <20040212212811.GA655@frodo>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040212212811.GA655@frodo> (from nathans@sgi.com on Thu, Feb 12, 2004 at 22:28:11 +0100)
Subject: [linux-lvm] Re: 2.6.3-rc2-mm1 (dm)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:11:20 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Scott <nathans@sgi.com>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, linux-lvm@sistina.com

On Thu, 12 Feb 2004 22:28:11, Nathan Scott wrote:
> On Thu, Feb 12, 2004 at 09:33:07PM +0100, Miquel van Smoorenburg wrote:
> > ...
> > However there's still one issue:
> > 
> > I created a LVM volume on /dev/sda2, called /dev/vg0/test. Then
> > I created and mounted an XFS partition on /dev/vg0/test. XFS uses
> > a 512 byte blocksize by default, but the underlying /dev/sda2
> 
> (thats a 512 byte "sector size" in XFS-speak)

Ah yes. mkfs -txfs -s size=4096 fixes it as well, but that's a
workaround.

> > device had a soft blocksize of 4096 (default after boot is 1024,
> > but I had been mucking around with it so it got set to 4096).
> > 
> > As a result, I couldn't get more than 35 MB/sec write speed out
> > of XFS mounted on the LVM device.
> > 
> > I added this little patch:
> > 
> > --- drivers/md/dm-table.c.ORIG  2004-02-12 20:49:47.000000000 +0100
> > +++ drivers/md/dm-table.c       2004-02-12 20:56:59.000000000 +0100
> > @@ -361,7 +361,7 @@
> >                 blkdev_put(bdev, BDEV_RAW);
> >         else {
> >                 d->bdev = bdev;
> > -               set_blocksize(bdev, d->bdev->bd_block_size);
> > +               set_blocksize(bdev, 512);
> >         }
> >         return r;
> >  }
> > 
> > This forces the underlying device(s) to a soft blocksize of 512. And
> > I had my 80 MB/sec write speed back !

Gah, wrong patch. That's because vim saved dm-table.c when I suspended it
to copy dm-table.c to dm-table.c.ORIG, so the patch makes no sense.

--- drivers/md/dm-table.c.ORIG  2004-02-12 23:05:15.000000000 +0100
+++ drivers/md/dm-table.c       2004-02-12 20:56:59.000000000 +0100
@@ -359,8 +359,10 @@
        r = bd_claim(bdev, _claim_ptr);
        if (r)
                blkdev_put(bdev, BDEV_RAW);
-       else
+       else {
                d->bdev = bdev;
+               set_blocksize(bdev, 512);
+       }
        return r;
 }
  
That's more like it.

> > I'm not sure if setting the blocksize of the underlying device
> > always to 512 is the right solution. I think that set_blocksize
> 

> I would guess that bdev_hardsect_size()
> would be more appropriate here than hard-coding 512 bytes.  I
> don't know the details of the problem being solving by adding
> set_blocksize() in there though, so I might be completely wrong.

That does make sense, I guess.

Mike.
