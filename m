Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9FJrnTK013973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 15:53:49 -0400
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mx1.redhat.com (Postfix) with ESMTPS id C30CF8E6E3
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 19:53:48 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so45291174lfa.1
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 12:53:47 -0700 (PDT)
References: <561EB8A1.10806@windriver.com>
	<90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
	<561F70D7.7040302@gmail.com> <561FD887.6020608@windriver.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56200449.1090800@gmail.com>
Date: Thu, 15 Oct 2015 21:53:45 +0200
MIME-Version: 1.0
In-Reply-To: <561FD887.6020608@windriver.com>
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
To: Chris Friesen <chris.friesen@windriver.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.10.2015 v 18:47 Chris Friesen napsal(a):
> On 10/15/2015 03:24 AM, Zdenek Kabelac wrote:
>> Dne 15.10.2015 v 09:13 Alexey napsal(a):
>>> Hello,
>>>
>>> If you look at the output of `lvs myvg`, then you will understand whats
>>> happens.
>>> When you create thin LV without specifying option `-T`, lvm automatically
>>> created TP for you with size equal to -L option.
>>> And when you resize your sparsevol, your TP (auto name lvol1) still have old
>>> size.
>>>
>>
>> Mixing 2 things together.
>>
>> Newer lvm2 tools (then reported 2.02.98)  are now creating sparse volumes
>> as a thin volume in thin-pool.
>>
>> Old behavior with /dev/zero snapshot is thought still available
>> either with lvm.conf settings  or using  --type snapshot.
>
> Okay, that's interesting.  Do you know when this change went in?
>

Version 2.02.112 has configurable setting for this.

Zdenek
