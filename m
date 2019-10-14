From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 14 Oct 2019 03:07:01 +0000
Message-ID: <60012a57-07bb-8b42-080a-8b94036dfc65@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<20191011151405.GA31912@redhat.com>
	<4139435d-c8fc-71c3-6066-ebfc882e9511@suse.com>
	<d8f2f0af-0b54-76ca-6a44-adabc73f1a08@suse.com>
In-Reply-To: <d8f2f0af-0b54-76ca-6a44-adabc73f1a08@suse.com>
Content-Language: en-US
Content-ID: <42E0FF1D1E38CE4494E6812C1D23AE25@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: David Teigland <teigland@redhat.com>
Cc: Gang He <GHe@suse.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

I'm very sorry for the last mail. There are compiling errors in patch.
(with commit 89cfffeffb7499d8f51112f58c381007aebc372d)
I resend this patch. see below:

```
commit 7032c9c0bfe3c1fcbbb6e4e036ffe69a02aaa440
Author: Zhao Heming <heming.zhao@suse.com>
Date:   Mon Oct 14 10:55:54 2019 +0800

     makes caller can't reset bcache last_byte by dev_unset_last_byte
     
     Signed-off-by: Zhao Heming <heming.zhao@suse.com>

diff --git a/.gitignore b/.gitignore
index 7ebb8bb3be..cfd5bee1c4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -30,7 +30,7 @@ make.tmpl
  /config.log
  /config.status
  /configure.scan
-/cscope.out
+/cscope.*
  /html/
  /reports/
  /tags
diff --git a/lib/format_text/format-text.c b/lib/format_text/format-text.c
index 6ec47bfcef..fd65f50f5f 100644
--- a/lib/format_text/format-text.c
+++ b/lib/format_text/format-text.c
@@ -277,8 +277,7 @@ static int _raw_write_mda_header(const struct format_type *fmt,
         dev_set_last_byte(dev, start_byte + MDA_HEADER_SIZE);
  
         if (!dev_write_bytes(dev, start_byte, MDA_HEADER_SIZE, mdah)) {
-               dev_unset_last_byte(dev);
-               log_error("Failed to write mda header to %s fd %d", dev_name(dev), dev->bcache_fd);
+               log_error("Failed to write mda header to %s", dev_name(dev));
                 return 0;
         }
         dev_unset_last_byte(dev);
@@ -988,8 +987,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
                            (unsigned long long)write2_size);
  
         if (!dev_write_bytes(mdac->area.dev, write1_start, (size_t)write1_size, write_buf)) {
-               log_error("Failed to write metadata to %s fd %d", devname, mdac->area.dev->bcache_fd);
-               dev_unset_last_byte(mdac->area.dev);
+               log_error("Failed to write metadata to %s", devname);
                 goto out;
         }
  
@@ -1001,8 +999,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
  
                 if (!dev_write_bytes(mdac->area.dev, write2_start, write2_size,
                                      write_buf + new_size - new_wrap)) {
-                       log_error("Failed to write metadata wrap to %s fd %d", devname, mdac->area.dev->bcache_fd);
-                       dev_unset_last_byte(mdac->area.dev);
+                       log_error("Failed to write metadata wrap to %s", devname);
                         goto out;
                 }
         }
@@ -1019,7 +1016,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
  
         r = 1;
  
-      out:
+out:
         if (!r) {
                 free(fidtc->write_buf);
                 fidtc->write_buf = NULL;
diff --git a/lib/label/label.c b/lib/label/label.c
index 60ad387219..64a8f14150 100644
--- a/lib/label/label.c
+++ b/lib/label/label.c
@@ -218,7 +218,7 @@ int label_write(struct device *dev, struct label *label)
  
         if (!dev_write_bytes(dev, offset, LABEL_SIZE, buf)) {
                 log_debug_devs("Failed to write label to %s", dev_name(dev));
-               r = 0;
+               return 0;
         }
  
         dev_unset_last_byte(dev);
@@ -1415,7 +1415,8 @@ bool dev_write_bytes(struct device *dev, uint64_t start, size_t len, void *data)
  
         if (!scan_bcache) {
                 /* Should not happen */
-               log_error("dev_write bcache not set up %s", dev_name(dev));
+               log_error("dev_write bcache not set up %s fd %d", dev_name(dev),
+                               dev->bcache_fd);
                 return false;
         }
  
@@ -1434,21 +1435,25 @@ bool dev_write_bytes(struct device *dev, uint64_t start, size_t len, void *data)
                 dev->flags |= DEV_BCACHE_WRITE;
                 if (!label_scan_open(dev)) {
                         log_error("Error opening device %s for writing at %llu length %u.",
-                                 dev_name(dev), (unsigned long long)start, (uint32_t)len);
+                                       dev_name(dev), (unsigned long long)start, (uint32_t)len);
                         return false;
                 }
         }
  
         if (!bcache_write_bytes(scan_bcache, dev->bcache_fd, start, len, data)) {
-               log_error("Error writing device %s at %llu length %u.",
-                         dev_name(dev), (unsigned long long)start, (uint32_t)len);
+               log_error("Error writing device %s at %llu length %u fd %d.",
+                         dev_name(dev), (unsigned long long)start, (uint32_t)len,
+                         dev->bcache_fd);
+               dev_unset_last_byte(dev);
                 label_scan_invalidate(dev);
                 return false;
         }
  
         if (!bcache_flush(scan_bcache)) {
-               log_error("Error writing device %s at %llu length %u.",
-                         dev_name(dev), (unsigned long long)start, (uint32_t)len);
+               log_error("Error writing device %s at %llu length %u fd %d.",
+                         dev_name(dev), (unsigned long long)start, (uint32_t)len,
+                         dev->bcache_fd);
+               dev_unset_last_byte(dev);
                 label_scan_invalidate(dev);
                 return false;
         }
diff --git a/lib/metadata/mirror.c b/lib/metadata/mirror.c
index 75dc18c113..c8280f9c47 100644
--- a/lib/metadata/mirror.c
+++ b/lib/metadata/mirror.c
@@ -266,7 +266,6 @@ static int _write_log_header(struct cmd_context *cmd, struct logical_volume *lv)
         dev_set_last_byte(dev, sizeof(log_header));
  
         if (!dev_write_bytes(dev, UINT64_C(0), sizeof(log_header), &log_header)) {
-               dev_unset_last_byte(dev);
                 log_error("Failed to write log header to %s.", name);
                 return 0;
         }
```

On 10/12/19 3:11 PM, Heming Zhao wrote:
> Below patch for fix incorrect calling dev_unset_last_byte.
