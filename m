From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Mon, 10 Sep 2001 15:49:01 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15gPU0-0000f3-00@hermes.sistina.com> <20010910154309.A15329@sistina.com>
In-Reply-To: <20010910154309.A15329@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E15gRQ2-0003mT-00@hermes.sistina.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Heinz J . Mauelshagen, on Montag, 10. September 2001 15:43 wrote:
> On Mon, Sep 10, 2001 at 01:45:02PM +0200, FEJF wrote:
> > Heinz J . Mauelshagen, on Montag, 10. September 2001 13:27 wrote:
> > > Ragnar,
> > >
> > > typically a dying source device will cause read to fail (~line 520
> > > in pv_move_pe.c). This could be easily addressed by an 'ignore read
> > > errors' option and a fallback to BLOCK_SIZEed I/O in order to avoid as
> > > much data losses as possible.
> > >
> > > But I wonder, why in your case the locking of the PE failed. Are you
> > > able to reporduce your case and provide the error code?
> >
> > as the harddisc makes scary noise and i "loose" it after some hours
> > without and reboot. and have to wait a day or so to get it back. i think
> > it's a serious harddisc problem combined with some heat problem or so...
>
> Maybe switching to operator beer cooling might help ;-)

baught an extra cooler for the harddisc... but didn't help... but now i have 
a fan for the operator while getting the beer out of the fridge :)
fejf

- -- 
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nMTR7Xtp66ctWuIRAp3OAKDM0dCKEcMySeK5OC9Ygu4tZd5ziACcCQiM
B9/m5t2DOCEP08pACc8VR4Q=
=pj6f
-----END PGP SIGNATURE-----
