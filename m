Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2VHQWO03462
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 12:26:32 -0500
Received: from parcelfarce.linux.theplanet.co.uk
	(IDENT:93@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2VHQVGh027530
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 12:26:31 -0500
Date: Thu, 31 Mar 2005 09:23:46 -0300
From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Message-ID: <20050331122346.GD7969@logos.cnet>
References: <Pine.LNX.4.62.0503171716050.20670@twinlark.arctic.org>
	<Pine.LNX.4.62.0503301550220.30657@twinlark.arctic.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.62.0503301550220.30657@twinlark.arctic.org>
Subject: [linux-lvm] Re: [patch] oops with snapshot / 2.4.29
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
To: dean gaudet <dean-list-linux-lvm@arctic.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 30, 2005 at 03:56:19PM -0800, dean gaudet wrote:
> having looked at the oops below and studied the code a bit more i think 
> that the safest thing to do for 2.4.x to fix this race condition is to get 
> rid of the unsafe promote-to-front hash list traversal.  i considered 
> other fixes (such as a separate spinlock for just the hash list, or a 
> small array of them to give some amount of concurrency) ... but in the 
> interests of stability the following patch seems the most appropriate.
> 
> besides... nobody has responded to my mail, so perhaps proposing this 
> patch to marcelo will cause folks to wake up and object :)
> 
> -dean
> 
> Signed-off-by: dean gaudet <dean@arctic.org>
> 
> --- linux-2.4.29/drivers/md/lvm-snap.c.orig	2005-03-25 22:03:43.000000000 -0800
> +++ linux-2.4.29/drivers/md/lvm-snap.c	2005-03-30 01:46:17.000000000 -0800
> @@ -119,7 +119,6 @@ static inline lv_block_exception_t *lvm_
>  	unsigned long mask = lv->lv_snapshot_hash_mask;
>  	int chunk_size = lv->lv_chunk_size;
>  	lv_block_exception_t *ret;
> -	int i = 0;
>  
>  	hash_table =
>  	    &hash_table[hashfn(org_dev, org_start, mask, chunk_size)];
> @@ -132,15 +131,9 @@ static inline lv_block_exception_t *lvm_
>  		exception = list_entry(next, lv_block_exception_t, hash);
>  		if (exception->rsector_org == org_start &&
>  		    exception->rdev_org == org_dev) {
> -			if (i) {
> -				/* fun, isn't it? :) */
> -				list_del(next);
> -				list_add(next, hash_table);
> -			}
>  			ret = exception;
>  			break;
>  		}
> -		i++;
>  	}
>  	return ret;
>  }

Hi dean, 

The hash table write is not performed anymore (ie your suggestion is already in).

D 1.15 05/01/26 13:01:33-02:00 mauelshagen@redhat.com[marcelo] 16 15 0/7/750
P drivers/md/lvm-snap.c
C fix panics while backing up LVM snapshots


===== lvm-snap.c 1.14 vs 1.15 =====
--- 1.14/drivers/md/lvm-snap.c	2004-03-13 02:25:25 -03:00
+++ 1.15/drivers/md/lvm-snap.c	2005-01-26 13:01:33 -02:00
@@ -119,7 +119,6 @@
 	unsigned long mask = lv->lv_snapshot_hash_mask;
 	int chunk_size = lv->lv_chunk_size;
 	lv_block_exception_t *ret;
-	int i = 0;
 
 	hash_table =
 	    &hash_table[hashfn(org_dev, org_start, mask, chunk_size)];
@@ -132,15 +131,9 @@
 		exception = list_entry(next, lv_block_exception_t, hash);
 		if (exception->rsector_org == org_start &&
 		    exception->rdev_org == org_dev) {
-			if (i) {
-				/* fun, isn't it? :) */
-				list_del(next);
-				list_add(next, hash_table);
-			}
 			ret = exception;
 			break;
 		}
-		i++;
 	}
 	return ret;
 }
