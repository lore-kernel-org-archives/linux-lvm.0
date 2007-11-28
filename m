Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lASFQs6O010600
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2007 10:26:54 -0500
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.176])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lASFQMLw030484
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2007 10:26:22 -0500
Received: by py-out-1112.google.com with SMTP id p76so3033596pyb
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2007 07:26:22 -0800 (PST)
Message-ID: <474D8885.4090108@gmail.com>
Date: Wed, 28 Nov 2007 10:25:57 -0500
From: Sumit Narayan <sumnaray@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010009030102070908010306"
Subject: [linux-lvm] Function clone_bio
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------010009030102070908010306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

static struct bio *clone_bio(struct bio *bio, sector_t sector,
              unsigned short idx, unsigned short bv_count,
              unsigned int len, struct bio_set *bs)
{
   struct bio *clone;

   clone = bio_alloc_bioset(GFP_NOIO, bio->bi_max_vecs, bs);
   __bio_clone(clone, bio);
   clone->bi_destructor = dm_bio_destructor;
   clone->bi_sector = sector;
   clone->bi_idx = idx;
   clone->bi_vcnt = idx + bv_count;
   clone->bi_size = to_bytes(len);
   clone->bi_flags &= ~(1 << BIO_SEG_VALID);

   return clone;
}

There is a possibility of NULL being returned from bio_alloc_bioset. 
Although unlikely, it could crash the kernel.

If required, I have attached a patch (created on linux-2.6.23.9).

--Sumit

--------------010009030102070908010306
Content-Type: text/x-patch;
 name="dm-dm_c-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dm-dm_c-fix.patch"

diff -uNr linux-2.6.23.9/drivers/md/dm.c linux-2.6.23.9-new/drivers/md/dm.c
--- linux-2.6.23.9/drivers/md/dm.c	2007-11-26 12:51:43.000000000 -0500
+++ linux-2.6.23.9-new/drivers/md/dm.c	2007-11-28 10:07:20.376734456 -0500
@@ -652,6 +652,13 @@
 	struct bio *clone;
 
 	clone = bio_alloc_bioset(GFP_NOIO, bio->bi_max_vecs, bs);
+
+	/*
+	 * bio_alloc_bioset could return NULL.
+	 */
+	if(!clone)
+		return clone;
+
 	__bio_clone(clone, bio);
 	clone->bi_destructor = dm_bio_destructor;
 	clone->bi_sector = sector;

--------------010009030102070908010306--
