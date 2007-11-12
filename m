Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lACLwscG024645
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:58:54 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IrhJ0-0007zP-6k
	for linux-lvm@redhat.com; Mon, 12 Nov 2007 21:58:54 +0000
Date: Mon, 12 Nov 2007 21:58:54 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Beginner Questions
Message-ID: <20071112215854.GU22843@agk.fab.redhat.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
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

On Mon, Nov 12, 2007 at 02:33:58PM -0700, Joseph L. Casale wrote:
>   PV Size               745.00 GB / not usable 3.67 MB
>   PV Size               1024.00 GB / not usable 8192.00 EB
 
> Why is some space "not usable"?
 
Some space is used for LVM metadata; other space is lost as the
remainder when the volume size is divided by the chosen extent size.

Ignore the ridiculous number there - it's been fixed in CVS for the next
release.

Alasdair
-- 
agk@redhat.com
