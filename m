Subject: Re: [linux-lvm] JFS or XFS
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <1074209631.19419.24.camel@david.internal.NorcrossGroup.com>
References: <1074209631.19419.24.camel@david.internal.NorcrossGroup.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1074224135.2022.4.camel@localhost.localdomain>
Mime-Version: 1.0
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
Date: Thu Jan 15 22:38:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2004-01-15 at 17:33, Greg Freemyer wrote: 
> On Thu, 2004-01-15 at 18:22, neuron wrote:
> > reiserfs, guaranteed personally.  Especially on a mail server.
> 
> I agree, reiserfs was tuned for handling lots of small files.  Sounds
> perfect for a mail server.

Many tests prove this to be true as well. Search on google for what
Greg's saying. Lots of benches out there to see. 

[...]

> > Personally I haven't had any problems with XFS though, but I haven't
> used it that much.
> > 
> 
> If you go with XFS, stay away from anything older than 1.3.1.

Not to mention 1.3.x is when the xfslogd and xfsdatad were finally
implemented. I noted this in my prior email regarding tunable log
updates.


> The 1.2 and prior releases had this really nice feature that they
> ignored the sync command (and fsync I think).

It wasn't ignored, just not paid attention too as often it should've
been. ;)

> The end result is that with a power outage or kernel lockup you could
> lose lots of work.  I had one failure on a lightly used machine that
> had
> a whole days activities still sitting in the OS disk cache when the
> kernel locked up.

Depending on how often a system might sync()/fsync() this is true. As
well as any FS options you use for mounting XFS volumes regarding
log-buffers, io buffers, etc. 

> This is fixed in 1.3.1, 
> 
> Greg

Yes, much better now. Still, even with JFS or EXT3, as I noted before,
certain AbEnds will cause meta data to be lost. This is more a function
of hardware caching in a non-backed state, such as large cache buffers
of some drives 8MB drive cache, etc.  (i.e. no battery backed up cache)

-- 
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
