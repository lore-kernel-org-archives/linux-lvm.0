From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] Re: LVM 1.0.3 to LVM 1.0.6 upgrade path on a Redhat 8.0 Production System
Message-Id: <20030219222338.A20156@fb0442.mathematik.tu-darmstadt.de>
References: <F162bThA9QRmzeyNtqM00000625@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <F162bThA9QRmzeyNtqM00000625@hotmail.com>; from djtweeq@hotmail.com on Wed, Feb 19, 2003 at 07:37:18PM +0000
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
Date: Wed Feb 19 15:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Feb 19, 2003 at 07:37:18PM +0000, DJ TweeQ wrote:

> Thanks Christian (really). :) Honestly i did not see any mention of tha=
t in=20
> the documentation in the HOWTO or any of the docs included with LVM. (I=
s it=20
> really there? because i can't see it) :) But a good point nonetheless. =
I=20
                ^^^^^^^^^^^^^^^^^^^^^^
Hard to believe.

Take lvm 1.0.6.=20
- FAQ: Question Q3 and Q9 (and answers).
  Q3: Why am I not able to extend a logical volume?
  Q9: Why are my logical volumes limited to 256 GB in size?
- WHATNEW (What is new in LVM - 1.0.6)
  "o Default PE size for vgcreate is now 32MB"
- man vgcreate
  [...]
     OPTIONS
  [...]
            -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the  physical extent size on physical volumes
              of this volume group.  A size suffix (k  for  kilo=AD
              bytes up to t for terabytes) is optional, megabytes
              is the default if no suffix is present.  Values can
              be  from  8 KB to 16 GB in powers of 2. The default
              of 4 MB causes maximum LV sizes of  ~256GB  because
              as  many  as  ~64k extents are supported per LV. In
              case larger maximum LV sizes  are  needed  (later),
              you  need  to  set the PE size to a larger value as
              well. Later changes of the PE size in  an  existing
              VG are not supported.

> >>You aren't going to get magic-silver-bullet hand-holding support for
> >>free.
>=20
> Thanks allmighty Willy should i bow to you? I wasn't expecting=20
> magic-silver-bullet hand-holding support. I merely asked the list if th=
ere=20
> were any differences or issues with upgrading LVM on a Redhat 8 system =
with=20
> it's latest kernel and if there were any issues or differences with the=
=20
> "normal" lvm upgrade path..and if so could someone mention those=20
> differences. (Anyone have any comments on that in particular?) :) When =
i ask=20
> for help i don't mean magic-silver-bullet hand-holding help. But i help=
=20
> people for free all the time and so can you and if you don't want to it=
=20
> doesn't mean you have to be a smartarse about it. Maybe in your case it=
 does=20
> tho huh. But let me ask you something...does it not feel good to help p=
eople=20
> and make a difference in peoples lives?

Many vendor kernels (e.g Redhat, SuSE) are patched by more than 100=20
patches. This fact makes it difficult to integrate "mainstream patches"=20
from developers in such vendor kernels without pain. To overcome you have=
=20
two (four) realistic choices
  - use a vanilla kernel instead of the vendor kernel
  - ask your vendor for a kernel which fits your needs
(  - change your distribution
   - try to patch the vendor kernel by yourself)

You already got the first two answers.

Holger
--=20
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
