Received: from [10.34.33.233] (dhcp-lab-233.englab.brq.redhat.com
	[10.34.33.233])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l71HNqT6016894
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 19:23:52 +0200
Message-ID: <46B0C1DF.5070108@redhat.com>
Date: Wed, 01 Aug 2007 19:24:47 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Proper method of snapshotting XFS with external
	log	using LVM2
References: <1185737538.12064.44.camel@server.ak.quickcircuit.co.nz>	<20070801121713.GY31489@sgi.com>	<1185971009.13401.146.camel@server.ak.quickcircuit.co.nz>	<20070801140944.GA31489@sgi.com>
	<1185980574.2694.35.camel@server.ak.quickcircuit.co.nz>
In-Reply-To: <1185980574.2694.35.camel@server.ak.quickcircuit.co.nz>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Mario Becroft wrote:
> 2. I tried without xfs_freeze anyway just to see what would happen, and
> actually in kernel 2.6.22.1 if you simply create a snapshot of the main
> filesystem volume and destroy it several times in a row (not even
> touching the log volume yet) lvcreate hangs.

Well, probably two problems combined here. 

In 2.6.22 is change in block layer which serializes generic_make_request()
calls and it causes some problems with synchronous metadata snapshot updates.
See patch which moves metadata updates to separate thread
http://www2.kernel.org/pub/linux/kernel/people/agk/patches/2.6/2.6.22/dm-snapshot-fix-invalidation-deadlock.patch

Maybe lvcreate hang is just another demonstration of this problem.

Please could you test it with 2.6.21 kernel, or with kernel with this patch applied ?

Is the bug with separate filesystem log reported in bugzilla ?

If you find problem with even patch above, please report it with
exact description how you reach this.

Milan
--
mbroz@redhat.com
