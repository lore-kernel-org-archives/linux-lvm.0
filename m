Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l86J93VC031088
	for <linux-lvm@redhat.com>; Thu, 6 Sep 2007 15:09:03 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1ITMis-00008G-Sf
	for linux-lvm@redhat.com; Thu, 06 Sep 2007 20:09:02 +0100
Date: Thu, 6 Sep 2007 20:09:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] collapse (merge) snapshot into origin
Message-ID: <20070906190902.GX2064@agk.fab.redhat.com>
References: <1189098393.21669.43.camel@pc.ilinx>
	<1189098830.21669.47.camel@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1189098830.21669.47.camel@pc.ilinx>
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

On Thu, Sep 06, 2007 at 01:13:50PM -0400, Brian J. Murrell wrote:
> On Thu, 2007-09-06 at 13:06 -0400, Brian J. Murrell wrote:
> > [is] such a feature is
> > being considered for an official LVM release?
 
Snapshot merging: yes.
The patches depended on another change (tracking all snapshot I/O to eliminate
theoretical races) that's still outstanding, but once that's dealt with (it's
tricky - my original proof-of-concept patch was ~800 lines so needed breaking
up and rewriting), I expect them to follow quite quickly.

Alasdair
-- 
agk@redhat.com
