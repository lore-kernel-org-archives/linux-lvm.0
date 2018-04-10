Date: Tue, 10 Apr 2018 15:49:52 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20180410144952.GD2787@redhat.com>
References: <20180410084730.GA9920@redhat.com>
	<20180410140016.GB9920@redhat.com>
	<620b7fac-9b9a-bdc9-6f5b-c3330fb6d429@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <620b7fac-9b9a-bdc9-6f5b-c3330fb6d429@redhat.com>
Subject: Re: [linux-lvm] "Data alignment must not exceed device size."
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On Tue, Apr 10, 2018 at 04:43:12PM +0200, Zdenek Kabelac wrote:
> Dne 10.4.2018 v 16:00 Richard W.M. Jones napsal(a):
> >On Tue, Apr 10, 2018 at 09:47:30AM +0100, Richard W.M. Jones wrote:
> >>Recently in Fedora something changed that stops us from creating small
> >>LVs for testing.
> >>
> >>An example failure with a 64 MB partitioned disk:
> >>
> >># parted -s -- /dev/sda mklabel msdos mkpart primary 128s -128s
> >>Warning: The resulting partition is not properly aligned for best performance: 128s % 65535s != 0s
> >># lvm pvcreate --force /dev/sda1
> >>   /dev/sda1: Data alignment must not exceed device size.
> >>   Format-specific initialisation of physical volume /dev/sda1 failed.
> >>   Failed to setup physical volume "/dev/sda1".
> >
> >Interestingly the alignment properties of the virtio-scsi virtual disk
> >has changed.  On the working system:
> >
> >==> /sys/block/sda/queue/minimum_io_size <==
> >512
> >
> >==> /sys/block/sda/queue/optimal_io_size <==
> >0
> >
> >On the new / broken system:
> >
> >==> /sys/block/sda/queue/minimum_io_size <==
> >33553920
> >
> >==> /sys/block/sda/queue/optimal_io_size <==
> >0
> >
> >(all other settings were the same).  I suppose this accounts for it,
> >and it could therefore be a problem with qemu rather than LVM.
> >
> >Working: qemu-2.11.0-4.fc28.x86_64
> >Broken:  qemu-2.12.0-0.5.rc1.fc29.x86_64
> >
> >Alasdair Kergon asked me to run the lvm command with -vvvv and I've
> >attached those results.
> 
> 
> Hi
> 
> Could you please retest first with official final release of 4.16 kernel.

Same thing with 4.16.0-300.fc28.x86_64:

><rescue> cat /sys/block/sda/queue/minimum_io_size
33553920
><rescue> uname -a
Linux (none) 4.16.0-300.fc28.x86_64 #1 SMP Tue Apr 3 03:44:37 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

I believe the faulty min/max macros were added after 4.16.0.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/
