Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j51HxlO13898
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2005 13:59:47 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j51Hxkbb027450
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2005 13:59:46 -0400
Message-ID: <429DF782.2070209@m-cam.com>
Date: Wed, 01 Jun 2005 13:59:30 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate issues
References: <4292256B.7060509@m-cam.com><20050523200358.GJ6097@null.msp.redhat.com	>
	<4295DCD7.6000404@m-cam.com>
	<42296.195.190.132.207.1117172724.squirrel@webmail.morsing.org>
In-Reply-To: <42296.195.190.132.207.1117172724.squirrel@webmail.morsing.org>
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
To: henrik@morsing.cc, LVM general discussion and development <linux-lvm@redhat.com>

Henrik Morsing wrote:
>>AJ Lewis wrote:
>>
>>>On Mon, May 23, 2005 at 02:48:11PM -0400, Arshavir Grigorian wrote:
>>>
>>>
>>>You're sure sd[c-f] is not the same device on multiple paths?
>>>
>>
>>How can I be sure? How do I check?
>>
>>This SAN exports another set of 4 LUNs to a different server and they
>>work just fine.
> 
> 
> It does look like you're seing the same disk through four different paths.
> What OS is the other server running? The people that setup the SAN should
> know if it is multi pathed or not.
> 

Thanks.

Looks like it might be a problem with the type of firmware we have on 
the SAN which only allows for one active fiber channel controller at a 
time. The second controller should be used only when the first one 
fails. What we were doing was to export the first set of 4 volumes 
through one controller and another set of 4 on the other controller, 
hence the problem. We will either have to change the firmware to allow 
for 2 active controllers (no failover spare) or buy a switch to make all 
the volumes accessible to more than one server through the first fc 
controller.

-- 
Arshavir Grigorian
Systems Administrator/Engineer
