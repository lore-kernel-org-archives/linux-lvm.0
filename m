Date: Sun, 23 Sep 2001 12:43:36 +0200 (MET DST)
From: Thomas Svedberg <thsv@math.chalmers.se>
Message-ID: <Pine.SOL.4.30.0109231230550.22127-100000@napier.math.chalmers.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Lost VG after failed pvmove
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

I know, I should have made a backup. But I didn't so ...

Short version:
After a failed pvmove I can not find my VG.

Long version:
I was about to move more parts of my fs over to LVm and therefore used a
new disk as help. And apparantly the wrong way.
I first created a PV on the new disk and then added it to my VG, no
problems.
I then shrank the LV:s to fit the new disk. OK
Next I pvmoved the LV:s from the original disk to the new one, still no
problems.
Then I removed the different PV from the original disk (I had started ot
with a small one and then moved LV over to LVM one after the other and
adding the freed spacce to the VG), removed the partitions and created on=
e
new big one instead of all the small.
pvcreated it and vgextended it, all OK.
So now I wanted to move the data back to this (faster) disk.
pvmove failed after moving a few (24 ?, see below) LE (PE?).

The fs seemed OK and I rebooted to see if it helped. No
After reboot no VG was found.
pvdisplay showed the newly added (destination of the move) PV as new, i.e.
not belonging to any VG.

Using vgcfgresore I was able to make the PV look like it belonged to my
VG, but it looks empty still.

Still nothing is found by vgscan.

Reading through the howto I found the Dangerous Operations and did as
described there. Now vgscan finds my VG but it says:

vgscan -- only found 1357 of 1381 LEs for LV /dev/my_vg/home (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get =
data of volume group "my_vg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "=
/etc/lvmtab" and "/etc/lvmtab.d"

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "my_vg"

so it seems the 24 LE:s that was moved is 'missing'

Can anyone help me restore this ?

And, yes, next time I will be using tar to move my data....

/ Thomas
.......................................................................
 Thomas Svedberg
 Department of Mathematics
 Chalmers University of Technology

 Address: SE-412 96 G=F6teborg, SWEDEN
 E-mail : thsv@bigfoot.com, thsv@math.chalmers.se
 Phone  : +46 31 772 5368
 Fax    : +46 31 772 3595
.......................................................................
