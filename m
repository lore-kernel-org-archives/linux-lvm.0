Message-ID: <3BF4F055.DD18E13E@LTUtech.com>
From: Igor Dumaire <Igor.Dumaire@LTUtech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VG is not found !
References: <Pine.LNX.4.33.0111152011520.24310-100000@dragon.inside.ntisys.com>
Content-Transfer-Encoding: quoted-printable
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
Date: Fri Nov 16 04:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I can see all drives :
# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hda1 [      70.57 MB] Primary  LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hda2 [      19.07 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/hda5 [       2.01 GB] Extended LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hda6 [       1.00 GB] Extended LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hda7 [       1.00 GB] Extended LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hda8 [     517.69 MB] Extended LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hda9 [      14.55 GB] Extended LINUX native partition=
 [0x83]
lvmdiskscan -- /dev/hdc1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdd1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hde1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdf1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdg1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdh1 [      57.27 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- 7 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 13 partitions
lvmdiskscan -- 6 LVM physical volume partitions

I can see volume group "lvm2" but not "lvm1"=20
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "lvm2"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

I can display lvm2 info
# vgdisplay lvm2
--- Volume group ---
VG Name               lvm2
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               171.79 GB
PE Size               4.00 MB
Total PE              43977
Alloc PE / Size       43776 / 171.00 GB
Free  PE / Size       201 / 804.00 MB
VG UUID               Jp3gDv-ib7D-p5te-FFLZ-lNjI-5brK-fzjEM6

but, not lvm1 info !
# vgdisplay lvm1
vgdisplay -- volume group "lvm1" not found

So, What do I do?

Thanks,


Benjamin Scott a =E9crit :
>=20
> On Thu, 15 Nov 2001, Igor Dumaire wrote:
> > I had created 2 VG and worked sometime with its. I have stopped the
> > server and at the reboot the first VG have disappeared ! The second i=
t's
> > OK !!
>=20
>   Start with these commands:
>=20
>         lvmdiskscan
>         vgscan
>         vgdisplay
>         vgchange -ay
>=20
>   Do not just blindly try the commands if you are not familiar with the=
m;
> read the manual pages first.  Try the '--verbose' switch with each for =
more
> info.
>=20
--=20
Igor Dumaire

www.LTUtech.com - Making Sense of Visual Content
------------------------------------------------
