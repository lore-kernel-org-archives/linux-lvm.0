Message-ID: <3E64B885.1AF49EDA@silicide.dk>
From: Jon Bendtsen <jon@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Max storage size per system
References: <20030304114851.GA22965@hcsd.de>
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
Date: Tue Mar  4 08:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Stephan Austermuehle wrote:
> =

> Hello,
> =

> what is the absolut maximum storage capacity that can be managed on a
> single Linux 2.4 system with LVM?

man vgcreate
       -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the physical extent size on physical volumes of this
volume group.
              A size suffix (k for kilobytes up  to  t  for  terabytes) =

is  optional,
              megabytes  is the default if no suffix is present.  Values
can be from 8
              KB to 16 GB in powers of 2. The default of 4 MB causes
maximum LV  sizes
              of  ~256GB because as many as ~64k extents are supported
per LV. In case
              larger maximum LV sizes are needed (later), you need to
set the PE  size
              to  a  larger value as well. Later changes of the PE size
in an existing
              VG are not supported.

So, this means you can allocate =

64k * 16G =3D=3D 64*1024 * 16*1024*1024*1024 =3D=3D 1125899906842624 byte=
s =3D=3D
1024Tera Bytes,

Hovever, =

       To limit kernel memory usage, there is a limit of 65536 physical =

extents  (PE)
       per  logical volume, so the PE size determines the maximum
logical volume size.
       The default PE size of 4MB limits a single logical volume to
256GB (see the  -s
       option  to raise that limit).  There is also (as of Linux 2.4) a
kernel limita=AD
       tion of 2TB per block device.

So, this would mean 2TB pr. LV, but there can also be a number of LV's.
I dont remember how many, but proberly a power of 2, like 256 or 64k. =

But wait, there is more...
You can have more than one VG system on your linux (no idea how many, i
have had 2)
So, all in all, i would asume you can have MANY TERABYTES. Possibly
Penta? bytes ?

How much space do you need anyway ?




JonB
