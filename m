Date: Tue, 7 Aug 2007 22:40:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20070807214021.GE2064@agk.fab.redhat.com>
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
	<46B254E4.60700@cfl.rr.com> <20070803081133.GB939@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070803081133.GB939@percy.comedia.it>
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>, linux-lvm@redhat.com

On Fri, Aug 03, 2007 at 10:11:34AM +0200, Luca Berra wrote:
> i'd rather not see it coupled with udev :P
> maybe i am limited, but i really fail to see how an event driven model
> could be at all useful in this cases, and i am really convinced that the
> effort needed to make i work is too high compared to possible benefits.

This is out of our hands - people are already experimenting with this
and lvm2 needs to support it with enthusiasm!

But that does not mean we'll stop supporting the existing mechanisms, as
it'll just become a configuration option (I suspect compile-time rather
than run-time).

Alasdair
-- 
agk@redhat.com
