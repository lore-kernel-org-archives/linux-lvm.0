Message-ID: <4343.193.189.186.50.1043846076.squirrel@webmail.literal.si>
From: "Jure Simsic" <jure.simsic@literal.si>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Unusable VG after a failed pvmove
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
Date: Wed Jan 29 07:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

Last time I had some warnings about  IDE error which indicated that one of
my disks is starting to fail.  So i bought a new one and tried to *pvmove*
the stuff from that disk to a new one.After  pvmoving for a while, I got:

pvmove -- ERROR reading input physical volume "/dev/hda2" (still 786432
bytes to readpvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extends

and the thing stopped. After a couple of minutes, my computer froze
completely (no kbd, no network) - something one knows more from M$ world -
so there was nothing else to do than to power off/on..
When it started, all went ok, untill the LVM part. Then I got this:

vgscan -- found inactive volume group "vg0"
vgscan -- only found 1033 of 1070 LEs for LV /dev/vg0/usr (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg0" from physical volume(s)vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"
vgchange -- no volume groups found


So I'm stuck with / only, my /usr and /home are gone.
If it maters at all, I used to run reiserfs on /usr and /home...

Is there any way I can try to recover from this?

Thanks for any help

Jure
vgscan --
