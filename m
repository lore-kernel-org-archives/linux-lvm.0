Date: Fri, 18 Oct 2013 17:01:27 -0700 (PDT)
From: Sage Weil <sage@inktank.com>
In-Reply-To: <CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1310181657151.19763@cobra.newdream.net>
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
	<20131017151828.GB28859@redhat.com>
	<CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ugis <ugis22@gmail.com>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>, Mike Snitzer <snitzer@redhat.com>, linux-lvm@redhat.com

On Fri, 18 Oct 2013, Ugis wrote:
> > Ugis, please provide the output of:
> >
> > RBD_DEVICE=<rbd device name>
> > pvs -o pe_start $RBD_DEVICE
> > cat /sys/block/$RBD_DEVICE/queue/minimum_io_size
> > cat /sys/block/$RBD_DEVICE/queue/optimal_io_size
> >
> > The 'pvs' command will tell you where LVM aligned the start of the data
> > area (which follows the LVM metadata area).  Hopefully it reflects what
> > was published in sysfs for rbd's striping.
> 
> output follows:
> #pvs -o pe_start /dev/rbd1p1
>   1st PE
>     4.00m
> # cat /sys/block/rbd1/queue/minimum_io_size
> 4194304
> # cat /sys/block/rbd1/queue/optimal_io_size
> 4194304

Well, the parameters are being set at least.  Mike, is it possible that 
having minimum_io_size set to 4m is causing some read amplification 
in LVM, translating a small read into a complete fetch of the PE (or 
somethinga long those lines)?

Ugis, if your cluster is on the small side, it might be interesting to see 
what requests the client is generated in the LVM and non-LVM case by 
setting 'debug ms = 1' on the osds (e.g., ceph tell osd.* injectargs 
'--debug-ms 1') and then looking at the osd_op messages that appear in 
/var/log/ceph/ceph-osd*.log.  It may be obvious that the IO pattern is 
different.

> Seems correct in terms of ceph-LVM io parameter negotiation? I wonded
> about gpt header+PV metadata - it makes some shift starting from ceph
> 1st block beginning. Does this mean that all following LVM 4m data
> blocks are shifted by this part and span 2 ceph objects?
> If so, performance will be affected.

I'm no LVM expert, but I would guess that LVM is aligning things properly 
based on the above device properties...

sage
