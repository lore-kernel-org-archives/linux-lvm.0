Date: Wed, 27 Sep 2000 20:33:44 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] lv not persistent across reboot?
Message-ID: <20000927203344.A4797@ns.lst.de>
References: <Pine.LNX.4.21.0009251623060.25906-100000@tp.sf.opensales.com> <20000926113521.C17132@srv.t-online.de> <avo3tsssjd645dc7l0m7cdav900gm3i9ge@4ax.com> <20000927144714.A21932@srv.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20000927144714.A21932@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Wed, Sep 27, 2000 at 02:47:14PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@Sistina.com
Cc: Steve Brueggeman <brewgyman@yahoo.com>, linux-lvm@msede.com

On Wed, Sep 27, 2000 at 02:47:14PM +0000, Heinz J. Mauelshagen wrote:
> > I have not been following the high availability mailing list, and a solution may
> > already exist  there.  If so, and you know how, I'd be interested in a quick
> > description.
> 
> Not that i am aware of.

One of the goals of my in-kernel scanning is that it should handle simple
multi-pathing correctly. The Kernel will try to sort out dublicated pv's.
But I doubt it will be ready soon enough for your project :(

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
