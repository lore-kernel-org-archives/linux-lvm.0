Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011291849.eATInOJ22818@webber.adilger.net>
Subject: Re: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
In-Reply-To: <20001129174952.A26362@colombina.comedia.it> "from Luca Berra at
 Nov 29, 2000 05:49:52 pm"
Date: Wed, 29 Nov 2000 11:49:23 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: John DeFranco <defranco@cup.hp.com>

Luca writes:
> you should apply the attached patch

Heinz, I believe this patch was also included in my 0.8 patchset, but
was dropped from 0.8.1...

Cheers, Andreas
===========================================================================
--- lib/pv_get_size.c.bluca	Mon Nov 13 01:20:11 2000
+++ lib/pv_get_size.c	Sun Nov 26 10:53:09 2000
@@ -87,6 +87,7 @@
       goto pv_get_size_end;
    }
 
+   memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
    if ( ( cache_entry = lvm_dir_cache_find ( dev_name)) != NULL) {
       if ( lvm_check_partitioned_dev ( cache_entry->st_rdev) == TRUE) {
          st_rdev = cache_entry->st_rdev -
@@ -96,14 +97,14 @@
             if ( dir_cache[i].st_rdev == st_rdev)
                break;
          }
-      }
+         strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
+      } else {
+         strncpy ( disk_dev_name, dev_name, sizeof ( disk_dev_name) - 1);
+	  }
    } else {
       ret = -LVM_EPV_GET_SIZE_LVM_DIR_CACHE;
       goto pv_get_size_end;
    }
-
-   memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
-   strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
 
    first = 1;
    if ( ( pv_handle = open ( disk_dev_name, O_RDONLY)) == -1) {
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
