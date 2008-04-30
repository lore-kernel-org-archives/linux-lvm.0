Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UIT5uC011569
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:29:05 -0400
Received: from smtp01.atlngahp.sys.nuvox.net (smtp-out1.atlngahp.sys.nuvox.net
	[70.43.63.18])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UISrBa028444
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:28:53 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp01.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3UISmNe026977
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:28:49 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 56C48B8D60
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:28:45 -0400 (EDT)
Message-ID: <4818BA5D.6070501@Media-Brokers.com>
Date: Wed, 30 Apr 2008 14:28:45 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <4817C2FD.1010909@verizon.net>
	<4817D97D.8060805@verizon.net>	<4817ECAF.4020806@verizon.net>
	<48187B91.4060901@verizon.net>	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net>
In-Reply-To: <4818AB1C.9030809@verizon.net>
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

On 4/30/2008 1:23 PM, Gerry Reno wrote:
> My concern is that there is a bug somewhere in the snapshot
> mechanism. I've seen other people report what they said were
> corruption problems resulting from snapshots.

This is quite scary to someone like me who is new to LVM and using 
snapshots for backups (whether automated or not)...

I'd really like to hear from some of the devs on this, and what they 
think may have caused it...

Incidentally... this is the first time I've heard of someone using a 
Ramdisk as the snapshot volume... any chance that could have been 
involved somehow?

-- 

Best regards,

Charles
