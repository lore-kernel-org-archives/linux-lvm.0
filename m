Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lACMXcg9029161
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:33:38 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Irhqc-000828-Uk
	for linux-lvm@redhat.com; Mon, 12 Nov 2007 22:33:38 +0000
Date: Mon, 12 Nov 2007 22:33:38 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Beginner Questions
Message-ID: <20071112223338.GV22843@agk.fab.redhat.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
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

On Mon, Nov 12, 2007 at 03:30:00PM -0700, Joseph L. Casale wrote:
> Thanks Alasdair, but where did the ~475 GB's go on the second? Is there some limit on PV size, I can't find anything with Google (Not that I can see 1024GB being a likely figure).
 
Post the output of:
  pvs -v

Alasdair
-- 
agk@redhat.com
