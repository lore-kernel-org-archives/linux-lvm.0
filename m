Date: Thu, 6 Sep 2001 22:05:14 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010906220514.A1537@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15f13v-0003bs-00@hermes.sistina.com>; from fejf@gmx.de on Thu, Sep 06, 2001 at 05:28:04PM +0200
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

On Thu, Sep 06, 2001 at 05:28:04PM +0200, FEJF wrote:
> hi,
> i search through the mailing list and found this question few times... =
and i=20
> have also this problem atm and i didn't find a solution, i want to ask =
if=20
> there is one now ? or perhaps will installing of lvm1.0.1-rc2 help (cur=
rently=20
> using 0.9.1_beta7) ?
>=20
> root@bolm:[/x] # pvmove /dev/hdh1
> pvmove -- moving physical extents in active volume group "vg01"
> pvmove -- WARNING: if you lose power during the move you may need to re=
store=20
> your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- ERROR reading input physical volume "/dev/hdh1" (still 65536 =
bytes=20
> to read)
>=20
> pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
>=20
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

This could be because of a disk-error. Do you have io-errors in
/var/log/messages?

If so, you will have to modify pvmove to not give up after read-errors.

Maybe a '--ignore-read-errors' option should be added?


--=20
Ragnar Kj=F8rstad
Big Storage
