Date: Mon, 21 Oct 2013 11:06:16 -0700
From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20131021180616.GA7196@infradead.org>
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
Content-Disposition: inline
In-Reply-To: <20131021150129.GA28099@redhat.com>
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
Cc: elder@inktank.com, Sage Weil <sage@inktank.com>, Christoph Hellwig <hch@infradead.org>, Ugis <ugis22@gmail.com>, linux-lvm@redhat.com, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>

On Mon, Oct 21, 2013 at 11:01:29AM -0400, Mike Snitzer wrote:
> It isn't DM that splits the IO into 4K chunks; it is the VM subsystem
> no?

Well, it's the block layer based on what DM tells it.  Take a look at
dm_merge_bvec

From dm_merge_bvec:

	/*
         * If the target doesn't support merge method and some of the devices
         * provided their merge_bvec method (we know this by looking at
         * queue_max_hw_sectors), then we can't allow bios with multiple vector
         * entries.  So always set max_size to 0, and the code below allows
         * just one page.
         */
	
Although it's not the general case, just if the driver has a
merge_bvec method.  But this happens if you using DM ontop of MD where I
saw it aswell as on rbd, which is why it's correct in this context, too.

Sorry for over generalizing a bit.
