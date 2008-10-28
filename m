Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9SKpM42001798
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 16:51:23 -0400
Message-Id: <0BD82213-C21F-4D83-9A52-F791564C7636@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <E1KuR1d-00031r-QR@odzwierny2.comarch.com>
Content-Type: multipart/mixed; boundary=Apple-Mail-30--40784959
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Tue, 28 Oct 2008 15:50:34 -0500
References: <E1KuR1d-00031r-QR@odzwierny2.comarch.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-30--40784959
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

On Oct 27, 2008, at 7:17 AM, Marcin Ka=C5=82u=C5=BCa wrote:

> Hi,
> Well, that's not much of help since after it becomes invalid I'll =20
> know it
> anyway (IO error ;D), so the event is purely informational.


Well, I've thrown together a quick patch that should give you what you =20=

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


--Apple-Mail-30--40784959
Content-Disposition: attachment;
	filename=snap.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="snap.patch"
Content-Transfer-Encoding: 7bit

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index b2d9d1a..f827c2a 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -890,6 +890,17 @@ static void pending_complete(struct dm_snap_pending_exception *pe, int success)
 
 	up_write(&s->lock);
 
+	if ((s->event_percent) && s->store.fraction_full) {
+		sector_t numerator, denominator;
+		snap->store.fraction_full(&snap->store, &numerator,
+					  &denominator);
+		numerator *= 100;
+		if (s->event_percent < dm_sector_div_up(numerator, denominator)) {
+			s->event_percent = 0;
+			dm_table_event(s->ti->table);
+		}
+	}
+
 	/* Submit any pending write bios */
 	if (error)
 		error_bios(snapshot_bios);
@@ -1151,6 +1162,31 @@ static int snapshot_status(struct dm_target *ti, status_type_t type,
 	return 0;
 }
 
+static int snapshot_message(struct dm_target *ti, unsigned argc, char **argv)
+{
+	struct dm_snapshot *snap = ti->private;
+
+	if (argc != 2) {
+		DMERR("Message to snapshot received, but two args are required");
+		return 0;
+	}
+
+	if (strncmp(argv[0], "notify")) {
+		DMERR("Message to snapshot received, but should be 'notify <%%>'");
+		return 0;
+	}
+
+	if (sscanf(argv[1], "%d", &snap->event_percent) != 1) {
+		DMERR("Message to snapshot received, but should be 'notify <%%>'");
+		return 0;
+	}
+
+	if ((snap->event_percent < 0) || (snap->event_percent > 99)) {
+		DMERR("Invalid notification percentage to snapshot - resetting to 0");
+		snap->event_percent = 0;
+	}
+}
+
 /*-----------------------------------------------------------------
  * Origin methods
  *---------------------------------------------------------------*/
@@ -1382,6 +1418,7 @@ static struct target_type snapshot_target = {
 	.end_io  = snapshot_end_io,
 	.resume  = snapshot_resume,
 	.status  = snapshot_status,
+	.message = snapshot_message,
 };
 
 static int __init dm_snapshot_init(void)
diff --git a/drivers/md/dm-snap.h b/drivers/md/dm-snap.h
index f07315f..15ed4c1 100644
--- a/drivers/md/dm-snap.h
+++ b/drivers/md/dm-snap.h
@@ -149,7 +149,8 @@ struct dm_snapshot {
 	chunk_t chunk_mask;
 	chunk_t chunk_shift;
 
-	/* You can't use a snapshot if this is 0 (e.g. if full) */
+	/* You can't use a snapshot if 'valid' is 0 (e.g. if full) */
+	int event_percent;
 	int valid;
 
 	/* Origin writes don't trigger exceptions until this is set */

--Apple-Mail-30--40784959
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7bit





--Apple-Mail-30--40784959--
