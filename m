Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9TB9ovx015036
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 07:09:50 -0400
Received: from odzwierny1.comarch.com (odzwierny1.comarch.com [217.74.69.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9TB9hPM008624
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 07:09:44 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.com
	by odzwierny1.comarch.com with esmtpa (ComArch ESMTP)
	id 1Kv8vk-0006cf-F5
	for linux-lvm@redhat.com; Wed, 29 Oct 2008 12:09:40 +0100
From: =?iso-8859-2?Q?Marcin_Ka=B3u=BFa?= <marcin.kaluza@comarch.pl>
Subject: RE: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Wed, 29 Oct 2008 12:10:41 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0021_01C939BF.5CE35970"
In-Reply-To: <0BD82213-C21F-4D83-9A52-F791564C7636@redhat.com>
Message-Id: <E1Kv8vk-0006cf-F5@odzwierny1.comarch.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0021_01C939BF.5CE35970
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Wow - this was quick ;))

I tried to compile it with kernel-2.6.18-92.1.13.el5.centos.plus kernel =
and
it threw 3 errors:

1)
drivers/md/dm-snap.c:792: error: snap undeclared (first use in this
function)
2)
drivers/md/dm-snap.c:797: error: struct dm_snapshot has no member named =
ti
3)
drivers/md/dm-snap.c: In function snapshot_message:
drivers/md/dm-snap.c:1066: error: too few arguments to function strncmp

1)
There was:
snap->store.fraction_full(&snap->store, &numerator,
and I think it should be
s->store.fraction_full(&s->store, &numerator,

3)
There was
if (strncmp(argv[0], "notify")) {
changed to:
if (strncmp(argv[0], "notify", 6)) {

2)
dm_table_event(s->ti->table);
changed to=20
dm_table_event(s->table);
or should there be "ti" field in the dm_snapshot ?

But now I'm not sure if it'll do what it's meant to do ;)
It compiles. As soon as I set up some test vm with this kernel I'll let =
you
know if it works.

Changed patch is enclosed.

Martin
-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On
Behalf Of Jonathan Brassow
Sent: Tuesday, October 28, 2008 9:51 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] How to monitor and possibly autoextend =
snapshots

On Oct 27, 2008, at 7:17 AM, Marcin Ka=B3u=BFa wrote:

> Hi,
> Well, that's not much of help since after it becomes invalid I'll =20
> know it
> anyway (IO error ;D), so the event is purely informational.


Well, I've thrown together a quick patch that should give you what you =20
want.  (I have not compiled/tested it.)  We'd have to give it more =20
thought for it to become a permanent feature (or get integrated into =20
LVM), but it should be a nice little hack.  If you turn out to like =20
the idea, maybe more discussion will evolve.

You'll have to compile your own kernel with the patch applied, but =20
once you've done so, you should be able to do the following:

# Get snapshot to raise an event when 75% full
prompt> dmsetup message <snapshot device> 0 notify 75
prompt> dmsetup wait <snapshot device>
# Ok, now we are 75% full - let me know when 95% full
prompt> dmsetup message <snapshot device> 0 notify 95
prompt> dmsetup wait <snapshot device>

  brassow


------=_NextPart_000_0021_01C939BF.5CE35970
Content-Type: application/octet-stream;
	name="snap.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="snap.patch"

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index b2d9d1a..f827c2a 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -890,6 +890,17 @@ static void pending_complete(struct =
dm_snap_pending_exception *pe, int success)
=20
 	up_write(&s->lock);
=20
+	if ((s->event_percent) && s->store.fraction_full) {
+		sector_t numerator, denominator;
+		s->store.fraction_full(&s->store, &numerator,
+					  &denominator);
+		numerator *=3D 100;
+		if (s->event_percent < dm_sector_div_up(numerator, denominator)) {
+			s->event_percent =3D 0;
+			dm_table_event(s->table);
+		}
+	}
+
 	/* Submit any pending write bios */
 	if (error)
 		error_bios(snapshot_bios);
@@ -1151,6 +1162,31 @@ static int snapshot_status(struct dm_target *ti, =
status_type_t type,
 	return 0;
 }
=20
+static int snapshot_message(struct dm_target *ti, unsigned argc, char =
**argv)
+{
+	struct dm_snapshot *snap =3D ti->private;
+
+	if (argc !=3D 2) {
+		DMERR("Message to snapshot received, but two args are required");
+		return 0;
+	}
+
+	if (strncmp(argv[0], "notify", 6)) {
+		DMERR("Message to snapshot received, but should be 'notify <%%>'");
+		return 0;
+	}
+
+	if (sscanf(argv[1], "%d", &snap->event_percent) !=3D 1) {
+		DMERR("Message to snapshot received, but should be 'notify <%%>'");
+		return 0;
+	}
+
+	if ((snap->event_percent < 0) || (snap->event_percent > 99)) {
+		DMERR("Invalid notification percentage to snapshot - resetting to =
0");
+		snap->event_percent =3D 0;
+	}
+}
+
 /*-----------------------------------------------------------------
  * Origin methods
  *---------------------------------------------------------------*/
@@ -1382,6 +1418,7 @@ static struct target_type snapshot_target =3D {
 	.end_io  =3D snapshot_end_io,
 	.resume  =3D snapshot_resume,
 	.status  =3D snapshot_status,
+	.message =3D snapshot_message,
 };
=20
 static int __init dm_snapshot_init(void)
diff --git a/drivers/md/dm-snap.h b/drivers/md/dm-snap.h
index f07315f..15ed4c1 100644
--- a/drivers/md/dm-snap.h
+++ b/drivers/md/dm-snap.h
@@ -149,7 +149,8 @@ struct dm_snapshot {
 	chunk_t chunk_mask;
 	chunk_t chunk_shift;
=20
-	/* You can't use a snapshot if this is 0 (e.g. if full) */
+	/* You can't use a snapshot if 'valid' is 0 (e.g. if full) */
+	int event_percent;
 	int valid;
=20
 	/* Origin writes don't trigger exceptions until this is set */

------=_NextPart_000_0021_01C939BF.5CE35970--
