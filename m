Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1NFxuOb010999
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 10:59:57 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1NFxsfx029981
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 10:59:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 9BF57433DD
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:59:47 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 18651-18 for <linux-lvm@redhat.com>;
	Fri, 23 Feb 2007 16:59:31 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:59:31 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 54717947F
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:58:58 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (192.168.113.3 [192.168.113.3]) (amavisd-new, port 10025)
	with ESMTP id MUJrw4PlCKM3 for <linux-lvm@redhat.com>;
	Fri, 23 Feb 2007 16:59:33 +0100 (CET)
Received: from [81.173.150.170] (xdsl-81-173-150-170.netcologne.de
	[81.173.150.170]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:58:51 +0100 (CET)
Message-ID: <45DF0F5B.6000506@wpkg.org>
Date: Fri, 23 Feb 2007 16:59:23 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] moving logical volumes to another system *remotely*
	-	how?
References: <45DED477.8040809@wpkg.org>
	<20070223124452.GB22388@homer.panici.net>
In-Reply-To: <20070223124452.GB22388@homer.panici.net>
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

paddy@panici.net schrieb:
> On Fri, Feb 23, 2007 at 12:48:07PM +0100, Tomasz Chmielewski wrote:
>> I have a server which stores several LVM-2 logical volumes.
>>
>> As this system is pretty loaded, I'd like to move some of the logical
>> volumes to another machine. It has to be done remotely, so I can't do it
>> as described in the LVM HOWTO (where one basically adds/replaces disks 
>> in one machine).
>>
>> My common sense tells me that I should:
>>
>> 1. Unmount/not use the logical volumes on the source server
>> 2. Make volumes of the same size on the target server
>> 3. Copy it somehow over network
>>
>>
>> I'm not sure of 2 (make volumes of exactly the same size) 
> 
> check your PE size, otherwise does what it says on the tin.

Hmm, how? I just want to move some (not all) logical volumes.

I guess fdisk is a good idea?

# fdisk -l /dev/LVM2/ocsi1

Disk /dev/LVM2/ocsi1: 3221 MB, 3221225472 bytes


3221225472 / 1024 = 3145728


lvcreate -L3145728k -n ocsi1 LVM2

Hmm, hopefully, it's the right size?


>> and 3 (how to 
>> copy it all over network, if possible, using SSH only).
> 
> netcat and dd over forwarded port

Thanks for the idea.


-- 
Tomasz Chmielewski
http://wpkg.org
