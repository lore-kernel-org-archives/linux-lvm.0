Message-ID: <20040127001252.A21930@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] Re: LVM2 + Linux 2.6.1 questions
References: <web-216233373@mail01.infosat.net> <yw1xektm3edc.fsf@ford.guide>
Mime-Version: 1.0
In-Reply-To: =?iso-8859-1?Q?=3Cyw1xektm3edc=2Efsf=40ford=2Eguide=3E=3B_from_M=E5ns_Ru?=
 =?iso-8859-1?Q?llg=E5rd_on_Mon=2C_Jan_26=2C_2004_at_04:42:55PM_+0100?=
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
Date: Tue Jan 27 00:14:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

M=E5ns Rullg=E5rd <mru@kth.se> wrote:
> > 2) Why do I see, for example, a /dev/mapper/v01-home entry,
> > instead of /dev/v01/home, when running 'df' and 'mount'?  I
> > see that /dev/mapper/v01/home symlinks to
> > /dev/mapper/v01-home, which must account for this, though I
> > thought that because I'd specified /dev/v01/home, that it'd
> > appear as such?  Not that this really matters I suppose ;-)
>=20
> I see the /dev/vg/link name.

Mine shows /dev/mapper/vg-link too.  I would definitely prefer
/dev/vg/link because at least it's not implementation dependent... but
I guess it's mostly an aesthetic thing.

Any idea why yours is different?  Different version of mount maybe?
Using mount-2.11z here...

Later,
Navin.
