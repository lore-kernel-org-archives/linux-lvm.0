Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4Q6xIO08293
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 02:59:18 -0400
Received: from tyo202.gate.nec.co.jp (TYO202.gate.nec.co.jp [202.32.8.202])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4Q6xAhL013077
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 02:59:11 -0400
Received: from mailgate3.nec.co.jp (mailgate53.nec.co.jp [10.7.69.162] (may be
	forged)) by tyo202.gate.nec.co.jp (8.11.7/3.7W01080315) with ESMTP id
	j4Q6x5V08294
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 15:59:05 +0900 (JST)
Received: (from root@localhost) by mailgate3.nec.co.jp
	(8.11.7/3.7W-MAILGATE-NEC) id j4Q6x4512724 for linux-lvm@redhat.com;
	Thu, 26 May 2005 15:59:04 +0900 (JST)
Received: from kogoro.jp.nec.com (kogoro.jp.nec.com [10.26.220.12]) by
	mailsv4.nec.co.jp (8.11.7/3.7W-MAILSV4-NEC) with ESMTP
	id j4Q6x4c17858 for <linux-lvm@redhat.com>;
	Thu, 26 May 2005 15:59:04 +0900 (JST)
Message-Id: <42957461.5080508@vx.cnt.dnes.jp.nec.com>
Date: Thu, 26 May 2005 16:01:53 +0900
From: "Shinn'ya Hoshino" <s-hoshino@vx.cnt.dnes.jp.nec.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "pvchange --uuid" failed when PV is in use
References: <42931ECB.4000806@vx.cnt.dnes.jp.nec.com>
	<20050524174111.GG15809@agk.surrey.redhat.com>
In-Reply-To: <20050524174111.GG15809@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Alasdair G Kergon wrote:
> I've checked an alternative fix into CVS.
>   (Treats it like vgreduce + pvchange -u + vgcfgrestore then
>    optimises most of the intermediate steps away)

I could "pvchange --uuid" non-orphan PV successfully, and
duplicated VG successfully activated.

Thanks.

-- 
/* -------------------------------------------------------------
   Shinn'ya Hoshino     mailto:s-hoshino@vx.cnt.dnes.jp.nec.com
------------------------------------------------------------- */
