Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Sat, 20 Jan 2001 17:51:18 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20010120175118.A461@66bassett.freeserve.co.uk>
References: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com> <20010119101757.K23203@sistina.com> <20010119104932.L23203@sistina.com> <20010119172240.B2093@66bassett.freeserve.co.uk> <20010119135115.C9398@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010119135115.C9398@sistina.com>; from lewis@sistina.com on Fri, Jan 19, 2001 at 01:51:15PM -0600
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 19, 2001 at 01:51:15PM -0600, AJ Lewis wrote:
> I reversed that patch and it fixed the panic.  I 'spose we should pull that
> out of the CVS.  Does it need to be in there for 2.4.x?

I'll look into it.  As you know this was one area that I was unsure
about my original fix.  I need to read raw_io for and convince myself
we have the right solution.  This is top of my list.

- Joe
