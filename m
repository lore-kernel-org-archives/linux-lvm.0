Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BGbO001117
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 12:37:24 -0400
Received: from tok-backup.jp.novell.com (mailgw.novell.co.jp [202.33.131.58])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5BGbNi5027590
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 12:37:23 -0400
Message-Id: <s0ca5e4c.064@tok-backup.jp.novell.com>
Date: Sat, 12 Jun 2004 01:37:03 +0900
From: "Takekazu Okamoto" <tokamoto@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: LVM 2.x Volume Group Limit Changes
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
To: linux-lvm@redhat.com

On Mon May 31 2004 - 12:54:00 CEST, Alasdair G Kergon wrote:
> LVM2 removes those limits if you update to LVM2 metadata, but
> when running pvcreate you should ask for a bigger metadata area if
> you want lots of LVs (or complex ones) in the VG.
> The tools can also be slow when there are lots of objects, but
> this will be addressed.

How many VGs can be created on LVM2 with kernel 2.6?
Is it unlimited until memory exhausted?

Thanks in advance,
Takekazu Okamoto
