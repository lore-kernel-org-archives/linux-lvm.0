Date: Sun, 16 May 2004 14:45:01 -0700
From: Karen Shaeffer <shaeffer@neuralscape.com>
Subject: Re: [linux-lvm] snapshot with 2.6.5 kernel
Message-ID: <20040516214501.GA18886@synapse.neuralscape.com>
References: <20040503064205.GB1230@synapse.neuralscape.com>
	<20040511111322.GC31390@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040511111322.GC31390@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, May 11, 2004 at 01:13:22PM +0200, Heinz Mauelshagen wrote:
> On Sun, May 02, 2004 at 11:42:05PM -0700, Karen Shaeffer wrote:
> > 
> > was in the process of inflating its contents continues for a while,
> > but finally just crashes and hangs at some point.
> > 
> > Am I missunderstanding how to use snapshot here? Or is this just
> > severly broken software? Any advise is appreciated.
> 
> 
> You should be able to create a snapshot fine in ythat situation, even though
> the creation will happen slow under load.
> 
> Can you repeat the case ?
> Do you have an oops ? If so, please provide the ksymoops output
> for further analysis of the problem.


Hello Heinz,

Sorry for the delay in responding, but I am very busy.

Yes, the problem is repeatable. The hardware included an external
RAID array that was accessed with the LSI fibre channel HBA, which
I believe is known to be buggy. So, I have removed this hardware
from my test lab and will be conducting additional testing. I will
provide full details, if I encounter additional problems.

BTW, can you please advise me of the time frame for progress with
LVM2 and the 2.6.x kernel. Is a patchset planned to support the
2.6.6 kernel with respect to snapshot?

Also, can you comment on the evms alternative. It seems they already
have a release supporting the 2.6.6 kernel. My understanding is that
this latest evms release is production ready. Can you discuss LVM2's
status in comparison?

Thanks,
Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
