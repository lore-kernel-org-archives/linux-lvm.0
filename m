Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9FGl79J029828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 12:47:07 -0400
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (Postfix) with ESMTPS id D39FF8EA3B
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 16:47:06 +0000 (UTC)
Message-ID: <561FD887.6020608@windriver.com>
Date: Thu, 15 Oct 2015 10:47:03 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <561EB8A1.10806@windriver.com>
	<90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
	<561F70D7.7040302@gmail.com>
In-Reply-To: <561F70D7.7040302@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unexpected behaviour of "lvresize" with sparse
	volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 10/15/2015 03:24 AM, Zdenek Kabelac wrote:
> Dne 15.10.2015 v 09:13 Alexey napsal(a):
>> Hello,
>>
>> If you look at the output of `lvs myvg`, then you will understand whats happens.
>> When you create thin LV without specifying option `-T`, lvm automatically
>> created TP for you with size equal to -L option.
>> And when you resize your sparsevol, your TP (auto name lvol1) still have old
>> size.
>>
>
> Mixing 2 things together.
>
> Newer lvm2 tools (then reported 2.02.98)  are now creating sparse volumes
> as a thin volume in thin-pool.
>
> Old behavior with /dev/zero snapshot is thought still available
> either with lvm.conf settings  or using  --type snapshot.

Okay, that's interesting.  Do you know when this change went in?

Chris
