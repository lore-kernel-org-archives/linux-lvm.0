Subject: Re: [linux-lvm] Re: RAID5 + LVM stillborn
Message-ID: <20030225194955.GA3982@fib011235813.fsnet.co.uk>
References: <200302251751.19856.jhs@openenterprise.biz> <20030225145733.GB3207@fib011235813.fsnet.co.uk> <200302260152.07244.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200302260152.07244.jhs@openenterprise.biz>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Tue Feb 25 13:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 26, 2003 at 01:52:07AM +0700, Jason Smith wrote:
> Software RAID in 2.4 maintains a stripe cache that must be the same size as 
> the incoming reads and writes.

Yuck.  There's not a lot I can do about it if there is a
restriction/bug in MD.  The snapshot target will do io in 'chunk size'
sizes.  Which is 32k by default in LVM2.  So md should be able to cope
with this.  I'd be really interested to see the stack trace for this
oops.

- Joe
