Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BF36@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] logical volumes extending beyond 1 machine
Date: Thu, 7 Jun 2001 11:11:10 -0600
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

10Tb!  I'm working on a database that is 369Gb and I'm having to fight =
a few
performance issues.  What database manager are you using?

Thanx,
Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov

> -----Original Message-----
> From: Damon Fasching [mailto:fasching@design.lbl.gov]
> Sent: June 07, 2001 10:47 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
>=20
>=20
> On Thu, 7 Jun 2001, Jens Benecke wrote:
>=20
> > On Wed, Jun 06, 2001 at 05:08:47PM -0700, Damon Fasching wrote:
> > >=20
> > > Is it possible using LVM define a logical volume which=20
> includes disks from
> > > more than 1 machine?
> >=20
> > I don't think so. You want NFS for that, or the Mosix GFS=20
> (global file
> > system). Look at www.mosix.org
>=20
> Ah, thanks.  I guess what I was wondering was whether or not an NSF
> mounted disk can be included in a logical volume defined by LVM.  I =
am
> working with a large database, 10 TB, and am curious as to=20
> whether I will
> need to break it up into more than 1 database file.
>=20
> >=20
> > --=20
> > Jens Benecke     No Linux user has a 'Microsoft free=20
> system'. 'make config'
> >                  in the kernel configuration was originally=20
> written by a MS
> > 		 employee.
> > http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale=20
> f=FCr ganz Europa
> >=20
>=20
>     ________________________   ____________________
>    / Damon Fasching         \ /                    \
>   |  University of Wisconsin |  LBNL/MS 50A-6134    |
>   |  phone: (510)486-5230    |  1 Cyclotron Road    |
>   |  fax:   (510)486-5977    |  Berkeley, CA 94720  |
>    \________________________/ \____________________/
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
