Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <200104111949.f3BJnFHt014761@webber.adilger.int>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 12 Apr 2001 00:00:05 +0200
In-Reply-To: Andreas Dilger's message of "Wed, 11 Apr 2001 13:49:14 -0600 (MDT)"
Message-ID: <wxx66gbp062.fsf@einn.ifi.uio.no>
MIME-Version: 1.0
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

Andreas Dilger <adilger@turbolinux.com> writes:

> Ok, the chain of events is as follows (hopefully correct):
> 
> Non-LVM read			LVM read
> ------------			--------
> sys_read			sys_read
> block_read			block_read
> ll_rw_block			ll_rw_block
> submit_bh			submit_bh
> generic_make_request		generic_make_request
> 				lvm_make_request_fn
> 				lvm_map
> __make_request			__make_request
> 
> The rest should be the same because you have the same IDE driver
> below.

  I'm going to stick my head in here and say thanks for that info. I
  really need to _read_ the code. *sigh*
 
> Very strange. I just tested the same on my system, and LVM ends up
> _faster_ than raw disk access in each of the 3 tests I did:

  okay, I only have the option of testing this on an old IDE drive,
  and the times where within 7% of eachother (LVM being the slower of
  the two on all runs). it's a bigger difference then I'd like to see,
  but it varies with runs, and the box is low on memory and being used
  at the same time. the only thing they're really saying is that LVM
  isn't a bottleneck.
 
  not that it'll help much in Urs' case though. :/

-- 
Terje
