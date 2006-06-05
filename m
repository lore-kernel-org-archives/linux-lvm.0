Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k55MiBVV019159
	for <linux-lvm@redhat.com>; Mon, 5 Jun 2006 18:44:11 -0400
Received: from isp.becroft.co.nz (isp.becroft.co.nz [202.89.33.33])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k55Mi21L025077
	for <linux-lvm@redhat.com>; Mon, 5 Jun 2006 18:44:03 -0400
Received: from server.ak.quickcircuit.co.nz (gateway.quickcircuit.co.nz
	[210.55.214.217])
	by isp.becroft.co.nz (8.12.11.20060308/8.12.9) with ESMTP id
	k55MmCfN007093
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 10:48:12 +1200
Subject: Re: [linux-lvm] Is it better to use partitions or entire disk for LVM?
From: "Mario Becroft (mailing list)" <list@becroft.co.nz>
In-Reply-To: <20060605223153.GA21795@redhat.com>
References: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>
	<20060605223153.GA21795@redhat.com>
Date: Tue, 06 Jun 2006 10:43:48 +1200
Message-Id: <1149547428.14842.502.camel@server.ak.quickcircuit.co.nz>
Mime-Version: 1.0
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

On Tue, 2006-06-06 at 00:31 +0200, Heinz Mauelshagen wrote:
> On Sun, Jun 04, 2006 at 10:46:45AM -0400, Mag Gam wrote:
> > Is it better to create 1 partition on a disk, and use that into the LVM, or
> > have a blank disk, and use that in the LVM (if possible)?
> 
> As long as we still need to live with partition tables, the advantage
> of having 1 partition to create a PV on it is, that all related tools
> (e.g. parted) *show* that there's an LVM partition.

Another reason for creating a partition (perhaps a silly one, but I have
found it useful) is that discs from different vendors (or even the same
vendor) that are supposedly the same size often vary slightly, so I find
it useful to create a partition slightly smaller than the total size of
the disc. This is a little wasteful of space, but means that if I need
to drop in a replacement disc that is slightly smaller than the original
one, I can just copy an image of the old disc and it will generally
work--otherwise I would have to fiddle around with whatever was near the
end of the old disc.
