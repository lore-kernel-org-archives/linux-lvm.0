From: Jan Niehusmann <list039@gondor.com>
Subject: [jan@gondor.com: Re: [linux-lvm] pvmove hangs]
Message-ID: <20030822120536.GA10882@gondor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
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
Date: Fri Aug 22 10:22:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

...forwarding this to the list, to avoid duplication of work in case
somebody else but Alasdair working on that matter.

The warnings still apply, it's only marginally tested (I actually loaded
the modules and did a pvmove, but did nothing else with them)

This patch would not have been possible without Alasdair finding the
cause of the problem.

Jan


--J/dobhs11T7y2rNN
Content-Type: message/rfc822
Content-Disposition: inline

Date: Fri, 22 Aug 2003 02:14:27 +0200
From: Jan Niehusmann <jan@gondor.com>
To: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030822001427.GA7962@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com> <20030818185719.C29420@uk.sistina.com> <20030818225358.GA1712@gondor.com> <20030819225130.GA1758@gondor.com> <20030821230147.U29420@uk.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline
In-Reply-To: <20030821230147.U29420@uk.sistina.com>
X-Request-PGP: http://gondor.com/key.asc
User-Agent: Mutt/1.5.4i


--MnLPg7ZWsaic7Fhd
Content-Type: multipart/mixed; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2003 at 11:01:47PM +0100, Alasdair G Kergon wrote:
> [off list]
ok

I thought about the realloc problem. It's basically only a problem
because=20
a) dm_table is a table and not a linked list (so it needs to move when
it grows)

and

b) the elements contained in dm_table, namely dm_target object, are
directly referenced by the mirror_set structures, which do not get
updated on dm_table reallocs.


So, to solve the problem, one could change a) or b), or use the standard
solution in computer science: add another layer of indirection.

I think the last option would be quite easy to implement:=20
In struct dm_table, change dm_target *targets to dm_target **targets,
and make it an array (table) of pointers instead of a table of
dm_targets.

So if you resize the table, the actual dm_target structs don't move in
memory. So b) is not a problem any more. And the array of pointers can
be moved without problems, because it's only accessed from the dm_table
structure, which gets updated properly.

As the dm code is well structured, that change would be localised to
dm-table.c. See the attached patch for an example. But be warned. I just
wrote it and checked that it compiles, it may not even boot, or may
cause severe corruption...

Jan


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dm-table.c.diff"
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.21/drivers/md/dm-table.c.orig	2003-08-22 01:42:35.000000000 +=
0200
+++ linux-2.4.21/drivers/md/dm-table.c	2003-08-22 02:10:29.000000000 +0200
@@ -30,7 +30,7 @@
 	unsigned int num_targets;
 	unsigned int num_allocated;
 	sector_t *highs;
-	struct dm_target *targets;
+	struct dm_target **targets;
=20
 	/*
 	 * Indicates the rw permissions for the new logical
@@ -120,18 +120,19 @@
 static int alloc_targets(struct dm_table *t, unsigned int num)
 {
 	sector_t *n_highs;
-	struct dm_target *n_targets;
+	struct dm_target **n_targets;
 	int n =3D t->num_targets;
+	unsigned int i;
=20
 	/*
 	 * Allocate both the target array and offset array at once.
 	 */
-	n_highs =3D (sector_t *) vcalloc(sizeof(struct dm_target) +
+	n_highs =3D (sector_t *) vcalloc(sizeof(struct dm_target *) +
 				       sizeof(sector_t), num);
 	if (!n_highs)
 		return -ENOMEM;
=20
-	n_targets =3D (struct dm_target *) (n_highs + num);
+	n_targets =3D (struct dm_target **) (n_highs + num);
=20
 	if (n) {
 		memcpy(n_highs, t->highs, sizeof(*n_highs) * n);
@@ -141,6 +142,18 @@
 	memset(n_highs + n, -1, sizeof(*n_highs) * (num - n));
 	vfree(t->highs);
=20
+	for(i=3Dn; i<num; i++) {
+		*(n_targets+i)=3Dvcalloc(sizeof(struct dm_target),1);
+		if(!n_highs) break;
+	}
+	if(i!=3Dnum) { // Could not alloc all dm_targets
+		for(i--;i>n; i--) {
+			vfree(*(n_targets+i));
+		}
+		vfree(n_highs);
+		return -ENOMEM;
+	}
+
 	t->num_allocated =3D num;
 	t->highs =3D n_highs;
 	t->targets =3D n_targets;
@@ -192,12 +205,13 @@
=20
 	/* free the targets */
 	for (i =3D 0; i < t->num_targets; i++) {
-		struct dm_target *tgt =3D t->targets + i;
+		struct dm_target *tgt =3D *(t->targets + i);
=20
 		if (tgt->type->dtr)
 			tgt->type->dtr(tgt);
=20
 		dm_put_target_type(tgt->type);
+		vfree(tgt);
 	}
=20
 	vfree(t->highs);
@@ -437,7 +451,7 @@
 	if (!table->num_targets)
 		return !ti->begin;
=20
-	prev =3D &table->targets[table->num_targets - 1];
+	prev =3D table->targets[table->num_targets - 1];
 	return (ti->begin =3D=3D (prev->begin + prev->len));
 }
=20
@@ -521,7 +535,7 @@
 	if ((r =3D check_space(t)))
 		return r;
=20
-	tgt =3D t->targets + t->num_targets;
+	tgt =3D *(t->targets + t->num_targets);
 	memset(tgt, 0, sizeof(*tgt));
=20
 	tgt->type =3D dm_get_target_type(type);
@@ -640,7 +654,7 @@
 	if (index > t->num_targets)
 		return NULL;
=20
-	return t->targets + index;
+	return *(t->targets + index);
 }
=20
 /*
@@ -660,7 +674,7 @@
 				break;
 	}
=20
-	return &t->targets[(KEYS_PER_NODE * n) + k];
+	return t->targets[(KEYS_PER_NODE * n) + k];
 }
=20
 unsigned int dm_table_get_num_targets(struct dm_table *t)
@@ -683,7 +697,7 @@
 	int i;
=20
 	for (i =3D 0; i < t->num_targets; i++) {
-		struct dm_target *ti =3D t->targets + i;
+		struct dm_target *ti =3D *(t->targets + i);
=20
 		if (ti->type->suspend)
 			ti->type->suspend(ti);
@@ -695,7 +709,7 @@
 	int i;
=20
 	for (i =3D 0; i < t->num_targets; i++) {
-		struct dm_target *ti =3D t->targets + i;
+		struct dm_target *ti =3D *(t->targets + i);
=20
 		if (ti->type->resume)
 			ti->type->resume(ti);

--0ntfKIWw70PvrIHh--

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/RWBjnIUccvEtoGURAs6hAJ9QDPUEFs8qXDO81cJMams6+tU+UQCgt4WR
aQWKyWPAThvOtq9N9cYgJrA=
=bw8p
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

--J/dobhs11T7y2rNN--
