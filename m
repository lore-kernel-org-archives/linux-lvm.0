Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GGY03L021167
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:34:01 -0400
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GGXhpf013556
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:33:44 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI7005GCCNY846D@vms173009.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 16 Apr 2009 11:33:34 -0500 (CDT)
Message-id: <49E75DDD.7040500@verizon.net>
Date: Thu, 16 Apr 2009 12:33:33 -0400
From: Gerry Reno <greno@verizon.net>
MIME-version: 1.0
Subject: Re: [linux-lvm] Move an array/volgroup to another machine.
References: <49E757A9.6090108@verizon.net> <49E758EF.40309@brunson.com>
	<49E75944.9080100@brunson.com>
In-reply-to: <49E75944.9080100@brunson.com>
Content-transfer-encoding: 7bit
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

Eric Brunson wrote:
> On 04/16/2009 10:12 AM, Eric Brunson wrote:
>> On 04/16/2009 10:07 AM, Gerry Reno wrote:
>>> We built a replacement server (x86_64) for an older server (x86).  
>>> Now we want to move a RAID-5 array intact from the older machine 
>>> over to the new machine.  We know the UUID of the array and of all 
>>> the PV and VG on the array.  So what commands should we perform 
>>> after plugging in all the array drives to the new server to bring up 
>>> the array and lvm on the new machine?
>>
>> "vgscan" and "vgchange -a VGNAME" I believe.
>
>
> Sorry, doing three things at once:  vgchange -a y VGNAME
>
>
>>
>> Make sure your VG name doesn't conflict with any already in the machine.
>>
Will vgchange activate the raid array?

The new server just has a couple raid-1 arrays on it right now.  But we 
need the raid-5 to be activated because there is a volgroup that uses 
the raid-5 device as it's PV.

Regards,
Gerry
