Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41IcnH5032589
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 14:38:49 -0400
Received: from smtp04.atlngahp.sys.nuvox.net (smtp-out4.atlngahp.sys.nuvox.net
	[70.43.63.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41IcbK8023341
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 14:38:37 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m41IcW0G006682
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 14:38:32 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 79B3B37B160
	for <linux-lvm@redhat.com>; Thu,  1 May 2008 14:38:32 -0400 (EDT)
Message-ID: <481A0E28.5030108@Media-Brokers.com>
Date: Thu, 01 May 2008 14:38:32 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <4817C2FD.1010909@verizon.net>
	<4817D97D.8060805@verizon.net>	<4817ECAF.4020806@verizon.net>
	<48187B91.4060901@verizon.net>	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>	<4818AB1C.9030809@verizon.net>
	<4818BA5D.6070501@Media-Brokers.com>	<4818D59A.8020906@verizon.net>
	<4818E262.4070105@redhat.com>	<4818F2FC.5050907@verizon.net>
	<20080501154800.GA5941@us.ibm.com>	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net>
In-Reply-To: <481A08A7.5010305@verizon.net>
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

On 5/1/2008 2:15 PM, Gerry Reno wrote:
> Why? What value is the old snapshot at this point?

? It holds all of the changes to your original (snapshotted) volume, so 
I imagine it would be pretty important to most people?

I'm not really understanding all the inner-workings of LVM, but now I 
can see why using a ram disk for an LVM snapshot might not be a very 
good idea for this one reason - it won't survive a reboot...

> You just had a system reboot in the middle of a snapshotted backup so
> all you need to do is get the system up, redo another snapshot and
> retake your backup. I'm not interested in the old snapshot.

I would be... but thats just me...

-- 

Best regards,

Charles
