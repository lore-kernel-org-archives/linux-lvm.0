From: =?ISO-8859-1?Q?Bj=F6rn?= Medin <b.medin@telia.com>
Message-Id: <1053855014.15745.10.camel@crux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] PV and disk recovery
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
Date: Sun May 25 04:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,

I had a VG with two full disks in two PV:s (/dev/hda1 and /dev/hdb1).
The second drive, a new IBM 120GB disk fried after some weeks and
was totally inacessable (not even recognised by BIOS).

To my understanding the first PV on /dev/hda1 is OK

Can I recover and get back access to my old data that was on
/dev/hda1? I have tried various things suggested in HOWTO:s and
this list.

If I do vgscan I get:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "Volume00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

Any command like vgchange -a y only gets: vgchange -- no volume groups
found

I have tried create a new VG: vgcreate extra /dev/hda1

but I then get:
vgcreate -- "/dev/hda1" is not a new physical volume
vgcreate -- physical volume "/dev/hda1" already belongs to volume group
"Volume00"

-----------

Seems like I dont have any config data for Volume00 left but still I am
not allowed to use/change Volume00 or the PV.

What can I do? Is there any way to reclaim possible intact data on my
old /dev/hda1????

Thanks!

/Bj=C3=B6rn
