Date: Thu, 20 Jan 2005 17:59:00 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Data corruption on large, multi-device filesystem
Message-ID: <20050120175900.GE14093@agk.surrey.redhat.com>
References: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
	<1106172883.41eedbd386498@www.eiler.net>
	<41EFBAF4.5030403@svs.gsfc.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41EFBAF4.5030403@svs.gsfc.nasa.gov>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: dm-devel@redhat.com

On Thu, Jan 20, 2005 at 09:06:44AM -0500, Randall A. Jones wrote:
> To verify, this corruption you are seeing only happens when you have a 
> LV larger than 2TB
> and when you use striping specifically with lvcreate -i.
> Has anyone experienced data corruption with >2TB LV and no striping?
 
Does this patch help?


Missing cast causing data corruption on devices with stripes > ~1TB.
--- diff/drivers/md/dm-stripe.c	2005-01-20 17:32:37.000000000 +0000
+++ source/drivers/md/dm-stripe.c	2005-01-20 17:32:26.000000000 +0000
@@ -179,7 +179,7 @@
 
 	bio->bi_bdev = sc->stripe[stripe].dev->bdev;
 	bio->bi_sector = sc->stripe[stripe].physical_start +
-	    (chunk << sc->chunk_shift) + (offset & sc->chunk_mask);
+	    ((sector_t) chunk << sc->chunk_shift) + (offset & sc->chunk_mask);
 	return 1;
 }
 

Alasdair
-- 
agk@redhat.com
