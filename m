From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] 250G limit........
In-Reply-To: <005a01c1ca5f$5da91330$3200a8c0@warl0k>
Message-Id: <Pine.LNX.4.44.0203131313520.22485-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Wed Mar 13 07:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Wed, 13 Mar 2002, Glenn Shannon wrote:

> I remember something or other about a 250G per vg limit while I was originally setting up my lvm....does this 250G limit still stand?
>
> If so, are there any future plans to remove it? I just thought it would be interesting to have a full TB on LVM, and I've got the disks to test it/try it/crash it.
>
> :)
>
> Glenn
>
>


bash# vgdisplay
--- Volume group ---
VG Name               sunset_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                6
Open LV               6
MAX LV Size           1.00 TB
Max PV                255
Cur PV                2
Act PV                2
VG Size               46.25 GB
PE Size               32.00 MB
Total PE              1480
Alloc PE / Size       1412 / 44.12 GB
Free  PE / Size       68 / 2.12 GB
VG UUID               HMrqdp-Hf5n-FfCP-5W2D-fyw6-UHcn-MMB7Wr

You can see from this volume group, I set the PE size when it was created
to 32mb This gives me a maximum of 1TB in that volume group.

vgcreate -s <size> ....

From the man page....

       -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the  physical extent size on physical volumes
              of this volume group.  A size suffix (k  for  kilo<AD>
              bytes up to t for terabytes) is optional, megabytes
              is the default if no suffix is present.  Values can
              be  from  8 KB to 16 GB in powers of 2. The default
              of 4 MB causes maximum LV sizes of  ~256GB  because
              as  many  as  ~64k extents are supported per LV. In
              case larger maximum LV sizes  are  needed  (later),
              you  need  to  set the PE size to a larger value as
              well. Later changes of the PE size in  an  existing
              VG are not supported.


Things to note when setting up your PE size, you cannot change this value
LATER so setting a bigger number is better, setting a bigger number is
less efficent with your disk space as odd fractions at the end below the
PE size will be lost. lvm reserves one of your PEs for itself, so to
large a size can be bad.

A large size sets the minimum partition size you can create in my example
32mb I can live with that...

A large size reduces the total table size for a PE (for a give ammount of
disk space), so reduces the lookup  time, and increase the ablitity for
the processor to fit more of it in processor cache, thereby giving fast
lookups.

Setting this value is a "magic" I would suggest for "home" use a value of
16m or 32m is quite appropriate,, but the choice is yours. Its best to
over estimate than under-estimate. If you fill the vg table with PEs you
cannot extend it later.....

James
