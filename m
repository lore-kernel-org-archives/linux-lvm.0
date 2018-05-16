Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2F5589B
	for <linux-lvm@redhat.com>; Wed, 16 May 2018 20:19:08 +0000 (UTC)
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D173A2F8102
	for <linux-lvm@redhat.com>; Wed, 16 May 2018 20:19:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t11-v6so4512311wmt.0
	for <linux-lvm@redhat.com>; Wed, 16 May 2018 13:19:07 -0700 (PDT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 16 May 2018 21:19:03 +0100
Message-Id: <20180516201903.24309-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] [PATCH] lib/device/bcache: don't use PAGE_SIZE
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>

PAGE_SIZE is not a compile time constant. Use sysconf instead like
elsewhere in the code.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 lib/device/bcache.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/device/bcache.c b/lib/device/bcache.c
index 30df54a90..53a62aaee 100644
--- a/lib/device/bcache.c
+++ b/lib/device/bcache.c
@@ -162,8 +162,9 @@ static bool _async_issue(struct io_engine *ioe, enum di=
r d, int fd,
 	struct iocb *cb_array[1];
 	struct control_block *cb;
 	struct async_engine *e =3D _to_async(ioe);
+        long pgsize =3D sysconf(_SC_PAGESIZE);
=20
-	if (((uintptr_t) data) & (PAGE_SIZE - 1)) {
+	if (((uintptr_t) data) & (pgsize - 1)) {
 		log_warn("misaligned data buffer");
 		return false;
 	}
@@ -547,8 +548,9 @@ static bool _init_free_list(struct bcache *cache, unsig=
ned count)
 {
 	unsigned i;
 	size_t block_size =3D cache->block_sectors << SECTOR_SHIFT;
+        long pgsize =3D sysconf(_SC_PAGESIZE);
 	unsigned char *data =3D
-		(unsigned char *) _alloc_aligned(count * block_size, PAGE_SIZE);
+		(unsigned char *) _alloc_aligned(count * block_size, pgsize);
=20
 	/* Allocate the data for each block.  We page align the data. */
 	if (!data)
@@ -899,6 +901,7 @@ struct bcache *bcache_create(sector_t block_sectors, un=
signed nr_cache_blocks,
 {
 	struct bcache *cache;
 	unsigned max_io =3D engine->max_io(engine);
+        long pgsize =3D sysconf(_SC_PAGESIZE);
=20
 	if (!nr_cache_blocks) {
 		log_warn("bcache must have at least one cache block");
@@ -910,7 +913,7 @@ struct bcache *bcache_create(sector_t block_sectors, un=
signed nr_cache_blocks,
 		return NULL;
 	}
=20
-	if (block_sectors & ((PAGE_SIZE >> SECTOR_SHIFT) - 1)) {
+	if (block_sectors & ((pgsize >> SECTOR_SHIFT) - 1)) {
 		log_warn("bcache block size must be a multiple of page size");
 		return NULL;
 	}
--=20
2.17.0
