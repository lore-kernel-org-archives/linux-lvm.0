Return-Path: <ph.l@libertysurf.fr>
Message-ID: <3A5775ED.32380632@libertysurf.fr>
Date: Sat, 06 Jan 2001 18:45:49 -0100
From: Philippe Lefevre <ph.l@libertysurf.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] PB: undefined reference to memset
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

Hello all,

Changing my system release, I patched my kernel 2.2.17 with =

lvm-0.9-2.2.17-stock.patch and linux-2.2.17-rawio.patch
Apparently, there was no errors.

Then compiling my new kernel, I get this message:

drivers/block/block.a(lvm.o): In function `lvm_do_vg_rename':
lvm.o(.text+0x295a): undefined reference to `memset'
lvm.o(.text+0x2972): undefined reference to `memset'
make: *** [vmlinux] Erreur 1

I didn't find the same problem described in the mailing list.

Somebody can help ??

In advance thank you !!
-- =

----------------------------------------------------------------------
Linux 2.2.17 | Philippe Lefevre   E-mail: ph.l@libertysurf.fr |  =3D=B0)
             |                                                |  /\\
----------------------------------------------------------------_\_V--
