From: lvm@freakout.de
Message-Id: <200401111044.i0BAiV48002620@bongo.freakout.de>
Subject: [linux-lvm] LVM2 migration on 2.4.24 - prepare for 2.6
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
Date: Sun Jan 11 05:59:01 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

i tried to migrate my system to LVM2 on 2.4 before migration to 2.6
to avoid troubles with LVM. I got the newest device-mapper/LVM2 tools
and installed them alongside with a patched kernel and dm-mod.

When i try to "vgchange -ay" with device-mapper/LVM2 i get all of my lv's
except one! All my snapshots are also corrupt (I use snapshots intensively).

Back to LVM1 was no problem - everything running and Ok. On another
machine without snapshots moving to dm/LVM2 on 2.4.24 was no problem.

Are there incompatibilities regarding snapshots with LVM1/2?
Details, logs, config can be sent on interest.

Regards
Axel Reinhold
