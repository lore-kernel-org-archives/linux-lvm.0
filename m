From: Jan Niehusmann <list039@gondor.com>
Message-ID: <20030828185843.GA4268@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problems with LVM2 pvmove again
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
Date: Fri Aug 29 07:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com
Cc: Alasdair G Kergon <agk@uk.sistina.com>

Hi!

I see strange failures with devmapper, again.

First some information about my current setup: linux-2.4.22, device-mappe=
r
from current cvs, otherwise it's the same as last time I had problems
with pvmove...

Again, problems were caused by a pvmove /dev/hda4. While the pvmove is
running, reading /dev/vgraid/vmware returned pure nonsense starting at
some point in the middle of the device.

# dmsetup table vgraid-vmware     =20
0 7471104 linear 009:002 65995136
7471104 4194304 linear 254:029 0

The first 7471104 blocks are ok, but then the mapping fails somehow:

# dd if=3D/dev/mapper/vgraid-vmware bs=3D512 skip=3D7471103
[...]
c017c590 T pci_write_config_word
c017c5d0 T pci_write_config_dword
c017c610 T pci_set_master
c017c660 T pci_set_dma_mask
c017c690 T pci_dac_set_dma_maskN=C3=9D=C3=80u=C2=A9n1J=C3=A3rqII=C3=A8^?=C3=
=BF=C3=97=C3=BA<95>-=C2=AEa=C3=9D1=C5=BE8.^K&y#=C2=B0&=C2=B2nn^Ud^?8.p
H\=C3=A5q<9E>=C2=BFZ=C3=86<9B>=C3=84B^F<93>c        ^U=C2=B2<91><9D>=C3=80=
<9C>=C3=A7<81><9A>=C3=A6=C3=AEo=C2=AEg<9C>=C2=B3^_=C3=B5=C3=B8=3DI =C3=BA=
^Q=C3=98}+
=C3=BAV0<94>=C2=B5g=C3=A1<8B>O<81><9D>=C2=A2=C2=A7<9F>=C3=B3F=C3=BB>@=C3=8A=
B=C3=A4(=C3=87@+j=C3=8A9=C2=A3<8B>c;H=C3=98=C3=9F=C3=A7<81><8D>=C3=83=3D*=
-2^X<85><9C>R=C3=8A
=C3=A3n=C3=85F^D<80>rG&=C2=BAKW<86>^T^AB:^F^M<8D>=C3=83<91>=C3=B4=C2=ACe;=
.Tkf=C3=9BM<8B>k+=C3=886H^]UHl<91><8E>=3D=C2=AB=C2=A0=C2=B5{v!]=E2=82=AC

The ASCII parts seems to be the correct content, and the binary stuff=20
starting at block 7471104 is wrong.=20
What is 254:029 in the dmsetup output above? Let's check dmsetup ls:
[...]
vgraid-pvmove0  (254, 29)
[...]

Well, as expected, it's the pvmove device. Let's get the table:

# dmsetup table vgraid-pvmove0
0 4194304 mirror core 1 1024 2 003:004 64288496 009:002 73466240=20
4194304 1245184 linear 003:004 87619312
5439488 98304 linear 003:004 91420400
5537792 2097152 linear 003:004 78640880
7634944 229376 linear 003:004 7370480
7864320 622592 linear 003:004 110524144
8486912 327680 linear 003:004 138508016
8814592 32768 linear 003:004 106002160
[...]

And what's in there?

# dd if=3D/dev/mapper/vgraid-pvmove0 | head

c017c6b0 t pci_size
c017c6d0 t pci_read_bases
c017c8f0 t pci_read_irq
c017c930 T pci_setup_device
c017caa0 t pci_pm_save_state_device
c017cad0 t pci_pm_suspend_device
c017cb00 t pci_pm_resume_device
c017cb20 t pci_pm_save_state_bus
c017cb90 t pci_pm_suspend_bus
[...]

So this looks like the stuff that should be in block 7471104 of
vgraid-vmware. Why does vgraid-vmware show something else?
(BTW, I checked, both /dev/hda4 and /dev/md2 contain the same content as=20
vgraid-pvmove0, ie. the correct content)

Jan
