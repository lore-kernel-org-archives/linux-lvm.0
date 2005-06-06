Date: Mon, 6 Jun 2005 22:21:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: VG vg1 metadata writing failed
Message-ID: <20050606212110.GV15809@agk.surrey.redhat.com>
References: <1118087310.5509.40.camel@localhost.localdomain>
	<1118087611.5509.44.camel@localhost.localdomain>
	<1118091844.5509.79.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1118091844.5509.79.camel@localhost.localdomain>
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
To: mingz@ele.uri.edu
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jun 06, 2005 at 05:04:04PM -0400, Ming Zhang wrote:
> this is reproducible on another box.
 
There is currently a 64k hard-coded limit on metadata size.

Some of the lvm2 tool algorithms also get quite slow when
there are lots of entities.

Keep an eye on the CVS code - there was an allocation speed-up 
added recently, and the 64k limit should be disappearing very 
soon too.

Alasdair
-- 
agk@redhat.com
