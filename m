Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BLRS8A029059
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 17:27:29 -0400
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BLR3bP022374
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 17:27:05 -0400
Received: from smtp2.ptp.hp.com (smtp.cup.hp.com [15.1.28.240])
	by palrel12.hp.com (Postfix) with ESMTP id 7D82B3829C
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 14:26:58 -0700 (PDT)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp2.ptp.hp.com (Postfix) with ESMTP id 5FFA029C415
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 21:26:58 +0000 (UTC)
Message-ID: <44DCF622.4030006@cup.hp.com>
Date: Fri, 11 Aug 2006 14:26:58 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Archive Question
References: <44DCF352.3080605@cup.hp.com>
	<20060811211922.GK18633@agk.surrey.redhat.com>
In-Reply-To: <20060811211922.GK18633@agk.surrey.redhat.com>
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

Hi,

[root@ny176 log]# lvm version
   LVM version:     2.01.14 (2005-08-04)
   Library version: 1.01.04 (2005-08-02)
   Driver version:  4.4.0

/etc/ is a local writeable filesystem. I believe this occurs when I'm 
issuing a vgchange --addtag and/or vgchange -a y. I have scripts scripts
that are executing these commands but nothing that should be done in 
parallel.

Alasdair G Kergon wrote:
> On Fri, Aug 11, 2006 at 02:14:58PM -0700, John DeFranco wrote:
>> /etc/lvm/archive/.lvm_ny476.cup.hp.com_24035_984827937: rename to 
>> /etc/lvm/archive/vgsb1_01871.vg failed: File exists
>  
>> I don't know is how this happens. I cannot find any documentation on 
>> this message. Any pointers?
> 
> Exactly what version of LVM is this?
> (And does the file exist?   Is /etc a local, writeable filesystem?)
>  
> Alasdair

-- 
===========
Cheers
-jd
