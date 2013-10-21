Date: Mon, 21 Oct 2013 09:02:16 -0700 (PDT)
From: Sage Weil <sage@inktank.com>
In-Reply-To: <20131021150129.GA28099@redhat.com>
Message-ID: <alpine.DEB.2.00.1310210853140.29488@cobra.newdream.net>
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
	<20131017151828.GB28859@redhat.com>
	<CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>
	<alpine.DEB.2.00.1310181657151.19763@cobra.newdream.net>
	<CAE63xUO4ZrzObMFeQ=FXGFnqpwWsjCiiDr2_VhOt91h=djofYw@mail.gmail.com>
	<alpine.DEB.2.00.1310202051240.29488@cobra.newdream.net>
	<20131021141147.GA30189@infradead.org>
	<20131021150129.GA28099@redhat.com>
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: elder@inktank.com, Christoph Hellwig <hch@infradead.org>, Ugis <ugis22@gmail.com>, linux-lvm@redhat.com, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>

On Mon, 21 Oct 2013, Mike Snitzer wrote:
> On Mon, Oct 21 2013 at 10:11am -0400,
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > On Sun, Oct 20, 2013 at 08:58:58PM -0700, Sage Weil wrote:
> > > It looks like without LVM we're getting 128KB requests (which IIRC is 
> > > typical), but with LVM it's only 4KB.  Unfortunately my memory is a bit 
> > > fuzzy here, but I seem to recall a property on the request_queue or device 
> > > that affected this.  RBD is currently doing
> > 
> > Unfortunately most device mapper modules still split all I/O into 4k
> > chunks before handling them.  They rely on the elevator to merge them
> > back together down the line, which isn't overly efficient but should at
> > least provide larger segments for the common cases.
> 
> It isn't DM that splits the IO into 4K chunks; it is the VM subsystem
> no?  Unless care is taken to assemble larger bios (higher up the IO
> stack, e.g. in XFS), all buffered IO will come to bio-based DM targets
> in $PAGE_SIZE granularity.
> 
> I would expect direct IO to before better here because it will make use
> of bio_add_page to build up larger IOs.

I do know that we regularly see 128 KB requests when we put XFS (or 
whatever else) directly on top of /dev/rbd*.

> Taking a step back, the rbd driver is exposing both the minimum_io_size
> and optimal_io_size as 4M.  This symmetry will cause XFS to _not_ detect
> the exposed limits as striping.  Therefore, AFAIK, XFS won't take steps
> to respect the limits when it assembles its bios (via bio_add_page).
> 
> Sage, any reason why you don't use traditional raid geomtry based IO
> limits?, e.g.:
> 
> minimum_io_size = raid chunk size
> optimal_io_size = raid chunk size * N stripes (aka full stripe)

We are... by default we stripe 4M chunks across 4M objects.  You're 
suggesting it would actually help to advertise a smaller minimim_io_size 
(say, 1MB)?  This could easily be made tunable.

sage
