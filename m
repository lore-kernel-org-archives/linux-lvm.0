From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
Message-Id: <20020118134554.A794@sistina.com>
References: <200201171229.g0HCTVe10111@localhost.localdomain>
    <3C4793C1.70600@sgi.com>
MIME-Version: 1.0
In-Reply-To: <3C4793C1.70600@sgi.com>; from lord@sgi.com on Thu,
    Jan 17, 2002 at 09:17:21PM -0600
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
Date: Fri Jan 18 06:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 09:17:21PM -0600, Stephen Lord wrote:
> Miguel Angel de Vega wrote:
> 
> >Hi!
> >
> >I've a Dual P2 450 with a Disk Array with 4 scsi disks with XFS.
> >With one single disc I've 10 Mb/s reading and writing, so I think that if I 
> >stripe all disc of the array, it can give me 4x10Mb = 40Mb/s more or less, 
> >but I only gets 10 Mg/s!!  
> >These disks usually gives up to 30 Mg/s in SGI machines and other single scsi 
> >disks in the Dual P2 (with the same controller and XFS) gives 20Mg/s, so i 
> >think that the problem must be LVM (the options maybe??? bad stripped 
> >options??). 
> >
> 
> Because LVM has difficulties dealing with the differing request sizes issued
> by XFS, we feed it requests in small chunks (which means lots of buffer 
> heads).
> XFS has some 512 byte chunks of metadata, it tends to want to do metadata
> I/O in sizes of 512 bytes, 4K, 8K and various random sizes upto 32K for 
> the log writes.
> 
> Since request mapping in LVM basically consists of taking an existing 
> buffer head and
> giving it a different address xfs takes a very conservative approach. 
> Striping with the
> raid code should give you considerably better performance.
> 
> Now if someone would go off and make lvm work with the bio interface in 
> 2.5 things
> might go pretty fast.

Probably true but I am afraid that we will be able to spend much time
on the LVM1 driver in 2.5. The basic bio changes have already been done
AFAIS briefly, but the splitting of large(r) io request onto several extents
hasn't.
We would really appreciate further help ITR.

The new device-mapper driver soon to be released will support those splits
and hopefully will be ready for integration into 2.5 in a couple of weeks.

We'll release it soon plus the new version 2 tools for public testing.

Heinz

> 
> Steve
> 
> >
> >
> >I show how mount all the Logical Volumen:
> >
> >partionated all discs like 8e
> >#pvcreate /dev/sda1 ...
> >#vgcreate test /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1
> >#lvcreate -n stripped -i 4 -I 64 test -L 30000M
> >(I tryed with -I 128, 256 and 512 but not big differences)
> >
> >#mkfs -t xfs /dev/test/stripped  (only supports 4kb of block size)
> >
> >what can be the problem??
> >thanks
> >
> >Miguel Angel de Vega fernandez
> >SGO
> >Madrid - Spain
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
