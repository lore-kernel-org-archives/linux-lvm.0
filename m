Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HJ13j29528
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 14:01:03 -0500
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HJ114b007502
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 14:01:01 -0500
Date: Wed, 17 Mar 2004 12:00:56 -0700
From: "Donald Murray P.Eng." <donald.murray@pason.com>
Subject: Re: [linux-lvm] EXT3 snapshot not quiesced by LVM2?
Message-Id: <20040317120056.430fbe2b.donald.murray@pason.com>
In-Reply-To: <20040317181230.GA2624@reti>
References: <20040315182356.35f5ca40.donald.murray@pason.com>
	<20040317105725.15a71d21.donald.murray@pason.com>
	<20040317181230.GA2624@reti>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

We might take you up on that suggestion, Joe. Since we're using
2.4.22, that implies we should use the patches in:
http://people.sistina.com/~thornber/dm/patches/2.4-stable/2.4.22/2.4.22-dm-1/

Because we're using device-mapper 1.00.08, I'm assuming we need only
apply patches 9 through 16 to our already-patched kernel, correct?

I'll let the list know if this gets rid of the orphans.


On Wed, 17 Mar 2004 18:12:30 +0000
Joe Thornber <thornber@redhat.com> wrote:

> On Wed, Mar 17, 2004 at 10:57:25AM -0700, Donald Murray P.Eng. wrote:
> > Does anyone have any theories why our LVM2 snapshots have orphaned inodes?
> 
> Yes, it's because the VFS lock patch isn't wired up correctly in the
> version of dm that you're using - it's quiescing the wrong device.
> 
> You could try my _unstable_ dm tree if you wish to experiment.
> 
> people.sistina.com/~thornber/dm
> 
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
