Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7U8dfVp011153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2016 04:39:42 -0400
Received: from nm22.bullet.mail.ir2.yahoo.com (nm22.bullet.mail.ir2.yahoo.com
	[212.82.96.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 689B0C04B327
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2016 08:39:40 +0000 (UTC)
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
	<40998f97-9728-c1e6-1c94-cab31fdef870@redhat.com>
	<fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
	<08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
	<62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
	<8904dd7f-5efa-6337-aafc-8b7fe2a08842@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <95d96292-5380-68a0-2e7e-f81cf0f0b565@yahoo.co.uk>
Date: Tue, 30 Aug 2016 09:39:38 +0100
MIME-Version: 1.0
In-Reply-To: <8904dd7f-5efa-6337-aafc-8b7fe2a08842@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

now when you say that - (I) believe it or not - I think it's 
possible. I cannot test it, for now the LV is in production 
but! I few days ago introduced an external usb keboard which 
has not LED indicators at all and now when I play with it it 
seems there might be problem on my f24, maybe the 
drivers(?). Gee, open source with all its greatness and the 
luck of officially Christened, own hardware(laptop) can be a 
reason of great frustration sometimes.
I'll put together another cache pool some days and then 
shall provide clarification to my own frustration.


On 29/08/16 16:08, Ondrej Kozina wrote:
> Thank you for the lsblk and lvs output. At least now we 
> know that raid is somehow involved in the setup...
>
> On 08/29/2016 04:22 PM, lejeczek wrote:
>> I cannot debug now as for now I've given up the idea to
>> encrypt this LV, but  I would say is should be easily
>> reproducible (maybe even waste of time looking at my setup)
>> I simply tried:
>
> Well, without the debug output from cryptsetup I can't be 
> of any more help, I'm sorry. It's like starring into 
> crystal ball guessing what may have gone wrong. The -22 
> error code is general "wrong parameters" answer. I don't 
> even know if cryptsetup has got into code path where it's 
> supposed to open the device for write.
>
> But let me give it one last shot. Did you by any chance 
> end up with 22 right after the prompt:
>
> "Are you sure? (Type uppercase yes):"
>
> If so, are you sure that your answer was 'YES' instead of 
> lowercase 'yes'?
>
> Regards
> Ondrej
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
