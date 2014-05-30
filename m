Date: Fri, 30 May 2014 07:53:45 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530115345.GA5260@redhat.com>
References: <20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140529215815.GA4183@redhat.com>
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 29 2014 at  5:58pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:
 
> BTW, this is all with a eye toward realizing the optimization that
> dm-cache provides for origin blocks that were discarded (like I said
> before dm-cache doesn't promote from the origin if the corresponding
> block was marked for discard).  So you don't _need_ to do any of
> this.. purely about trying to optimize a bit more.

And if you do make use of discards, you should have this stable fix
applied to your kernel:

https://git.kernel.org/cgit/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=for-linus&id=f1daa838e861ae1a0fb7cd9721a21258430fcc8c
