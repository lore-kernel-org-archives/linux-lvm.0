Message-Id: <200112112134.fBBLYNC16014@mailgate5.cinetic.de>
MIME-Version: 1.0
From: <gunther.kuhlmann@web.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvmove killed vg
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
Date: Tue Dec 11 15:32:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi,

I've got a broken lvm vg as a result of an unsuccessful pvmove
command. My system is a SuSE 7.0 with kernel 2.4.4 and
lvm-0.9.1=5Fbeta7-10.=20

The vg spans several partitions on one disks, one of which I=20
wanted to evacuate. I used the pvmove command with chunks of=20
32 PE (=3D 1 GB); 10 GB total. The first 8 chunks worked okay,
but the 9th (pvmove -v /dev/hda8:256-287 /dev/hda10) fell over
with error code 23 while moving the fifth PE. So I checked using
pvdisplay that the four PE had indeed been moved. A further
attempt with pvmove -v /dev/hda8:260-287 /dev/hda10 fell over as
well, again error code 23. (That's error moving physical
extent(s)).=20

I then rebooted the machine which killed the complete volume
group. Which in turn did not quite impress me. :-((

During my attempts at recovering I think I did a vgscan, which
found the vg "vg1" on /dev/hdb, but not the vg "vg0" on /dev/hda.

I tried the following commands unsuccessfully:
- vgcfgrestore -v -n vg0: please enter physical volume name (the
  synopsys of vgcfgrestore did not state it as a mandatory=20
parameter)
- vgcfgrestore -v -n vg0 /dev/hda10: can't restore part of active
volume grout vg0
- vgcfgrestore -v -n vg0 /dev/hda{6,7,8,10}: please enter physical
volume name
- vgchange -a n vg0: volume group vg0 does not exist
- vgchange -a y vg0: volume group vg0 does not exist

I still have the file /etc/lvmconf/vg0.conf.cd as well as the
devices /dev/vg0/lv0{0,1,2,3} and /dev/vg0/group. (And
/dev/vg1/..., but that is working.)

Any suggestions on how I can recover the data would be highly
appreciated. I found a reference to a program called
uuid=5Ffixer/uuid=5Feditor, but usage was discouraged. Do I have to=20
try it
or is there a better way=3F Does upgrading to a newer version of lvm
help=3F Or do I have to update the kernel as well then=3F And I=20
definately
do =5Fnot=5F want to kill my other vg as well.

Regards,

Gunther




=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F
Die sch=F6nsten Ski-Regionen der Alpen - jetzt bei Ferienklick.de
http://ferienklick.de/ski/=3FPP=3D2-5-100-105-38
