Date: Fri, 30 May 2014 10:36:16 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530143616.GB9219@redhat.com>
References: <20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com>
	<20140530135529.GC8830@redhat.com>
	<20140530142948.GO1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530142948.GO1302@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Heinz Mauelshagen <heinzm@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Fri, May 30 2014 at 10:29am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Fri, May 30, 2014 at 09:55:29AM -0400, Mike Snitzer wrote:
> > So unless you have misaligned IO you _should_ be able to avoid reading
> > from the origin.  But XFS is in play here.. I'm wondering if it is
> 
> The filesystem is ext4.

OK, so I have even more concern about misalignment then.  At least XFS
goes to great lengths to build large IOs if Direct IO is used (via
bio_add_page, the optimal io size is used to build the IO up).

I'm not aware of ext4 taking similar steps but it could be it does now
(I vaguely remember ext4 borrowing heavily from XFS at one point,
could've been for direct IO).

We need better tools for assessing whether the IO is misaligned.  But
for now we'd have to start with looking at blktrace data to the
underlying origin device.  If we keep seeing >64K sequential IOs to the
origin that would speak to dm-cache pulling in 2 64K blocks from the
origin.
