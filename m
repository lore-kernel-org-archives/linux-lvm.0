Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 19 Jan 2001 17:22:40 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20010119172240.B2093@66bassett.freeserve.co.uk>
References: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com> <20010119101757.K23203@sistina.com> <20010119104932.L23203@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010119104932.L23203@sistina.com>; from lewis@sistina.com on Fri, Jan 19, 2001 at 10:49:32AM -0600
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

On Fri, Jan 19, 2001 at 10:49:32AM -0600, AJ Lewis wrote:
> After testing a bit more, I have found a bug in the snapshot creation.
> Under load, you can get a 
> 'kernel panic: brw_kiovec: iobuf not locked for I/O'
> 
> Joe, is this the same as the problem you discussed in the 
> "[linux-lvm] Kernel panic while snapshotting."
> thread?

Sounds like it.  Can you try reversing that patch as well please ?

- Joe
