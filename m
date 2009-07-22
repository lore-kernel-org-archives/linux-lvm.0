Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6M5QuRJ025591
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:26:56 -0400
Received: from eastrmmtao104.cox.net (eastrmmtao104.cox.net [68.230.240.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6M5QefD020070
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:26:40 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090722052641.UIAQ5576.eastrmmtao104.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:26:41 -0400
Message-ID: <4A66A30F.1020906@cox.net>
Date: Wed, 22 Jul 2009 00:26:39 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing
	logical	volume, help!
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
In-Reply-To: <20090721195830.GA30206@esri.com>
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

On 2009-07-21 14:58, Ray Van Dolson wrote:
> On Tue, Jul 21, 2009 at 12:55:50PM -0700, Adam Olsen wrote:
>> This pretty much sums it up:
>>
>> imgserv:/storage/# lvscan
>>   ACTIVE            '/dev/storage/storage' [3.62 TB] inherit
>> imgserv:/storage/# fdisk /dev/storage/storage
>>

But doesn't fdisk only work on *physical* block devices?

IOW, why fdisk an lv ?

-- 
Scooty Puff, Sr
The Doom-Bringer
