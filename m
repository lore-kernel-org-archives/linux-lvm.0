From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Fri, 7 Sep 2001 13:36:16 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15f8l7-0008Di-00@hermes.sistina.com> <20010907114303.C19457@vestdata.no>
In-Reply-To: <20010907114303.C19457@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <E15fJux-0005Kk-00@hermes.sistina.com>
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

Ragnar Kj=EF=BF=BDrstad, on Freitag, 7. September 2001 11:43 wrote:
> On Fri, Sep 07, 2001 at 01:41:22AM +0200, FEJF wrote:
> > there are no io-errors... but as the hd makes really scary noise when
> > pvmove tries to move the remaining bytes. so i think the hd is damaged.
> > but all i want is to remove the damaged hd.
> > but pvreduce says i have to use pvmove to get rid of the remaining data
> > and pvmove gives the errors...
> > so i can't remove it :/ - is there a way to get rid of the hd without
> > destroying the rest of the data ? sth. like pvreduce --force ?
>
> No, don't think so.
>
> I have a patch, but I'm not so sure I can recommend that you use it.
>
> I only wrote it to copy off a single block of a bad disk - I'm not sure
> exactly how it will behave when moving multiple blocks (if the
> non-corrupted blocks will end up in the right spot, or if it writes too
> little data, so it will be some bytes off).

the only thing i fear at the moment is that the hd gets totaly damaged soon=
er=20
or later (if it runs serveral hours i can't access it...) and if it will i =

will loose the whole lvm (about 360gigs) and so i say if there are some fil=
ez=20
corrupted it won't matter that much...
fejf

- --=20
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7mLEz7Xtp66ctWuIRAnNKAKDSYdnAEGSC9w+7SeVu5dWqFs8tVACbBsK9
PS4wZR9k653HkL/YQzocYqQ=3D
=3DXlFo
-----END PGP SIGNATURE-----
