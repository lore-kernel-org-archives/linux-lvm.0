Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i4VAs0bI023187
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 11:54:00 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BUkQa-0000Ss-DP
	for linux-lvm@redhat.com; Mon, 31 May 2004 11:54:00 +0100
Date: Mon, 31 May 2004 11:54:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM 2.x Volume Group Limit Changes?
Message-ID: <20040531105400.GG6302@agk.surrey.redhat.com>
References: <001c01c446e4$41a90420$0200a8c0@anubis>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001c01c446e4$41a90420$0200a8c0@anubis>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 31, 2004 at 01:52:38AM -0600, Jeff Spencer wrote:
> Does anyone have any experience with the actual limits imposed in the
> latest version of LVM?  

No changes for LVM1 - design limitations.

LVM2 removes those limits if you update to LVM2 metadata, but
when running pvcreate you should ask for a bigger metadata area if
you want lots of LVs (or complex ones) in the VG.
The tools can also be slow when there are lots of objects, but
this will be addressed.

Alasdair
-- 
agk@redhat.com
