Message-Id: <200302082303.h18N3fe02097@mailgate5.cinetic.de>
MIME-Version: 1.0
From: =?iso-8859-1?Q?Tim-Patrick=20M=E4rk?= <tpmaerk@web.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] erroneously formatted pv; vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group...
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
Date: Sat Feb  8 17:04:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hello,

yesterday i installed a new HDD and added it to my VG "vg1" (partition id:=
 '8e' + 'pvcreate /dev/hdb1' + 'vgextend vh1 /dev/hdb1').
A bit later I erroneously formatted '/dev/hdb1' by 'mkfs.xfs /dev/hdb1'.
I ran 'vgscan' and 'pvscan' and the made a smiliar output like it is shown=
 on http://lists.sistina.com/pipermail/linux-lvm/2002-August/011947.html -=
 but i have only two PVs in my VG 'vg1': '/dev/hdc1' and '/dev/hdd2'.
I don't remember what i exactly did with '/dev/hdb' after that (it was lat=
e...), but as a result I 'fdisked' the partition table away...
There was no data on '/dev'hdb' (except the LVM metadata), so no 'real' da=
ta needs to be recovered (at least i hope so).

All in all, I can't access the VG 'vg1' (PVs: '/dev/hdc1' + '/dev/hdd2') w=
ith the 3 LVs 'root', 'storage' and 'swap' any more.=20

Now you could advise me to run 'vgcfgrestore', but i regretfully must say =
that i rebooted my box and as the name of the LV 'root' implies, my root-f=
ilesystem was on it, so the system doesn't boot anymore *doh*...

Summary:
- 1 VG: 'vg1'
- 2 (3) PVs: '/dev/hdc1' + '/dev/hdd2' + for a short time (see above) '/de=
v/hdb1'
- 3 LVs: 'root', 'storage' and 'swap'
- filesystem on all LVs: XFS

Fortunately i have a separated 'backup system' on another HDD, which doesn=
't use LVM nor XFS, but simply ext2, so i can work with it temporarily to =
fix this disaster.

I think the problem is, that the VG 'vg1' still thinks, it would consist o=
f 3 PVs, but only 2 are there.
But because no VG is found by 'vgscan' (see link above), i can't remove '/=
dev/hdb1' by 'vgreduce vg1 /dev/hdb1' and so on...

Is there any way to generate metadata for '/dev/hdb1' to make it known by =
'vg1' or remove '/dev/hdb1' from 'vg1'=3F!

I'm very despaired and would be gladdened by every answer. If you need any=
 details, just ask.

Tanks in advance

Tim-Patrick M=E4rk
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F
Ihnen fehlen die richtigen Worte fur Ihre SMS=3F WEB.DE FreeMail hat die
besten Sprueche fur Sie. http://freemail.web.de/features/=3Fmc=3D021169
