From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
References: <200201171229.g0HCTVe10111@localhost.localdomain>
In-Reply-To: <200201171229.g0HCTVe10111@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020117125640.35CF032FDE6@lyta.coker.com.au>
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
Date: Thu Jan 17 06:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Miguel Angel de Vega <mvega@sgo.es>

On Thu, 17 Jan 2002 13:29, Miguel Angel de Vega wrote:
> I've a Dual P2 450 with a Disk Array with 4 scsi disks with XFS.
> With one single disc I've 10 Mb/s reading and writing, so I think that if I
> stripe all disc of the array, it can give me 4x10Mb = 40Mb/s more or less,
> but I only gets 10 Mg/s!!

Striping across 4 disks will never give you 4* the throughput of 1 disk, but 
you would hope for double the throughput.

> These disks usually gives up to 30 Mg/s in SGI machines and other single
> scsi disks in the Dual P2 (with the same controller and XFS) gives 20Mg/s,
> so i think that the problem must be LVM (the options maybe??? bad stripped
> options??).

How are you testing the speed of the disks?

I suggest that you do the following:
Test an ext2 partition on a single unpartitioned disk.
Test an XFS partition on a single unpartitioned disk.
Test XFS on a simple LVM setup (single disk, single LV in the VG).
Test XFS on the 4 disk LVM setup.
Run 2 copies of the test program at the same time on XFS on the 4 disk LVM.
Run 4 copies of the test program at the same time on XFS on the 4 disk LVM.

Then send us all the raw data from the above.  NB Bonnie++ has good support 
for running 2 and 4 copies of the test at the same time.

Also for interest, run zcav (from the Bonnie++ package) on a raw disk to show 
the throughput of the disk (without a file system).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
