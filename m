MIME-Version: 1.0
In-Reply-To: <20131017151828.GB28859@redhat.com>
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
	<20131017151828.GB28859@redhat.com>
Date: Fri, 18 Oct 2013 10:56:57 +0300
Message-ID: <CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>
From: Ugis <ugis22@gmail.com>
Subject: Re: [linux-lvm] poor read performance on rbd+LVM, LVM overload
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>, Sage Weil <sage@inktank.com>, linux-lvm@redhat.com

> Ugis, please provide the output of:
>
> RBD_DEVICE=<rbd device name>
> pvs -o pe_start $RBD_DEVICE
> cat /sys/block/$RBD_DEVICE/queue/minimum_io_size
> cat /sys/block/$RBD_DEVICE/queue/optimal_io_size
>
> The 'pvs' command will tell you where LVM aligned the start of the data
> area (which follows the LVM metadata area).  Hopefully it reflects what
> was published in sysfs for rbd's striping.

output follows:
#pvs -o pe_start /dev/rbd1p1
  1st PE
    4.00m
# cat /sys/block/rbd1/queue/minimum_io_size
4194304
# cat /sys/block/rbd1/queue/optimal_io_size
4194304

Seems correct in terms of ceph-LVM io parameter negotiation? I wonded
about gpt header+PV metadata - it makes some shift starting from ceph
1st block beginning. Does this mean that all following LVM 4m data
blocks are shifted by this part and span 2 ceph objects?
If so, performance will be affected.

Ugis
