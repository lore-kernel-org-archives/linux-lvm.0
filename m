Message-ID: <3DB7C2FD.9C70E084@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] still problems with removing "non existant" dead snapshots :/
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
Date: Thu Oct 24 04:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm mailinglist <linux-lvm@sistina.com>

I take a snapshot every hour, every 8 hour, eveyr day, and every week.
I've got 4 "equal" scripts to do the work, the only difference is the
snapshot name and the mountpoint.

However, when i try to remove the old and unmounted snapshot, i
sometimes
get an error message. Like one in every 10 times.

I get messages like:
--------------------
lvremove -- can't remove open snapshot logical volume
"/dev/optVG/1hour_snapshot_opt_1035237601"

And:
----
lvremove -- ERROR "lv_release(): LV number" releasing logical volume
"/dev/optVG/1hour_snapshot_opt_1035324001"


If i use lvdisplay on them, i get a message like
------------------------------------------------
ve:/dev/optVG# lvdisplay /dev/optVG/1hour_snapshot_opt_1035*
lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035324001"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035345601"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035352801"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035381601"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035410401"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035432001"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035439201"
doesn't exist



The problem is that these snapshots take up space. Most take 1GB, since
thats what they
are created with, but some take more, since i run some scripts to ensure
that they dont
reach 100% so they are always readable.
I can remove the "files" from /dev/optVG/, but the space is not released
until i
restart the VG. Even restarting the VG doesnt remove the "dead"
snapshots (the files
in /dev/optVG/)



JonB
