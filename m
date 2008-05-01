Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41Jrs5D020661
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 15:53:54 -0400
Received: from vms046pub.verizon.net (vms046pub.verizon.net [206.46.252.46])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41Jrgwv004876
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 15:53:42 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700K83GKVUOD3@vms046.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 14:53:20 -0500 (CDT)
Date: Thu, 01 May 2008 15:53:19 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <481A1D32.6020705@Media-Brokers.com>
Message-id: <481A1FAF.5050303@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net>	<4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net>	<4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net>	<20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net>	<481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net> <481A1D32.6020705@Media-Brokers.com>
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

Charles Marcus wrote:
> On 5/1/2008 3:37 PM, Gerry Reno wrote:
>>>> You just had a system reboot in the middle of a snapshotted backup so
>>>> all you need to do is get the system up, redo another snapshot and
>>>> retake your backup. I'm not interested in the old snapshot.
>
>>> I would be... but thats just me...
>
>> It's like yesterday's newspaper.  Why do you need to keep it?
>
> A wild guess... because the changes haven't been synced back with the 
> original yet (which happens when the snapshot is released)?
My understanding is that the snapshot is a copy-on-write (COW) to the 
original volume.  If that is not the case, then I guess things must have 
changed and I have some old information.

Gerry
