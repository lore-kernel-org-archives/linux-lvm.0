Date: Thu, 17 Oct 2013 11:18:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20131017151828.GB28859@redhat.com>
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
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
To: Sage Weil <sage@inktank.com>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, Ugis <ugis22@gmail.com>, linux-lvm@redhat.com, "ceph-users@ceph.com" <ceph-users@ceph.com>

On Wed, Oct 16 2013 at 12:16pm -0400,
Sage Weil <sage@inktank.com> wrote:

> Hi,
> 
> On Wed, 16 Oct 2013, Ugis wrote:
> > 
> > What could make so great difference when LVM is used and what/how to
> > tune? As write performance does not differ, DM extent lookup should
> > not be lagging, where is the trick?
> 
> My first guess is that LVM is shifting the content of hte device such that 
> it no longer aligns well with the RBD striping (by default, 4MB).  The 
> non-aligned reads/writes would need to touch two objects instead of 
> one, and dd is generally doing these synchronously (i.e., lots of 
> waiting).
> 
> I'm not sure what options LVM provides for aligning things to the 
> underlying storage...

LVM will consume the underlying storage's device limits.  So if rbd
establishes appropriate minimum_io_size and optimal_io_size that reflect
the striping config LVM will pick it up -- provided
'data_alignment_detection' is enabled in lvm.conf (which it is by
default).

Ugis, please provide the output of:

RBD_DEVICE=<rbd device name>
pvs -o pe_start $RBD_DEVICE
cat /sys/block/$RBD_DEVICE/queue/minimum_io_size
cat /sys/block/$RBD_DEVICE/queue/optimal_io_size

The 'pvs' command will tell you where LVM aligned the start of the data
area (which follows the LVM metadata area).  Hopefully it reflects what
was published in sysfs for rbd's striping.
