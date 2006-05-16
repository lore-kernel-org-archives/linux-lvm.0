Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GMSDW0025332
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 18:28:13 -0400
Received: from zcars04f.nortel.com (zcars04f.nortel.com [47.129.242.57])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GMSBxp017964
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 18:28:11 -0400
Received: from zrtphxs1.corp.nortel.com
	(zrtphxs1.corp.nort...s0.corp.nortel.com [47.140.202.46])
	by zcars04f.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	k4GMS4Y11888
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 18:28:04 -0400 (EDT)
Message-ID: <446A51EB.1050802@dogpad.net>
Date: Tue, 16 May 2006 17:27:55 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 tools<-->library<-->driver compatibility
References: <4468C22C.4050908@dogpad.net> <446A1E23.7050306@dogpad.net>
	<20060516195850.GK16180@agk.surrey.redhat.com>
In-Reply-To: <20060516195850.GK16180@agk.surrey.redhat.com>
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

The problem is solved by upgrading the the device mapper library to 
1.02.05.  Thanks.

As for the 2.4 kernel, I have to use 2.4 on this box for Rational 
Clearcase MVFS compatibility.

Alasdair G Kergon wrote:
> On Tue, May 16, 2006 at 01:46:59PM -0500, Joe Harvell wrote:
>   
>> How can I determine which combinations should be compatible?  What 
>> version of the tools/library do I need to downgrade to in my installed 
>> environment?  
>>     
>
> Don't downgrade userspace tools - upgrade them.  Best to use the same versions
> of userspace packages in both environments.  But avoid snapshots.
> (You'd need old packages on 2.4 to use them, and they're buggy anyway.)
>
> The 2.4 kernel patches haven't been updated for some time and contain some 
> bugs that already got fixed in the 2.6 tree.
>
> Alasdair
>   
