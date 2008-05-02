Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42FVF8J008859
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:31:15 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42FV3xx021967
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:31:03 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0800LOGZ3HEL02@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 02 May 2008 10:30:53 -0500 (CDT)
Date: Fri, 02 May 2008 11:30:52 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <Pine.LNX.4.44.0805021111170.30896-100000@bmsred.bmsi.com>
Message-id: <481B33AC.7050102@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <Pine.LNX.4.44.0805021111170.30896-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> On Fri, 2 May 2008, Bryn M. Reeves wrote:
>
>   
>> Am I missing something here? vgchange --partial seems like it will do
>> what you want (man 8 lvm):
>>     
>
> It does part of what I want.  It would at least allow a system to boot
> from a partial VG containing the root fs.  It does not allow any
> metadata changes while VG is partial - not even reducing missing PV.
>   
Well, what good is this if you cannot fix anything? You are stuck in 
'broken' mode.

Regards,
Gerry

> If a PV is temporarily missing, and you using the pvcreate -u option,
> then the original PV comes back as well, you have fireworks.
> Also, it doesn't ensure partially missing LVs are readonly (including
> where a snapshot is on a missing PV).
>
> In any case, the --partial might be good for initrd.  Although a newbie
> admin would be terribly confused by the "no metadatachanges" restriction.
>
>   
