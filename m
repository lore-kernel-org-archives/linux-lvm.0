Return-Path: <bluca@comedia.it>
Date: Wed, 29 Nov 2000 17:49:52 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
Message-ID: <20001129174952.A26362@colombina.comedia.it>
References: <3A247D53.E3B78F60@cup.hp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <3A247D53.E3B78F60@cup.hp.com>; from defranco@cup.hp.com on Tue, Nov 28, 2000 at 07:51:47PM -0800
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
To: John DeFranco <defranco@cup.hp.com>
Cc: linux-lvm@sistina.com

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 28, 2000 at 07:51:47PM -0800, John DeFranco wrote:
> Hi,
> 
> I'm having a problem doing a pvcreate on a raid
> device. It fails with:
you should apply the attached patch
but thre is another problem:
vgscan will fail in pv_read
since pv_read.c contains a line which makes it fail if the device is an
me device.

0.8.1 has the same line, but pvread s not calle d by vgscan :)

heinz is there any reason for the code in pv-read.c to exist?

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

--cWoXeonUoKmBZSoM
Content-Type: message/rfc822
Content-Disposition: inline

Return-Path: <bluca@vodka.it>
Delivered-To: bluca@comedia.it
Received: from Moskowskaya.vodka.it (Moskowskaya.vodka.it [213.246.0.200])
	by colombina.comedia.it (Postfix) with ESMTP id D04DB506D
	for <bluca@comedia.it>; Sun, 26 Nov 2000 10:04:12 +0000 ()
Received: by Moskowskaya.vodka.it (Postfix, from userid 500)
	id 575EDCB15; Sun, 26 Nov 2000 11:04:04 +0100 (CET)
Date: Sun, 26 Nov 2000 11:04:04 +0100
From: Luca Berra <bluca@vodka.it>
To: bluca@comedia.it
Subject: LVM09
Message-ID: <20001126110404.A11052@Moskowskaya.vodka.it>
Reply-To: bluca@vodka.it
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
User-Agent: Mutt/1.2.5i
X-Operating-System: Linux Moskowskaya 2.4.0-test8 i586
Return-Receipt-To: bluca@vodka.it


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


-- 
Luca Berra -- bluca@vodka.it
    PGP/GPG Public keys available via keyservers
      DSA: DA24 D16D 05FE A144 7762  BAF8 9307 A167 64C6 3A61
      ElG: 0429 0E81 F546 A3F5 726A  4789 802B 3464 48DF A653
      RSA: 6E 85 91 CA 4D 3B 36 2D  7F DB B1 39 D8 99 CC E6


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="LVM-0.9-lib-pv_get_size.diff"

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

--u3/rZRmxL6MmkK24--

--cWoXeonUoKmBZSoM--
