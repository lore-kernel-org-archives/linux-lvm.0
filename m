Subject: Re: [PATCH2] [linux-lvm] vgchange -a memory consumption
From: Daniel Stodden <daniel.stodden@citrix.com>
In-Reply-To: <20080716174240.GN7155@agk.fab.redhat.com>
References: <1215842251.3751.53.camel@desktop>
	<20080712165145.GC7155@agk.fab.redhat.com>
	<1216102784.3751.78.camel@desktop> <1216226892.1130.3.camel@desktop>
	<20080716165243.GM7155@agk.fab.redhat.com>
	<1216228176.1130.13.camel@desktop>
	<20080716174240.GN7155@agk.fab.redhat.com>
Content-Type: multipart/mixed; boundary="=-jp+axK7B5+p0q99pbLcz"
Date: Wed, 16 Jul 2008 13:39:57 -0700
Message-Id: <1216240797.18076.9.camel@smithers>
Mime-Version: 1.0
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: Linux LVM <linux-lvm@redhat.com>


--=-jp+axK7B5+p0q99pbLcz
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Hi.

On Wed, 2008-07-16 at 18:42 +0100, Alasdair G Kergon wrote:
> Quick way for starters, is allocate a pointless object in the pool
> then free eveything back to that point each time round the loop.
> 
> But proper thing is to track down into the library and find
> which routines are the ones where the pool can be freed at
> the end and isn't being.
> 
> IOW where are most of those allocations happening?
> 
> Alasdair

Okay. Unless we really find a better way to do it, here is the suggested marker version.

As far as I can tell so far, this works equally well.

Best,
Daniel

--=-jp+axK7B5+p0q99pbLcz
Content-Disposition: attachment; filename=lvm2-vgchange-mem.diff
Content-Type: text/x-patch; name=lvm2-vgchange-mem.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

diff -r f79956e87d1d -r 6a69ebd5ade1 tools/vgchange.c
--- a/tools/vgchange.c	Mon Jul 14 18:16:03 2008 -0700
+++ b/tools/vgchange.c	Wed Jul 16 13:15:32 2008 -0700
@@ -57,10 +57,17 @@ static int _activate_lvs_in_vg(struct cm
 	struct lv_list *lvl;
 	struct logical_volume *lv;
 	const char *pvname;
+	void *marker;
 	int count = 0;
 
 	list_iterate_items(lvl, &vg->lvs) {
 		lv = lvl->lv;
+
+		marker = dm_pool_alloc(cmd->mem, 1);
+		if (!marker) {
+			log_error("Out of memory");
+			return count;
+		}
 
 		/* Only request activation of snapshot origin devices */
 		if ((lv->status & SNAPSHOT) || lv_is_cow(lv))
@@ -98,6 +105,8 @@ static int _activate_lvs_in_vg(struct cm
 			pvmove_poll(cmd, pvname, 1);
 			continue;
 		}
+
+		dm_pool_free(cmd->mem, marker);
 
 		count++;
 	}

--=-jp+axK7B5+p0q99pbLcz--
