Return-Path: <plpm@mapfre.com>
Message-ID: <D339456E76CDD211BC7300A0C9A28E30013B8414@SES000900-017>
From: "Paniagua Moreno, Pedro Luis" <plpm@mapfre.com>
Date: Tue, 22 May 2001 10:36:51 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C0E29A.58E641E0"
Subject: [linux-lvm] Problems applying lvm patches for kernel 2.4.4
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C0E29A.58E641E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello:
	I'm having a problem with a patched 2.4.4 kernel updated with
patches for LVM 0.91beta7. This is the message I get when I load =
lvm-mod:
	[root@ues023921-002 /root]# insmod lvm-mod
	Using /lib/modules/2.4.4/kernel/drivers/md/lvm-mod.o
	/lib/modules/2.4.4/kernel/drivers/md/lvm-mod.o: unresolved symbol
get_hardblocksize

	And here's my environment:
	=B7 RedHat 7.0+kernel 2.4.4 from www.kernel.org
	=B7 LVM 0.91beta_7 (upgraded from LVM 0.8):
		lvm-iop10-0.9.1_beta7-1
		lvm-iop10-lib-0.9.1_beta7-1
		lvm-iop10-man-0.9.1_beta7-1
		lvm-base-1.1-1
		lvm-iop10-patchgen-0.9.1_beta7-1
	I followed all the steps on upgrading the LVM software as well as
the kernel patcher. Here is the Makefile I touched according to the
instructions:
 <<Makefile>>=20
	I also did the rc.sysinit update in order to get VG's activated at
boot time.
	Before I patched the kernel, I succesfully managed to create a VG,
LV, f/s, etc. Just this message on dmesg looks strange to me:
	May 21 16:45:49 ues023921-002 kernel: LVM version 0.9.1_beta2  by
Heinz Mauelsha
	gen  (18/01/2001)
	May 21 16:45:49 ues023921-002 kernel: lvm -- Module successfully
initialized
	May 21 16:45:49 ues023921-002 kernel: lvm -- lvm_chr_ioctl: unknown
command 4004
	fe0a

	Well, this is all for the moment. I will try hacking a bit to try to
guess anything more. Any help will be appreciated.

Thanks in advance
> 			 Pedro Luis Paniagua Moreno=20
> 			MAPFRE AMERICA
> 			Inform=E1tica - Area T=E9cnica
> 			Tel: (+34) 915 81 50 18
> 			Fax: (+34) 915 81 11 19
> 			e-mail: plpm@mapfre.com
>=20
>=20

------_=_NextPart_000_01C0E29A.58E641E0
Content-Type: application/octet-stream;
	name="Makefile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Makefile"

# Generated automatically from Makefile.in by configure.=0A=
# Makefile=0A=
#=0A=
# Copyright (C)  1997 - 2000  Heinz Mauelshagen, Germany=0A=
#=0A=
# February 1997=0A=
# May 1998=0A=
#=0A=
# lvm is free software; you can redistribute it and/or modify=0A=
# it under the terms of the GNU General Public License as published =
by=0A=
# the Free Software Foundation; either version 2, or (at your =
option)=0A=
# any later version.=0A=
# =0A=
# lvm is distributed in the hope that it will be useful,=0A=
# but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
# GNU General Public License for more details.=0A=
# =0A=
# You should have received a copy of the GNU General Public License=0A=
# along with GNU CC; see the file COPYING.  If not, write to=0A=
# the Free Software Foundation, 59 Temple Place - Suite 330,=0A=
# Boston, MA 02111-1307, USA. =0A=
#=0A=
=0A=
# The following 3 vars are set up by autoconf=0A=
KERNEL_DIR=3D/home/plpani/linux=0A=
LVM_VERSION=3D0.9.1_beta7=0A=
KERNEL_VERSION=3D2.4.4=0A=
=0A=
DRIVER_DIR=3D../kernel=0A=
CLEANED_DIR=3Dcleaned=0A=
CLEANER=3D../scripts/select_version=0A=
PATCHER=3D../scripts/patch_fragment=0A=
FRAGGER=3D../scripts/select_fragments=0A=
LVM_PATCH=3D./lvm-$(LVM_VERSION)-$(KERNEL_VERSION).patch=0A=
=0A=
ifneq (,$(findstring 2.2,$(KERNEL_VERSION)))=0A=
K_DRIVER_DIR=3D$(KERNEL_DIR)/drivers/block=0A=
else=0A=
K_DRIVER_DIR=3D$(KERNEL_DIR)/drivers/md=0A=
endif=0A=
=0A=
$(LVM_PATCH): \=0A=
	check_rawio \=0A=
	$(CLEANED_DIR)/lvm.h \=0A=
	$(CLEANED_DIR)/lvm-internal.h \=0A=
	$(CLEANED_DIR)/lvm.c	\=0A=
	$(CLEANED_DIR)/lvm-snap.c \=0A=
	$(CLEANED_DIR)/lvm-fs.c =0A=
	$(PATCHER) $(KERNEL_DIR) $(KERNEL_DIR)/include/linux/lvm.h =
$(CLEANED_DIR)/lvm.h > $@=0A=
	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm.c $(CLEANED_DIR)/lvm.c >> =
$@=0A=
	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-internal.h =
$(CLEANED_DIR)/lvm-internal.h >> $@=0A=
	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-snap.c =
$(CLEANED_DIR)/lvm-snap.c >> $@=0A=
	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-fs.c =
$(CLEANED_DIR)/lvm-fs.c >> $@=0A=
	$(FRAGGER) $(KERNEL_VERSION) >> $@=0A=
=0A=
$(CLEANED_DIR)/lvm.h: $(DRIVER_DIR)/lvm.h cleaned=0A=
	$(CLEANER) $(KERNEL_VERSION) < $< > $@=0A=
=0A=
$(CLEANED_DIR)/lvm.c: $(DRIVER_DIR)/lvm.c cleaned=0A=
	$(CLEANER) $(KERNEL_VERSION) < $< > $@=0A=
=0A=
$(CLEANED_DIR)/lvm-internal.h: $(DRIVER_DIR)/lvm-internal.h cleaned=0A=
	$(CLEANER) $(KERNEL_VERSION) < $< > $@=0A=
=0A=
$(CLEANED_DIR)/lvm-snap.c: $(DRIVER_DIR)/lvm-snap.c cleaned=0A=
	$(CLEANER) $(KERNEL_VERSION) < $< > $@=0A=
=0A=
$(CLEANED_DIR)/lvm-fs.c: $(DRIVER_DIR)/lvm-fs.c cleaned=0A=
	$(CLEANER) $(KERNEL_VERSION) < $< > $@=0A=
=0A=
cleaned:=0A=
	mkdir cleaned=0A=
=0A=
clean:=0A=
	rm -f $(CLEANED_DIR)/*=0A=
	rm -f $(LVM_PATCH)=0A=
=0A=
distclean: clean=0A=
	rm -f Makefile=0A=
=0A=
check_rawio:=0A=
	@[ -e $(KERNEL_DIR)/include/linux/iobuf.h ] || \=0A=
	(echo "You haven't applied the rawio patch, please see the =
README";\=0A=
	 exit 1;)=0A=
=0A=

------_=_NextPart_000_01C0E29A.58E641E0--
