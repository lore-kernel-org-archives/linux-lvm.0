From: Jens Axboe <axboe@suse.de>
Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
Message-ID: <20020703121024.GC21568@suse.de>
References: <F19741gcljD2E2044cY00004523@hotmail.com> <20020702141702.GA9769@fib011235813.fsnet.co.uk> <20020703100838.GH14097@suse.de> <20020703120124.GB615@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020703120124.GB615@fib011235813.fsnet.co.uk>
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
Date: Wed Jul  3 07:10:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@zip.com.au>

On Wed, Jul 03 2002, Joe Thornber wrote:
> On Wed, Jul 03, 2002 at 12:08:38PM +0200, Jens Axboe wrote:
> > On Tue, Jul 02 2002, Joe Thornber wrote:
> > > Tom,
> > > 
> > > On Tue, Jul 02, 2002 at 09:40:56AM -0400, Tom Walcott wrote:
> > > > Hello,
> > > > 
> > > > Browsing the patch submitted for 2.4 inclusion, I noticed that LVM2 
> > > > modifies the buffer_head struct. Why does LVM2 require the addition of it's 
> > > > own private field in the buffer_head? It seems that it should be able to 
> > > > use the existing b_private field.
> > > 
> > > This is a horrible hack to get around the fact that ext3 uses the
> > > b_private field for its own purposes after the buffer_head has been
> > > handed to the block layer (it doesn't just use b_private when in the
> > > b_end_io function).  Is this acceptable behaviour ?  Other filesystems
> > > do not have similar problems as far as I know.
> > > 
> > > device-mapper uses the b_private field to 'hook' the buffer_heads so
> > > it can keep track of in flight ios (essential for implementing
> > > suspend/resume correctly).  See dm.c:dec_pending()
> > 
> > Your driver is required to properly stack b_private uses, however if
> > ext3 (well jbd really) over writes b_private after bh i/o submission I
> > would say that it is broken.
> 
> AFAIK ext3 doesn't overwrite b_private after submission, but does
> expect the value not to change (ie. no stacking to be taking place).

Now we are in a grey area. The 'usual' stacked drivers work like this:

some fs path
	submit_bh(bh_orig);

...

stacked driver make_request_fn:
	bh_new = alloc_bh
	bh_new->b_private = bh_orig;
	...
	submit_bh(bh_new);

if you are just modifying b_private, how exactly is your stacking
working? ie what about lvm2 on lvm2?

-- 
Jens Axboe
