From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Mon, 10 Sep 2001 13:53:53 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15gELn-0004OG-00@hermes.sistina.com> <20010910103952.B31660@vestdata.no>
In-Reply-To: <20010910103952.B31660@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <E15gPgX-0000zK-00@hermes.sistina.com>
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

Ragnar Kj=EF=BF=BDrstad, on Montag, 10. September 2001 10:39 wrote:
[cut]
> It's better than my patch, but still not "correct":
> * In my case pe_lock() failed, so it had to be "removed" as well. Was
>   that not the case for you?
> * ret=3D=3D-1 and ret<to_read should probably be handled differently.
>   * For ret>0 && ret<to_read the regular execution path could be followed.
>   * When red=3D=3D-1 there should be a seek on pv[src_pv_index], so the
>     possition of the filehandle is set correctly. (now it's undefined)
> * maybe red=3DSECTOR_SIZE; would be better? see next comment.

after this msg i search through the syslog:
Aug 29 13:29:20 bolm kernel: hdh: read_intr: error=3D0x40 { UncorrectableEr=
ror=20
}, LBAsect=3D95091302, sector=3D95091239
Aug 29 13:29:20 bolm kernel: end_request: I/O error, dev 22:41 (hdh), secto=
r=20
95091239

what does this locking do ? i mean copying these few remaining bytes took=20
about 10minutes... so perhaps it had problems with locking but skipped it ?=
=20
or would it abort in such a case ?

> > tools/pvmove.c:
> >
> > replace:
> > 	int buffer_size =3D 64*1024;
> > with:
> > 	int buffer_size =3D 512;
> >
> > this is an advantage to your patch, because pvmove then copys only 512
> > byte-blocks and if there's only one block damaged u don't loose 64kb
> > data. this has one disadvantage: it's SLOW... and slower than that ;)
>
> This is not needed if the read loop is allowed to continue.

and it also copies the whole 64kb if only one 512 byte block damaged with=20
only 512 bytes of crap ?

> It would be great if someone took this patch, made the proposed changes,
> and integrated it into the standard tools with an "ingore-read-errors"
> flag... hint hint.

hehe ;)
fejf

- --=20
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nKnR7Xtp66ctWuIRAubiAJ9YHdZez6QGOUut63knCXcc0kf5DQCgrehc
Zyntw0mfYTTKn7se0VJZ7O8=3D
=3D+9/r
-----END PGP SIGNATURE-----
