From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Tr: Possible LVM bug in 2.4.19-rc1
Message-ID: <20020708110703.C24170@sistina.com>
References: <20020705102810.1143@192.168.4.1>
Mime-Version: 1.0
In-Reply-To: <20020705102810.1143@192.168.4.1>; from benh@kernel.crashing.org on Fri, Jul 05, 2002 at 12:28:09PM +0200
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
Date: Mon Jul  8 04:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

FYI: have fixed this OBO error in CVS (Branch LVM_BRANCH_1-0)
     and send a patch for 2.4 to Marcelo.

Thanks to Benjamin and Olaf for pointing this one out :)

Regards,
Heinz    -- The LVM Guy --

On Fri, Jul 05, 2002 at 12:28:09PM +0200, Benjamin Herrenschmidt wrote:
> ---------------- D=E9but du message transmis ----------------
> Sujet: Possible LVM bug in 2.4.19-rc1
> Envoy=E9: jeudi 4 juillet 2002 13:59
> De: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> =C0: linux-kernel@vger.kernel.org
>=20
> Hi !
>=20
> Olaf and I have been tracking down a bug where the kernel died
> into lvm_blk_open() during boot on pmac, and later on other PPCs
> when trying to access an unconfigured LVM block device (or an
> LVM minor not associated yet). This typically happened in the
> pmac root discovery code which walks all gendisks, but I beleive
> there are other possible exploits.
> =20
> Here's what I've tracked down so far:
>=20
>   static int lvm_blk_open(struct inode *inode, struct file *file)
>   {
>   	int minor =3D MINOR(inode->i_rdev);
>   	lv_t *lv_ptr;
>   	vg_t *vg_ptr =3D vg[VG_BLK(minor)];
>=20
>   	P_DEV("blk_open MINOR: %d  VG#: %d  LV#: %d  mode: %s%s\n",
> 	        minor, VG_BLK(minor), LV_BLK(minor),
>   	      MODE_TO_STR(file->f_mode));
>=20
>   #ifdef LVM_TOTAL_RESET
> 	  if (lvm_reset_spindown > 0)
> 	  	return -EPERM;
>   #endif
>=20
>   	if (vg_ptr !=3D NULL &&
>   	    (vg_ptr->vg_status & VG_ACTIVE) &&
>=20
>   .../...
>=20
> At this point, no association have been made. That is VG_BLK(minor)
> will return vg_lv_map[minor].vg_number which has been initialized
> to ABS_MAX_VG in lvm_init_vars().
>=20
> That means that vg_ptr is set to vg[ABS_MAX_VG], which is right outside
> the array bounds, as vg is declared to be
>=20
>   /* volume group descriptor area pointers */
>   vg_t *vg[ABS_MAX_VG];
>=20
> So, as soon as we dereference vg_ptr, we get whatever garbage is locate=
d
> right after the array, and not the NULL value we would expect for a non
> initialized association.
>=20
> If my understanding is correct, then a simple fix would be to
>=20
>   /* volume group descriptor area pointers */
> -  vg_t *vg[ABS_MAX_VG];
> +  vg_t *vg[ABS_MAX_VG+1];
>=20
> though it's a bit hackish... maybe we should just test
> VG_BLK < ABS_MAX_VG
>=20
> Also, the loop initializing vg array to NULL can probably be removed
> from lvm_init_vars as vg is part of the BSS and thus cleared by default.
>=20
> Did I miss something ?
>=20
> Ben.
>=20
> ----------------- Fin du message transmis -----------------
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
