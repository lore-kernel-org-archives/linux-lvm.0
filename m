Message-ID: <20021009184445.GA25733@fib011235813.fsnet.co.uk>
References: <20021009181259.GA25050@fib011235813.fsnet.co.uk> <3DA47606.546A558E@digeo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DA47606.546A558E@digeo.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
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
Date: Wed Oct  9 14:23:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@digeo.com>
Cc: Linux Mailing List <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com

On Wed, Oct 09, 2002 at 11:31:34AM -0700, Andrew Morton wrote:
> Joe Thornber wrote:
> > 
> > The 2.5 port of device-mapper is available from:
> > 
> >    bk://device-mapper.bkbits.net/2.5-stable
> 
> Is it available in a form which everyone can access?

http://people.sistina.com/~thornber/dm_2002-10-09.tar.bz2

> What I really wanted to know is "are you still using kiobufs"?

What I just submitted doesn't include the snapshot target as yet, I
want people to focus on the dm core rather than getting side tracked
by one of the targets.

> If so, what do we need to do to not do that?

For the last few months all snapshot io has been going through kcopyd,
*except* the snapshot metadata update (which did use a kiobuf).  I
have a patch which sends the metadata through kcopyd in the works, so
when I submit the snapshot target it will not use a kiobuf - I'm no
fan of kiobufs.

- Joe
