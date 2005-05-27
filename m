Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4R5ebO25441
	for <linux-lvm@redhat.com>; Fri, 27 May 2005 01:40:37 -0400
Received: from bsd.morsing.cc (dsl-80-46-110-1.access.as9105.com [80.46.110.1])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4R5eU4d028169
	for <linux-lvm@redhat.com>; Fri, 27 May 2005 01:40:36 -0400
Message-ID: <42296.195.190.132.207.1117172724.squirrel@webmail.morsing.org>
In-Reply-To: <4295DCD7.6000404@m-cam.com>
References: <4292256B.7060509@m-cam.com><20050523200358.GJ6097@null.msp.redhat.com
	> <4295DCD7.6000404@m-cam.com>
Date: Fri, 27 May 2005 06:45:24 +0100 (BST)
Subject: Re: [linux-lvm] pvcreate issues
From: "Henrik Morsing" <henrik@morsing.cc>
MIME-Version: 1.0
Reply-To: henrik@morsing.cc,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


> AJ Lewis wrote:
>> On Mon, May 23, 2005 at 02:48:11PM -0400, Arshavir Grigorian wrote:
>>
>>
>> You're sure sd[c-f] is not the same device on multiple paths?
>>
>
> How can I be sure? How do I check?
>
> This SAN exports another set of 4 LUNs to a different server and they
> work just fine.

It does look like you're seing the same disk through four different paths.
What OS is the other server running? The people that setup the SAN should
know if it is multi pathed or not.

-- 
---
Henrik Morsing
henrik@morsing.cc
www.morsing.cc
---
