Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82KTG323458
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 16:29:16 -0400
Date: Thu, 2 Sep 2004 13:28:01 -0700
From: "David S. Miller" <davem@davemloft.net>
Message-Id: <20040902132801.4263a0f6.davem@davemloft.net>
In-Reply-To: <1094122692.2117.1704.camel@duncow>
References: <1093911340.2116.55.camel@duncow>
	<20040830174015.10edb69b.davem@davemloft.net>
	<1093989609.2124.139.camel@duncow>
	<20040901183737.7bf17a39.davem@davemloft.net>
	<1094122692.2117.1704.camel@duncow>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [PATCH] Re: lvm problems on sparc64 - Trying to
 vfree() nonexistent vm area
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Richard Mortimer <richm@oldelvet.org.uk>
Cc: sparclinux@vger.kernel.org, debian-sparc@lists.debian.org, linux-lvm@sistina.com, marcelo.tosatti@cyclades.com

On Thu, 02 Sep 2004 11:58:12 +0100
Richard Mortimer <richm@oldelvet.org.uk> wrote:

> On Thu, 2004-09-02 at 02:37, David S. Miller wrote:
> > On Tue, 31 Aug 2004 23:00:10 +0100
> > Richard Mortimer <richm@oldelvet.org.uk> wrote:
> > 
> > > How do they look
> > 
> > Please resend your patch without all the line breaks
> > created by your email client.  It looks fine otherwise
> > :)
> 
> Bah. Clients are just getting too clever these days. 
> 
> Hopefully this should be ok.

Thanks a lot Richard, applied.
