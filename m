From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002180712.IAA21315@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] __ll_rw_block(): more generalized q->make_request_fn()
Date: Fri, 18 Feb 2000 08:12:29 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@transmeta.com, mingo@redhat.com, linux-kernel@vger.rutgers.edu
Cc: mge@ez-darmstadt.telekom.de, andrea@suse.de, linux-lvm@msede.com


Hi Linus and Ingo,

heading for  a more generalized make_request_fn()/generic_make_request()
calling convention in __ll_rw_block(), which helps us to avoid to implement
stacking support in each volume driver (like MD, LVM and POOL), i propose
the following changes to 2.3.46 ll_rw_blk.c.

Ingo: can MD deal with that as well?
Linus: comments?


--- linux-2.3.46.orig/drivers/block/ll_rw_blk.c	Thu Feb 17 23:10:39 2000
+++ linux-2.3.46/drivers/block/ll_rw_blk.c	Fri Feb 18 01:13:20 2000
@@ -1029,14 +1031,16 @@
 		}
 		set_bit(BH_Req, &bh[i]->b_state);
 
-		if (q->make_request_fn)
+ 		/* loop thru all make request functions until we don't
+		   hit a volume driver any longer */
+	        q = blk_get_queue(bh[i]->b_dev);
+		bh[i]->b_rdev = bh[i]->b_dev;
+		bh[i]->b_rsector = bh[i]->b_blocknr*(bh[i]->b_size>>9);
+		while ( q->make_request_fn) {
 			q->make_request_fn(rw, bh[i]);
-		else {
-			bh[i]->b_rdev = bh[i]->b_dev;
-			bh[i]->b_rsector = bh[i]->b_blocknr*(bh[i]->b_size>>9);
-
-			generic_make_request(rw, bh[i]);
-		}
+			q = blk_get_queue(bh[i]->b_rdev);
+		}
+		generic_make_request(rw, bh[i]);
	}
 
	return;

BTW: I have deleted cosmetic changes i needed to avoid compile stoppers in
     other places i made.


Heinz
-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
