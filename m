Date: Fri, 26 Aug 2016 09:56:49 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20160826145649.GA28284@redhat.com>
References: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
	<20160825155917.GA12789@redhat.com>
	<cf9ee87d-35bb-4cfe-a00b-a17ae180bd7b@alteeve.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf9ee87d-35bb-4cfe-a00b-a17ae180bd7b@alteeve.ca>
Subject: Re: [linux-lvm] lvm2 cluster aware
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
To: linux-lvm@redhat.com
Cc: lists@alteeve.ca

On Fri, Aug 26, 2016 at 01:04:45AM -0400, Digimer wrote:
> > - use lvmlockd to coordinate sharing with sanlock or dlm (this is new),
> >   http://man7.org/linux/man-pages/man8/lvmlockd.8.html
> > 
> > - use clvm to coordinate sharing with dlm (this is old)
> >   http://man7.org/linux/man-pages/man8/clvmd.8.html
> 
> It's not at all old.

Sorry, "old" was the nicest thing I could say about it.

> Or rather, it's not "old" in the sense that it's not used or developed
> anymore.

It's not developed and will be replaced by lvmlockd.

Dave
