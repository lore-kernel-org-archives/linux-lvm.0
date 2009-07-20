Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6K53bNA027489
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 01:03:37 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6K53L7g017005
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 01:03:21 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090720050322.JXGK28892.eastrmmtao106.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 01:03:22 -0400
Message-ID: <4A63FA98.6010207@cox.net>
Date: Mon, 20 Jul 2009 00:03:20 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 and external enclosures
References: <4A639532.6050506@cox.net>
	<Pine.LNX.4.64.0907200016130.9385@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0907200016130.9385@bmsred.bmsi.com>
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

On 2009-07-19 23:30, Stuart D. Gathman wrote:
> On Sun, 19 Jul 2009, Ron Johnson wrote:
> 
>> (The purpose of this "exercise" is to implement a backup strategy.)
> 
> ...
> 
>> Any thoughts on getting lvm2 to play nice with dynamic devices?
> 
> You have to do "vgchange -an backupvgxx" before removing the 
> dynamic volumes.  It is possible to deactivate the vg after

Worked like a charm.  Thanks!

-- 
Scooty Puff, Sr
The Doom-Bringer
