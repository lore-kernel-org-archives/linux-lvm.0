Subject: Re: [linux-lvm] Oops when running snapshots
From: Andrew Patterson <andrew.patterson@fc.hp.com>
In-Reply-To: <20040112143507.GK15034@software.plasmon.com>
References: <20040105103500.GA7540@software.plasmon.com>
	 <20040112143507.GK15034@software.plasmon.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/EijGygjDHo4LFPQ5Duy"
Message-Id: <1074018946.627.19.camel@bluto.andrew>
Mime-Version: 1.0
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
Date: Wed Jan 14 08:37:04 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: smcintyre@software.plasmon.com

--=-/EijGygjDHo4LFPQ5Duy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-01-12 at 07:35, Steve McIntyre wrote:
> On Mon, Jan 05, 2004 at 10:35:00AM +0000, Me @ Plasmon wrote:
> >Has there been any progress on the issue reported by Andrew Patterson
> >in
> >
> >http://lists.sistina.com/pipermail/linux-lvm/2003-July/014422.html
> >
> >???
>=20
> Apparently not. Should I expect a response here, or ask on the main
> kernel list?


We worked over this problem with Heinz on LVM 1.07.  One of our kernel
hackers (along with Heinz) came up with several possible solutions to a
race condition in the snapshot code.  They are presented below.  We
found that option #1 worked, but sometimes it could take a long time to
create multiple snapshots of the same LV under extremely heavy load.=20
The first snapshot is fine, but the second or more can take hours.=20
Option #2 created a huge performance penalty to writes on the original
LV (90-99%).  I don't remember that option #3 helped any, and we never
tried #4.  We settled with option #1 and solved the long snapshot
creation time by stopping I/O while creating the snapshot.

The LVM snapshot problem is the same one I had with the nfs export hash
table (classic reader/writer problem).  Read and write semaphores are
being
used to allow concurrent read access to the snapshot hash table while
allowing exclusive write access.  However, lvm_snapshot_remap_block ->
lvm_find_exception_table does the hash table optimization (i.e. writing
to the hash table) regardless of whether the read or write semaphore is
held.

The snapshot hash table has 128K entries, so there's
more potential for performance improvement. Here's the call tree for
lvm_find_exception_table:

lvm_find_exception_table
- lvm_snapshot_remap_block
-- __remap_snapshot
-- _remap_snapshot
-- lvm_map

lvm_map, _remap_snapshot, and __remap_snapshot all call
lvm_snapshot_remap_block. =20

1) lvm_map=20
lvm_map() {
   down_read(&lv->lv_lock)
   ...
   if (lvm_snapshot_remap_block(...))
   ...
   up_read(&lv->lv_lock)
}

This is bad, because lvm_snapshot_remap_block will call
lvm_find_exception_table, which could write to the hash table while only
holding the read semaphore during the optimization step.

2) _remap_snapshot + __remap_snapshot

lvm_map() {
   down_read(&lv->lv_lock)
   ...
   _remap_snapshot() {
     down_read(&lv->lock)  // again!
     r =3D lvm_snapshot_remap_block()
     up_read(&lv->lock)
     if (!r)
        __remap_snapshot() {
           down_write(&lv->lock)  // good idea, but we already hold
read!
              if (!lvm_snapshot_remap_block()) {}
           up_write(&lv->lock)
        }
   }
   up_read(&lv->lv_lock)
}

This is bad, because down_read(&lv->lock) is called twice unnecessarily.
Also, lvm_snapshot_remap_block will still possibly write to the hash
table
while only holding the read semaphore.  I don't know how
lvm_map->_remap_snapshot->__remap_snapshot works at all.  down_write
should
block until all the readers have released the semaphore.  Since this
kernel
process already holds the read semaphore, it should never get the chance
to
get the write semaphore.

Options to fix (included as attachments and inline):

1) don't do the hash table optimization in lvm_find_exception_table,
which
we tried last night.  No crashes, but slow.  Doesn't fix the "get the
write
semaphore while holding the read semaphore" problem in
__remap_snapshot().

--- lvm-snap.c~ Mon Aug 25 15:28:50 2003
+++ lvm-snap.c-erik     Thu Aug 28 13:33:28 2003
@@ -130,11 +130,13 @@ static inline lv_block_exception_t *lvm_
                exception =3D list_entry(next, lv_block_exception_t,
hash);
                if (exception->rsector_org =3D=3D org_start &&
                    exception->rdev_org =3D=3D org_dev) {
+#if 0
                        if (i) {
                                /* fun, isn't it? :) */
                                list_del(next);
                                list_add(next, hash_table);
                        }
+#endif
                        ret =3D exception;
                        break;
                }

2) clean up the locking: always get write semaphore before going into
lvm_snapshot_remap_block, realize we already hold the read semaphore:

--- lvm.c~      Fri Aug 29 13:56:26 2003
+++ lvm.c-erik  Fri Aug 29 14:08:30 2003
@@ -1183,6 +1183,7 @@ static void __remap_snapshot(kdev_t rdev
 {

        /* copy a chunk from the origin to a snapshot device */
+       up_read(&lv->lv_lock);
        down_write(&lv->lv_lock);

        /* we must redo lvm_snapshot_remap_block in order to avoid a
@@ -1192,6 +1193,7 @@ static void __remap_snapshot(kdev_t rdev
                lvm_write_COW_table_block(vg, lv);

        up_write(&lv->lv_lock);
+       down_read(&lv->lv_lock);
 }

 static inline void _remap_snapshot(kdev_t rdev, ulong rsector,
@@ -1200,9 +1202,11 @@ static inline void _remap_snapshot(kdev_
        int r;

        /* check to see if this chunk is already in the snapshot */
-       down_read(&lv->lv_lock);
-       r =3D lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
        up_read(&lv->lv_lock);
+       down_write(&lv->lv_lock);
+       r =3D lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
+       up_write(&lv->lv_lock);
+       down_read(&lv->lv_lock);

        if (!r)
                /* we haven't yet copied this block to the snapshot */
@@ -1340,9 +1344,16 @@ static int lvm_map(struct buffer_head *b
                goto out;

        if (lv->lv_access & LV_SNAPSHOT) {      /* remap snapshot */
+               up_read(&lv->lv_lock);
+               down_write(&lv->lv_lock);
                if (lvm_snapshot_remap_block(&rdev_map, &rsector_map,
-                                            pe_start, lv) < 0)
+                                            pe_start, lv) < 0) {
+                       up_write(&lv->lv_lock);
+                       down_read(&lv->lv_lock);
                        goto bad;
+               }
+               up_write(&lv->lv_lock);
+               down_read(&lv->lv_lock);

        } else if (rw =3D=3D WRITE || rw =3D=3D WRITEA) {       /* snapshot
origin
*/
                lv_t *snap;

3) clean up the locking: grab the write semaphore in lvm_map and don't
get any other semaphores.  This isn't recommended and I'm sure Heinz
will cry when he sees this.  This defeats much of the purpose of having
separate read and write semaphores, and lvm_map might will hold the
write semaphore for a long time.  This will kill concurrent access to a
volume, and will probably hurt performance.

--- lvm.c~      Fri Aug 29 13:56:26 2003
+++ lvm.c-erik  Fri Aug 29 14:16:01 2003
@@ -1183,7 +1183,6 @@ static void __remap_snapshot(kdev_t rdev
 {

        /* copy a chunk from the origin to a snapshot device */
-       down_write(&lv->lv_lock);

        /* we must redo lvm_snapshot_remap_block in order to avoid a
           race condition in the gap where no lock was held */
@@ -1191,7 +1190,6 @@ static void __remap_snapshot(kdev_t rdev
            !lvm_snapshot_COW(rdev, rsector, pe_start, rsector, vg, lv))
                lvm_write_COW_table_block(vg, lv);

-       up_write(&lv->lv_lock);
 }

 static inline void _remap_snapshot(kdev_t rdev, ulong rsector,
@@ -1200,9 +1198,7 @@ static inline void _remap_snapshot(kdev_
        int r;

        /* check to see if this chunk is already in the snapshot */
-       down_read(&lv->lv_lock);
        r =3D lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
-       up_read(&lv->lv_lock);

        if (!r)
                /* we haven't yet copied this block to the snapshot */
@@ -1253,7 +1249,7 @@ static int lvm_map(struct buffer_head *b
        lv_t *lv =3D vg_this->lv[LV_BLK(minor)];


-       down_read(&lv->lv_lock);
+       down_write(&lv->lv_lock);
        if (!(lv->lv_status & LV_ACTIVE)) {
                printk(KERN_ALERT
                       "%s - lvm_map: ll_rw_blk for inactive LV %s\n",
@@ -1327,7 +1323,7 @@ static int lvm_map(struct buffer_head *b
                if (_defer_extent(bh, rw, rdev_map,
                                  rsector_map, vg_this->pe_size)) {

-                       up_read(&lv->lv_lock);
+                       up_write(&lv->lv_lock);
                        return 0;
                }

@@ -1365,13 +1361,13 @@ static int lvm_map(struct buffer_head *b
       out:
        bh->b_rdev =3D rdev_map;
        bh->b_rsector =3D rsector_map;
-       up_read(&lv->lv_lock);
+       up_write(&lv->lv_lock);
        return 1;

       bad:
        if (bh->b_end_io)
                buffer_IO_error(bh);
-       up_read(&lv->lv_lock);
+       up_write(&lv->lv_lock);
        return -1;
 }                              /* lvm_map() */

4) in lvm_snapshot_remap_block, somehow determine if we hold the read
semaphore and magically turn it into a write semaphore before doing the
optimization.  I'm not going to attempt this one.


--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
Andrew Patterson                Voice:  (970) 898-3261
Hewlett-Packard Company         Email:  andrew@fc.hp.com



--=-/EijGygjDHo4LFPQ5Duy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBABDqBoKXgdXvblSgRAqO9AJ9npm+abUuvfwq64gsOaOPlEC/iBQCg0Wnw
7YVKp5LTqDCNfSD9QqY2d5o=
=w8Nx
-----END PGP SIGNATURE-----

--=-/EijGygjDHo4LFPQ5Duy--
