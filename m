Date: Mon, 10 Sep 2001 10:39:52 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010910103952.B31660@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15fJux-0005Kk-00@hermes.sistina.com> <20010910001643.A19424@vestdata.no> <E15gELn-0004OG-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15gELn-0004OG-00@hermes.sistina.com>; from fejf@gmx.de on Mon, Sep 10, 2001 at 01:51:37AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Sep 10, 2001 at 01:51:37AM +0200, FEJF wrote:
> Ragnar Kj=F8rstad, on Montag, 12. September 2001 00:16 wrote:
> > OK, this is the patch.
>=20
> thx, for your help, but meanwhile i got one from Holger Grothe.
> sorry, but i haven't had time to post it earlier. i do it now because i=
t has=20
> some advantages...
>=20
> tools/lib/pv_move.c:
>=20
> replace:
>             fprintf ( stderr, "%s -- ERROR reading input "
>                      "physical volume \"%s\" (still %d bytes to read)\n=
      =20
>                       cmd, vg->pv[src_pv_index]->pv_name, size);
>             pe_unlock ( vg->vg_name);
>             ret =3D -LVM_EPV_MOVE_PE_READ_IN;
>             goto pv_move_pe_end;
> with:
>            fprintf ( stderr, "read: %ld, to_read %ld\n", red, to_read);
>            memset(buffer,170,to_read);
>            red=3Dto_read;
>=20
> with 170 u can chosse with which chars the bad block should be replaced=
 with.=20
> (you can search filez for them later if u want - and have enough time ;=
)

It's better than my patch, but still not "correct":
* In my case pe_lock() failed, so it had to be "removed" as well. Was
  that not the case for you?
* ret=3D=3D-1 and ret<to_read should probably be handled differently.
  * For ret>0 && ret<to_read the regular execution path could be followed.
  * When red=3D=3D-1 there should be a seek on pv[src_pv_index], so the
    possition of the filehandle is set correctly. (now it's undefined)
* maybe red=3DSECTOR_SIZE; would be better? see next comment.

> tools/pvmove.c:
>=20
> replace:
> 	int buffer_size =3D 64*1024;
> with:  =20
> 	int buffer_size =3D 512;
>=20
> this is an advantage to your patch, because pvmove then copys only 512=20
> byte-blocks and if there's only one block damaged u don't loose 64kb da=
ta.=20
> this has one disadvantage: it's SLOW... and slower than that ;)

This is not needed if the read loop is allowed to continue.


It would be great if someone took this patch, made the proposed changes,
and integrated it into the standard tools with an "ingore-read-errors"
flag... hint hint.



--=20
Ragnar Kj=F8rstad
Big Storage
