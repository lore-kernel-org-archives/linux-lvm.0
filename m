Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101121859.f0CIxwf23470@webber.adilger.net>
Subject: Re: [linux-lvm] how can I init LVM on software RAID  ?
In-Reply-To: <3A5EE491.5E4FB886@lxco.com> "from J|rgen Frank at Jan 12, 2001
 12:03:45 pm"
Date: Fri, 12 Jan 2001 11:59:58 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Juergen writes:
> I want to create the following system :
> 
> I use the new kernel (2.4) and I want to use the software raid and the
> lvm, but my problem is... how ?

You need to patch the user tools to allow this, (patch is cut-n-paste so
you will have to apply by hand).

--- ./tools/lib/pv_get_size.c.bluca.orig        Sat Dec 23 11:23:30 2000
+++ ./tools/lib/pv_get_size.c   Sat Dec 23 14:27:47 2000
@@ -97,6 +97,7 @@
             if ( dir_cache[i].st_rdev == st_rdev)
                break;
          }
+         strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof (
disk_dev_name
) - 1);
       } else {
          strncpy ( disk_dev_name, dev_name, sizeof ( disk_dev_name) - 1);
       }
@@ -104,8 +105,6 @@
       ret = -LVM_EPV_GET_SIZE_LVM_DIR_CACHE;
       goto pv_get_size_end;
    }
-
-   strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) -
    1)
;
 
    first = 1;
    if ( ( pv_handle = open ( disk_dev_name, O_RDONLY)) == -1) {




> * normally now I need to create a partition on the drive , but I read in
> the raid docu that the md-drives don't support partitions !!!
> 
> But, without a partiton of the type 0x8e I can't run vgscan and
> pvcreate...

You can run pvcreate on a whole drive, but only with the above patch.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
