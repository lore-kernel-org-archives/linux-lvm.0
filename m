From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pvmove with Bad bocks
Message-ID: <20011021140746.B15468@vestdata.no>
References: <55159047260.20011020155124@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55159047260.20011020155124@gmx.de>; from stonki@gmx.de on Sat, Oct 20, 2001 at 03:51:24PM +0200
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
Date: Sun Oct 21 07:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sat, Oct 20, 2001 at 03:51:24PM +0200, Stonki wrote:
> Hello list, Hello Heinz,
>=20
> on Tuesday you explained me the function of moving data from one
> hard disc to another.
> Well, regarding to Murphies Law... pvmove complains about read errors
> and stops before moving all data.
>=20
> Error reading input physical volume /dev/hdf1 still 393216 bytes to
> read).

If you browse the archive for the last month you will find a couple of
threads on the subject.

I've posted a cruel patch to make pvmove ignore read-errors, and update
the meta-data even if the sector is bad. (The extent will be moved to
the other disk, but contain garbage). With this patch the behaviour is
undefined when moving more than one PE. Other than that, I think it
should work.

Others posted suggestions and possible some patches too - allthough
there was no complete perfect solution, I think you should be able to
make it work from the different tips submitted in the thread.


--=20
Ragnar Kj=F8rstad
Big Storage
