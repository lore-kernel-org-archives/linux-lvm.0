Message-Id: <3C588C6C.1010300@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
References: <20020130202254.A7364@fib011235813.fsnet.co.uk>
    <20020130145408.I763@lynx.adilger.int> <1012428221.1750.253.camel@lapcat>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re:  [ANNOUNCE] LVM reimplementation ready for beta testing
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
Date: Wed Jan 30 18:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Also, does/where does this fit in with EVMS?

It doesn't :).  They're essentially competing implementations that offer 
similar functionality.  I've been running the EVMS stuff for a while 
now, and it's (a) been pretty darn solid, and (b) is completely 
compatible with LVM1 on disk.

The next release of EVMS should also allow you to replace the standard 
MD subsystem (RAID 0/1/5) with EVMS.

I think that, in general, competition is good.  A stable, robust, and 
flexible logical volume implementation is a good thing, and we'll 
probably get there faster with two groups acting as inspirations for 
each other.

Cheers,

-- Lars
