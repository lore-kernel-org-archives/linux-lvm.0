From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040226162810.GA13985@cistron.nl>
References: <1qJVx-75K-15@gated-at.bofh.it> <1r6fH-3L8-11@gated-at.bofh.it> <1r6S4-6cv-1@gated-at.bofh.it> <403D02E3.4070208@tmr.com> <c1j4mb$gmd$1@news.cistron.nl> <20040225162431.1f08365d.akpm@osdl.org> <20040226103704.GA13717@traveler.cistron.net> <20040226024714.768e3c71.akpm@osdl.org> <20040226105120.GC7580@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040226105120.GC7580@suse.de>
Subject: [linux-lvm] PATCH: bdi_congested-core.patch (was: Re: IO scheduler, queue depth, nr_requests)
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
Date: Thu Feb 26 11:27:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: Andrew Morton <akpm@osdl.org>, thornber@redhat.com, piggin@cyberone.com.au, linux-lvm@redhat.com

According to Jens Axboe:
> On Thu, Feb 26 2004, Andrew Morton wrote:
> > Miquel van Smoorenburg <miquels@cistron.nl> wrote:
> > > Well, I'm looking for guidance from Jens first, since I'm not sure if
> > > he wants the first solution (congestion testing passed down), the second
> > > (congestion setting passed up) or both.
> > 
> > The first patch looks nice.  Why do we need the "pass it up" feature?
> 
> Miquel, the newer patches do tend to get too complicated. I suppose I'm
> fine with the first patch as well, modulo the dm part (I'd suggest
> merging it without and talking to Joe about doing it properly).

Okay here you go. I added bdi_rw_congested() for code in xfs and ext2
that calls both bdi_read_congested() and bdi_write_congested() in
a row, and it was "free" anyway.

bdi_congested-core.patch

--- linux-2.6.3.orig/include/linux/backing-dev.h	2004-02-04 04:43:38.000000000 +0100
+++ linux-2.6.3-congested_fn/include/linux/backing-dev.h	2004-02-26 16:17:49.000000000 +0100
@@ -20,10 +20,14 @@ enum bdi_state {
 	BDI_unused,		/* Available bits start here */
 };
 
+typedef int (congested_fn)(void *, int);
+
 struct backing_dev_info {
 	unsigned long ra_pages;	/* max readahead in PAGE_CACHE_SIZE units */
 	unsigned long state;	/* Always use atomic bitops on this */
 	int memory_backed;	/* Cannot clean pages with writepage */
+	congested_fn *congested_fn; /* Function pointer if device is md/dm */
+	void *congested_data;	/* Pointer to aux data for congested func */
 };
 
 extern struct backing_dev_info default_backing_dev_info;
@@ -32,14 +36,27 @@ int writeback_acquire(struct backing_dev
 int writeback_in_progress(struct backing_dev_info *bdi);
 void writeback_release(struct backing_dev_info *bdi);
 
+static inline int bdi_congested(struct backing_dev_info *bdi, int bdi_bits)
+{
+	if (bdi->congested_fn)
+		return bdi->congested_fn(bdi->congested_data, bdi_bits);
+	return (bdi->state & bdi_bits);
+}
+
 static inline int bdi_read_congested(struct backing_dev_info *bdi)
 {
-	return test_bit(BDI_read_congested, &bdi->state);
+	return bdi_congested(bdi, 1 << BDI_read_congested);
 }
 
 static inline int bdi_write_congested(struct backing_dev_info *bdi)
 {
-	return test_bit(BDI_write_congested, &bdi->state);
+	return bdi_congested(bdi, 1 << BDI_write_congested);
+}
+
+static inline int bdi_rw_congested(struct backing_dev_info *bdi)
+{
+	return bdi_congested(bdi, (1 << BDI_read_congested)|
+				  (1 << BDI_write_congested));
 }
 
 #endif		/* _LINUX_BACKING_DEV_H */
