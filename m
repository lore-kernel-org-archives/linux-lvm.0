From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Fri, 7 Sep 2001 01:41:22 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <20010906220514.A1537@vestdata.no>
In-Reply-To: <20010906220514.A1537@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <E15f8l7-0008Di-00@hermes.sistina.com>
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

Ragnar Kj=EF=BF=BDrstad, on Donnerstag, 6. September 2001 22:05 wrote:
> On Thu, Sep 06, 2001 at 05:28:04PM +0200, FEJF wrote:
> > hi,
> > i search through the mailing list and found this question few times...
> > and i have also this problem atm and i didn't find a solution, i want to
> > ask if there is one now ? or perhaps will installing of lvm1.0.1-rc2 he=
lp
> > (currently using 0.9.1_beta7) ?
> >
> > root@bolm:[/x] # pvmove /dev/hdh1
> > pvmove -- moving physical extents in active volume group "vg01"
> > pvmove -- WARNING: if you lose power during the move you may need to
> > restore your LVM metadata from backup!
> > pvmove -- do you want to continue? [y/n] y
> > pvmove -- ERROR reading input physical volume "/dev/hdh1" (still 65536
> > bytes to read)
> >
> > pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> >
> > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
>
> This could be because of a disk-error. Do you have io-errors in
> /var/log/messages?

there are no io-errors... but as the hd makes really scary noise when pvmov=
e=20
tries to move the remaining bytes. so i think the hd is damaged.
but all i want is to remove the damaged hd.
but pvreduce says i have to use pvmove to get rid of the remaining data and=
=20
pvmove gives the errors...
so i can't remove it :/ - is there a way to get rid of the hd without=20
destroying the rest of the data ? sth. like pvreduce --force ?

> If so, you will have to modify pvmove to not give up after read-errors.

how can i do this ? i'm not a coder but if someone has too much time... ;)

> Maybe a '--ignore-read-errors' option should be added?

if there's no other way to get rid of the damaged hd... that would be also =
a=20
way to solve my problem.
btw: could there be a problem with using reiserfs on the lvm ?
=20
mfg, Florian E.J. Fruth

ps: at the moment i try a "dd if=3D/dev/hdh1 of=3D/dev/null" to see if it a=
lso=20
complains about errors...

- --=20
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7mAmk7Xtp66ctWuIRAqdSAJwLKC2Z517hbQow9HX/dKGe+sn9CgCgpWaV
ZRo4gIxtkRLdZAfttoKuJDo=3D
=3DyDmS
-----END PGP SIGNATURE-----
