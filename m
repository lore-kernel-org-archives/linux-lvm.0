From: Jims <theman@chaj.com>
Message-Id: <Pine.LNX.4.33.0204240059210.19617-100000@x.firesites.com>
MIME-Version: 1.0
Subject: [linux-lvm] Lvm woes
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
Date: Tue Apr 23 23:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

One of the drives in my volume group "world" has died. I'd like to restore
as much as possible, but am expecting to lose some data regardless since
the disk is PV#3 out of 7 in total. What I'm trying to do is use
vgcfgrestore (ver .9.1 beta) to at least build up a new PV in the
following manner:

vgcfgrestore -n world -o /dev/sdd1 -n /dev/hdd1

This comes back with errors about the size being different -

vgcfgrestore -- size of physical volume "/dev/hdd1" differs from backup

This version doesn't have the -i (ignore size) ability. If I attempt the
same with the new 1.0.3 binary, it complains of the old
/etc/lvmconf/world.conf being incompatible -

vgcfgrestore -- INFO: using backup file "/etc/lvmconf/world.conf"
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/world.conf" than expected in file vg_cfgrestore.c [line 139]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"world"

probably because the file was created using an old ver.

How do I go about creating the exact same size of the old PV? Vgcfgrestore
-n world -ll reports that it was 4.25gb. I tried creating different file
sizes in fdisk based on this, and then pvcreate, but no go. Can I recreate
the old restore file to be compatible with the new version?

Running kernel 2.2.18 patched up with 1.0.3.

Up a creek. Please assist!

If you could CC my personal mail as well, I'd be most appreciative.

Jims
