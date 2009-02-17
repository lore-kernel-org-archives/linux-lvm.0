Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1H06N4t017275
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 19:06:23 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LZDTj-0007QH-B4
	for linux-lvm@redhat.com; Tue, 17 Feb 2009 00:06:23 +0000
Date: Tue, 17 Feb 2009 00:06:23 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: Problems running my home-built LVM2
Message-ID: <20090217000623.GD26197@agk.fab.redhat.com>
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498EE80D.3090307@redhat.com>
	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<49905A90.2000802@redhat.com>
	<jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Feb 16, 2009 at 06:20:32PM -0500, Stefan Monnier wrote:
> _io in dev-io.c) would often return garbage (tho not always).  Not sure
> if it's a problem in LVM2, or in uClibc, or in the kernel, but I think
> I've already wasted more than enough time on this, so I'll just use
> the --disable-o_direct workaround.
 
We had a problem with O-direct several years ago which we blamed on a rogue
version of gcc.

Alasdair
-- 
agk@redhat.com
