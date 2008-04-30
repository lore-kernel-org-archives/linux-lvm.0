Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UKPYnA004559
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 16:25:34 -0400
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UKPKNi006576
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 16:25:20 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K05004XYN8UO372@vms173003.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 30 Apr 2008 15:22:06 -0500 (CDT)
Date: Wed, 30 Apr 2008 16:24:58 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4818BA5D.6070501@Media-Brokers.com>
Message-id: <4818D59A.8020906@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
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

Charles,
  Here's a snapshot ramdisk reference:
    
http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-diskspace
   
  The ramdisk has been working without problem.  I tested it quite a bit 
before putting it into production.  But I don't know LVM internals so I 
cannot say whether it could have had anything to do with the hang that 
occurred.

Regards,
Gerry


Charles Marcus wrote:
> On 4/30/2008 1:23 PM, Gerry Reno wrote:
>> My concern is that there is a bug somewhere in the snapshot
>> mechanism. I've seen other people report what they said were
>> corruption problems resulting from snapshots.
>
> This is quite scary to someone like me who is new to LVM and using 
> snapshots for backups (whether automated or not)...
>
> I'd really like to hear from some of the devs on this, and what they 
> think may have caused it...
>
> Incidentally... this is the first time I've heard of someone using a 
> Ramdisk as the snapshot volume... any chance that could have been 
> involved somehow?
>
