Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BM18uM005201
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 18:01:08 -0400
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BM17Mm009418
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 18:01:07 -0400
Received: from smtp1.ptp.hp.com (smtp.cup.hp.com [15.1.28.250])
	by palrel13.hp.com (Postfix) with ESMTP id EDA7436D54
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 15:00:56 -0700 (PDT)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp1.ptp.hp.com (Postfix) with ESMTP id CDF87420EEC
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 22:00:56 +0000 (UTC)
Message-ID: <44DCFE18.7050902@cup.hp.com>
Date: Fri, 11 Aug 2006 15:00:56 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Archive Question
References: <44DCF352.3080605@cup.hp.com>	<20060811211922.GK18633@agk.surrey.redhat.com>	<44DCF622.4030006@cup.hp.com>
	<20060811214150.GL18633@agk.surrey.redhat.com>
In-Reply-To: <20060811214150.GL18633@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>



Alasdair G Kergon wrote:
> On Fri, Aug 11, 2006 at 02:26:58PM -0700, John DeFranco wrote:
>> /etc/ is a local writeable filesystem. I believe this occurs when I'm 
>> issuing a vgchange --addtag and/or vgchange -a y. I have scripts scripts
>> that are executing these commands but nothing that should be done in 
>> parallel.
>  
> And you have default locking enabled?
>   locking_type = 1  locking_dir = "/var/lock/lvm"
>   in lvm.conf with /var also local
> 
Yes to all.

> Perhaps there's some race in the backup file code:
> It would be useful to have a list of all the lvm commands that might
> possibly be executing against each other.
I'm trying to assemble that list.

Thanks.
-- 
===========
Cheers
-jd
