From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Mon, 10 Sep 2001 01:51:37 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15fJux-0005Kk-00@hermes.sistina.com> <20010910001643.A19424@vestdata.no>
In-Reply-To: <20010910001643.A19424@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <E15gELn-0004OG-00@hermes.sistina.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ragnar Kj=EF=BF=BDrstad, on Montag, 10. September 2001 00:16 wrote:
> OK, this is the patch.

thx, for your help, but meanwhile i got one from Holger Grothe.
sorry, but i haven't had time to post it earlier. i do it now because it ha=
s=20
some advantages...

tools/lib/pv_move.c:

replace:
            fprintf ( stderr, "%s -- ERROR reading input "
                     "physical volume \"%s\" (still %d bytes to read)\n    =
  =20
                      cmd, vg->pv[src_pv_index]->pv_name, size);
            pe_unlock ( vg->vg_name);
            ret =3D -LVM_EPV_MOVE_PE_READ_IN;
            goto pv_move_pe_end;
with:
           fprintf ( stderr, "read: %ld, to_read %ld\n", red, to_read);
           memset(buffer,170,to_read);
           red=3Dto_read;

with 170 u can chosse with which chars the bad block should be replaced wit=
h.=20
(you can search filez for them later if u want - and have enough time ;)

tools/pvmove.c:

replace:
	int buffer_size =3D 64*1024;
with:  =20
	int buffer_size =3D 512;

this is an advantage to your patch, because pvmove then copys only 512=20
byte-blocks and if there's only one block damaged u don't loose 64kb data. =

this has one disadvantage: it's SLOW... and slower than that ;)
so change the source and do a static compiling:
./configure --enable-static_link ; make
u can then use the normal pvmove to move your partitions and if there is an=
=20
error u can use the (patched) tools/pvmove program for bad-block moving.
worked find for me and i saw that only one 512 byte block was damaged.
fejf

ps: i used lvm 0.9.1b7 but it should look and work similar with other=20
versions but i think a diff is not the best for it ;)
- --=20
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nACM7Xtp66ctWuIRAgg7AKCBCVB/SPRCLjP9i5oHuf6vgx1u9wCeOmzP
ky+sZgdG6iVcPrN9Ufgl5L8=3D
=3DMfig
-----END PGP SIGNATURE-----
