Subject: Re: [linux-lvm] RAID5 + LVM stillborn
Message-ID: <20030225145733.GB3207@fib011235813.fsnet.co.uk>
References: <200302251751.19856.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200302251751.19856.jhs@openenterprise.biz>
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
Date: Tue Feb 25 08:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 25, 2003 at 05:51:19PM +0700, Jason Smith wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi.  I have a quick RAID 5 question.  Sort of a repost, but I can't get an 
> answer.
> 
> May I assume that LVM does not support RAID 5 due to the serialization 
> problems?  Theoretically, 2.6 will have a fix but this has already been a 
> problem for over two years.  And if 2.6 develops like 2.4 did, then we should 
> not use it for production for many months after its release.

As far as I'm aware the only reason LVM doesn't have raid5 is that
nobody has written it.  What is the serialisation problem ?

> For example, testing with LVM2 and DM from CVS, I made one snapshot under 
> light network load and it brought my machine to a complete stop, then oopsed 
> it.  I'm glad to help if any developers are interested.

This is not good, could you repeat you tests with the latest patchset please ?

http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-9.tar.bz2

If that still fails could you give us some more information about your
system (eg, send us the latest metadata backup).

- Joe
