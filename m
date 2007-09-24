Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8OHqeLi004215
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 13:52:40 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8OHqXHt029946
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 13:52:34 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id ACB854AB12
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 19:52:27 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 58BCD9356
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 19:52:27 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id XZOLqtj26nI3 for <linux-lvm@redhat.com>;
	Mon, 24 Sep 2007 19:52:24 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-246-105.netcologne.de
	[87.78.246.105]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 19:52:24 +0200 (CEST)
Message-ID: <46F7F955.7070608@wpkg.org>
Date: Mon, 24 Sep 2007 19:52:21 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Overhead
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>	<46F7D242.3030707@stercomm.com>	<46F7D49A.2090206@wpkg.org>
	<46F7E720.4060304@stercomm.com> <46F7E839.8040805@stercomm.com>
In-Reply-To: <46F7E839.8040805@stercomm.com>
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

Chris Cox schrieb:

(...)

>>> LVMS=$(/bin/ls /dev/$HOSTNAME/)
>>>
>>> for LVM in $LVMS
>>>     do
>>>         blockdev --setra 16384 /dev/$HOSTNAME/$LVM
>>>     done
>>>
>>>
>> Hmmm, perhaps for iSCSI.  But using fibre SAN, I saturate my
>> 2Gbps link (almost 200MB/sec).
>>
>>
> 
> I check my local drives, they all use the default 1024....
> Is setting the read ahead that big of a deal with just LVM?
> I would think if it's an issue, it's an issue everywhere.

For me, the default was 256.

I use that big readahead after a bit of benchmarking; perhaps it's very 
specific to my setup.


-- 
Tomasz Chmielewski
http://wpkg.org
