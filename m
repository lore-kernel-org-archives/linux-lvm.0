Subject: Re: [linux-lvm] Available snapshot chunks known in LVM2
Message-ID: <20030213184627.GA26052@fib011235813.fsnet.co.uk>
References: <200302132047.13938.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200302132047.13938.jhs@openenterprise.biz>
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
Date: Thu Feb 13 12:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 13, 2003 at 08:47:07PM +0700, Jason Smith wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi.
> 
> I am trying to implement a script that will automagically grow a snapshot 
> volume if it is getting too full, using 2.4.20-dm-7 and the latest stable 
> LVM2 and libdevmapper.
> 
> My problem is that the integer percent full value is not precise enough: on 
> for example a 100GB volume, those increments of course only tell me my 
> snapshot usage down to 1GB, and my ultimate goal is to put off reallocating 
> as long as possible, so I need to see this number down to, say, a 100MB 
> granularity.  Also, the current implementation rounds down, so 99.97% could 
> be interpreted as 1GB free in this example.  So I spent the last couple of 
> hours learning LVM code and implementing this change.

Impressive for a couple of hours work !  Send the patches and I'll see
if they should be merged in.

- Joe
