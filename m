Message-ID: <20021025095211.GA1724@fib011235813.fsnet.co.uk>
References: <20021023102503.GA25925@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021023102503.GA25925@fib011235813.fsnet.co.uk>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: [Patch] Latest device-mapper snapshot
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
Date: Fri Oct 25 04:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Mailing List <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com, Alan Cox <alan@redhat.com>
Cc: christophe.varoqui@free.fr

Doh !

# [Device-mapper]
# Forgot a bio_put()
# --------------------------------------------
#
diff -Nru a/drivers/md/dm.c b/drivers/md/dm.c
--- a/drivers/md/dm.c	Fri Oct 25 10:47:49 2002
+++ b/drivers/md/dm.c	Fri Oct 25 10:47:49 2002
@@ -270,8 +270,10 @@
 	 * finished.  If a partial io errors I'm assuming it won't
 	 * be requeued.  FIXME: check this.
 	 */
-	if (error || !bio->bi_size)
+	if (error || !bio->bi_size) {
 		dec_pending(io, error);
+		bio_put(bio);
+	}
 
 	return 0;
 }
