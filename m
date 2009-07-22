Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6M5ntwQ003048
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:49:55 -0400
Received: from eastrmmtao103.cox.net (eastrmmtao103.cox.net [68.230.240.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6M5nejK030077
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:49:40 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090722054939.IGDN12338.eastrmmtao103.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 01:49:39 -0400
Message-ID: <4A66A873.8050100@cox.net>
Date: Wed, 22 Jul 2009 00:49:39 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com> <4A66A30F.1020906@cox.net>
	<2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
In-Reply-To: <2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
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

On 2009-07-22 00:41, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 11:26 PM, Ron Johnson<ron.l.johnson@cox.net> wrote:
>> But doesn't fdisk only work on *physical* block devices?
>>
>> IOW, why fdisk an lv ?
> 
> No, it works on logical volumes too.  You still need to create
> partitions even on the logical ones.
> 

Why didn't I have to?  This has always worked for me:

# mkfs.${TYPE} /dev/some_vg/some_lv

-- 
Scooty Puff, Sr
The Doom-Bringer
