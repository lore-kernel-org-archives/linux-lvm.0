Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6893i5v016844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 8 Jul 2016 05:03:44 -0400
Received: from nm39-vm6.bullet.mail.ir2.yahoo.com
	(nm39-vm6.bullet.mail.ir2.yahoo.com [212.82.97.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E60117F340
	for <linux-lvm@redhat.com>; Fri,  8 Jul 2016 09:03:42 +0000 (UTC)
References: <c6001912-30cb-11a8-0481-4689718155cd@yahoo.co.uk>
	<e8765cf9-f990-1030-7ea8-fe4187d691b1@iki.fi>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <81bdb891-3d03-f530-0016-181bcddd1384@yahoo.co.uk>
Date: Fri, 8 Jul 2016 10:03:41 +0100
MIME-Version: 1.0
In-Reply-To: <e8765cf9-f990-1030-7ea8-fe4187d691b1@iki.fi>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove and filesystem - un/mount?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com



On 07/07/16 19:10, Jarkko Oranen wrote:
>
>
> On 07/07/16 19:01, lejeczek wrote:
>> hi users,
>>
>> must be an easy one - what should be(is allowed to do) 
>> filesystem doing while there is a pvmove(failed hard 
>> disk) taking place in underlying LV?
>>
>> many thanks,
>
> Hi,
>
> pvmove is generally transparent to the layers above, so 
> you can continue using the system as usual while a pvmove 
> is in progress. While I have never seen pvmove actually 
> fail (My desktop encountered a power failure mid-operation 
> once, and it just continued as if nothing had happened 
> after rebooting), with a failing hard disk, I would avoid 
> any additional IO while the operation is in progress.
>
>
ok, thanks
maybe a bit more tricky, would now downsizing a FS be one 
thing OK to do(probably also fsck) ? while pvmove is working?
furthermore, would lvreduce be OK to take pvmote out of a LV ?

I have a bit of puzzle type of situation here to deal with - 
started pvmove but seems that HDD is rather in a bad 
condition for after two days pvmove is barely at 4%.
Should I let it finish - or - abort pvmove and try fsck; 
fsreduce; lvreduce..
hmmm..

>
> -- 
> Jarkko
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
