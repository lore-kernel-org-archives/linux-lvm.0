Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JMSgNt015344
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 18:28:42 -0400
Received: from eastrmmtao101.cox.net (eastrmmtao101.cox.net [68.230.240.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JMSTD4012469
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 18:28:29 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao101.cox.net
	(InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP id
	<20100519222829.CSCC14747.eastrmmtao101.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 18:28:29 -0400
Message-ID: <4BF4660C.60307@cox.net>
Date: Wed, 19 May 2010 17:28:28 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<20100519162401.GA4163@trillian.comsick.at>
In-Reply-To: <20100519162401.GA4163@trillian.comsick.at>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
To: linux-lvm@redhat.com

On 05/19/2010 11:24 AM, Michael Guntsche wrote:
> On 2010.05.19 11:58:03 , Digimer wrote:
>> On 10-05-19 11:43 AM, kevin wrote:
>>> Howdy,
>>>
>>> (fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
>>
>> The mkfs isn't supposed to be there, just set the new drive's
>> partition to type '8e' (Linux LVM).
> Or use the full device without any partition at all.
>

I wonder if this will have any adverse affects on drives with 4KB 
sectors?

-- 
Dissent is patriotic, remember?
