From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Re: pvcreate dumping core with 2.4.10-pre9
Date: Sun, 16 Sep 2001 08:36:57 -0400
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org>
In-Reply-To: <20010916025223.1CA035E041@oscar.casa.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010916123658.3D52A14E29@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, dwchin@umich.edu

On September 15, 2001 10:52 pm, Ed Tomlinson wrote:
> On September 15, 2001 10:07 pm, dwchin@umich.edu wrote:
> > Oh, a couple of details: I'm running RedHat 7.1 (except for the kernel
> > update as mentioned in previous message).  And gdb says that lvcreate is
> > getting a segmentation fault at lv_create_remove.c:42
> >
> > 42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
>
> I suspect this _might_ have something to do with the mix/max changes in
> 2.4.10pre9. In 2.4.10pre Linus changed min/max to use three args - he had
> good reasons to do this.  It created lots of flack.  After days (weeks?) of
> debate a two arg version he accepted was found.  Meanwhile the rest of the
> kernel (and patches like LVM) had adpated to the three arg mix/max.
>
> The jist of the above it to look at the LVM patch generated for 2.4.10pre9
> and change and lines begining with "+" that contain "min(" or "max(" to
> "min_t(" or "max_t(" respectivily.
>
> Suspect then it will work - I am testing this here now.

And it works fine...  Here are the fragraments changed. 
 
+       if (old_lv->lv_stripes < 2) {   /* linear logical volume */
+               end = min_t(uint, old_lv->lv_current_le, new_lv->lv_current_le);
+               for (l = 0; l < end; l++) {

+               new_stripe_size = new_lv->lv_allocated_le / new_lv->lv_stripes;
+               end = min_t(uint, old_stripe_size, new_stripe_size);
+
+               for (i = source = dest = 0; i < new_lv->lv_stripes; i++) {

-       min_blksize = min(blksize_org, blksize_snap);
+       max_blksize = max_t(int, blksize_org, blksize_snap);
+       min_blksize = min_t(int, blksize_org, blksize_snap);
        max_sectors = KIO_MAX_SECTORS * (min_blksize>>9);

-               nr_sectors = min(chunk_size, max_sectors);
+               nr_sectors = min_t(int, chunk_size, max_sectors);
                chunk_size -= nr_sectors;

-       buckets = min(buckets, max_buckets);
+       buckets = min_t(unsigned long, buckets, max_buckets);
        while (buckets & (buckets-1))

Luck.

Ed Tomlinson
