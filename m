Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j4JETCMO007934
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 15:29:12 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DYm1Q-0008JH-Tq
	for linux-lvm@redhat.com; Thu, 19 May 2005 15:29:12 +0100
Date: Thu, 19 May 2005 15:29:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] same LV UUID after vgmerge
Message-ID: <20050519142912.GU15809@agk.surrey.redhat.com>
References: <BFCF159FFD14F444B205968F32DBD5BB01700408@MAILEX01.rasgroup.ita.localnet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BFCF159FFD14F444B205968F32DBD5BB01700408@MAILEX01.rasgroup.ita.localnet>
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

On Thu, May 19, 2005 at 04:20:56PM +0200, Magni Fabrizio wrote:
>   LVM version:     2.00.15 (2004-04-19)
> and I converted my VG with vgconvert.
 
> Now I restored all my original volume group and I'm ready for another
> test.
 
> Is it safe to edit the UUID by hand?
 
Yes, as long as the LVs are not active (the vgchange -an step).

I've reproduced the bug here.

Alasdair
-- 
agk@redhat.com
