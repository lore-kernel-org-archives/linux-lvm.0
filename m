Return-Path: <Thierry_DANJEAN@coface.com>
Message-ID: <OF40000665.5AD9BBC9-ONC1256A93.0052DCBF@coface.com>
From: Thierry_DANJEAN@coface.com
Date: Tue, 24 Jul 2001 17:09:56 +0200
MIME-Version: 1.0
Content-transfer-encoding: quoted-printable
Subject: [linux-lvm] unresolved SYMBOL get_hardblocksize during modules generation
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Good afternoon,

I am trying to build 2.4.7 kernel with lvm-0.9.1_beta7-2.4.7.patch and =
I
have this error during modules build :

gcc -D__KERNEL__ -I/usr/src/linux-2.4.7/include -Wall -Wstrict-prototyp=
es
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-commo=
n
-pipe -mpreferred-stack-boundary=3D2 -march=3Di686 -DMODULE -DMODVERSIO=
NS
-include /usr/src/linux-2.4.7/include/linux/modversions.h   -c -o lvm.o=

lvm.c
lvm.c: In function `__update_hardblocksize':
lvm.c:1794: warning: implicit declaration of function `get_hardblocksiz=
e'

I don't find in the kernel tree directory this function, is it a proble=
m
with the LVM patch or the level of the kernel.

Thanks by advance to help to achieve the build of this kernel.

Regards.

T. DANJEAN

-----------------------------------------------------------------------=
---
Pour  s=E9curiser  le commerce inter-entreprises, traditionnel ou sur l=
e web,
le  Groupe  Coface  propose  @rating,  premier  syst=E8me mondial de no=
tation
d'entreprises accessible sur Internet au http://www.cofacerating.com

In   order   to   make   e-commerce   or  traditional  business-to-busi=
ness
transactions  safe,  the  Coface  Group offers @rating, the first insur=
able
business rating on the web at http://www.cofacerating.com
=
