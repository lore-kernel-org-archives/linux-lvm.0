Return-Path: <fasching@design.lbl.gov>
Date: Thu, 7 Jun 2001 09:47:26 -0700 (PDT)
From: Damon Fasching <fasching@design.lbl.gov>
Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
In-Reply-To: <20010607182720.I3232@jensbenecke.de>
Message-ID: <Pine.SOL.3.96.1010607094547.29239A-100000@design.lbl.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, 7 Jun 2001, Jens Benecke wrote:

> On Wed, Jun 06, 2001 at 05:08:47PM -0700, Damon Fasching wrote:
> >=20
> > Is it possible using LVM define a logical volume which includes disks f=
rom
> > more than 1 machine?
>=20
> I don't think so. You want NFS for that, or the Mosix GFS (global file
> system). Look at www.mosix.org

Ah, thanks.  I guess what I was wondering was whether or not an NSF
mounted disk can be included in a logical volume defined by LVM.  I am
working with a large database, 10 TB, and am curious as to whether I will
need to break it up into more than 1 database file.

>=20
> --=20
> Jens Benecke     No Linux user has a 'Microsoft free system'. 'make confi=
g'
>                  in the kernel configuration was originally written by a =
MS
> =09=09 employee.
> http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale f=FCr ganz Eu=
ropa
>=20

    ________________________   ____________________
   / Damon Fasching         \ /                    \
  |  University of Wisconsin |  LBNL/MS 50A-6134    |
  |  phone: (510)486-5230    |  1 Cyclotron Road    |
  |  fax:   (510)486-5977    |  Berkeley, CA 94720  |
   \________________________/ \____________________/
