Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i827O0302079
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 03:24:00 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i827Nsn0003582
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 03:23:55 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 215DAE6D49
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2004 08:17:22 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23216-11 for <linux-lvm@redhat.com>;
	Thu,  2 Sep 2004 08:17:22 +0100 (BST)
Received: from oak.dgreaves.com (modem-2452.karuhiruhi.dialup.pol.co.uk
	[81.78.137.148]) by mail.ukfsn.org (Postfix) with ESMTP id 84BE0E6D37
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2004 08:17:21 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.66])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1C2lyR-0001Cx-LT
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 08:25:35 +0100
Message-ID: <4136CA83.9080100@dgreaves.com>
Date: Thu, 02 Sep 2004 08:23:47 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and blockdev --setra
References: <1094106922.10860.82.camel@akira2.nro.au.com>
	<000701c490aa$ba434f70$0a00a8c0@brane>
In-Reply-To: <000701c490aa$ba434f70$0a00a8c0@brane>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Branko wrote:

>>Hi Guys,
>>
>>Should one set blockdev --setra on the lvm device, on the individual
>>block devices making up the lvm device or both?
>>
>>
>>    
>>
>
>Interesting question. Answer to that IMHO depends on the internal kernel
>structures.
>
>Isn't the easisest aproach to try and see what happens ?
>
>Regards,
>
>Branko
>  
>

 From experimentation: set it on everything.
device, md, lv

David
