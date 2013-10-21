Date: Mon, 21 Oct 2013 07:11:47 -0700
From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20131021141147.GA30189@infradead.org>
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
	<20131017151828.GB28859@redhat.com>
	<CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>
	<alpine.DEB.2.00.1310181657151.19763@cobra.newdream.net>
	<CAE63xUO4ZrzObMFeQ=FXGFnqpwWsjCiiDr2_VhOt91h=djofYw@mail.gmail.com>
	<alpine.DEB.2.00.1310202051240.29488@cobra.newdream.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1310202051240.29488@cobra.newdream.net>
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
Cc: elder@inktank.com, Mike Snitzer <snitzer@redhat.com>, Ugis <ugis22@gmail.com>, linux-lvm@redhat.com, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>

On Sun, Oct 20, 2013 at 08:58:58PM -0700, Sage Weil wrote:
> It looks like without LVM we're getting 128KB requests (which IIRC is 
> typical), but with LVM it's only 4KB.  Unfortunately my memory is a bit 
> fuzzy here, but I seem to recall a property on the request_queue or device 
> that affected this.  RBD is currently doing

Unfortunately most device mapper modules still split all I/O into 4k
chunks before handling them.  They rely on the elevator to merge them
back together down the line, which isn't overly efficient but should at
least provide larger segments for the common cases.
