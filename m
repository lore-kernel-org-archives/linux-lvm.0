Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7QCjmT8008192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 08:45:48 -0400
Received: from nm24-vm9.bullet.mail.ir2.yahoo.com
	(nm24-vm9.bullet.mail.ir2.yahoo.com [212.82.97.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0275E8123A
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 12:45:47 +0000 (UTC)
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
Date: Fri, 26 Aug 2016 13:45:45 +0100
MIME-Version: 1.0
In-Reply-To: <a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
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

well, I prefer to encrypt LV itself, and I'm trying the same 
what worked always with my "regular" LVs, yet - "cache pools 
LVs" fail to encrypt with: Command failed with code 22.



On 25/08/16 15:47, Xen wrote:
> lejeczek schreef op 25-08-2016 13:51:
>> question I'd like to ask is: how to LUKS encrypt cache 
>> pool LV ?
>>
>> many thanks.
>> L.
>
> In general without being any expert here you will need to 
> encrypt the origin device (PV) on which it resides and 
> likely also the PV of the cache pool itself. It's no 
> different from any other volume you would use.
>
> You can allow LUKS to pass-through discards if you open 
> the volume with --allow-discards on the cryptsetup prompt 
> (command).
>
> In case you have an SSD underneath. It was said that the 
> cache itself does not utilize discards just yet, but that 
> it was in the planning.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
