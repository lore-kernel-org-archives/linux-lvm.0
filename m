Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9U3TFVQ019702
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 23:29:15 -0400
Received: from mail.unpatched.net (mail.unpatched.net [80.179.151.65])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9U3T0oJ017836
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 23:29:01 -0400
Received: from [192.168.10.98] (localhost [127.0.0.1])
	by mail.unpatched.net (Postfix) with ESMTP id BD9F6D40A9
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 05:28:58 +0200 (IST)
Message-ID: <490929E0.30301@hidden.domain.name>
Date: Thu, 30 Oct 2008 05:28:32 +0200
From: Yoav <ml-lvm@hidden.domain.name>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mirror and snapshot incompatible
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>
	<FDC38507-D7B2-4876-ABD5-3D595692EAC1@redhat.com>
In-Reply-To: <FDC38507-D7B2-4876-ABD5-3D595692EAC1@redhat.com>
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

For production environment I guess I'll switch to md+lvm for mirroring 
so that I'll be able to safely snapshot the mirrored fs.  I'll keep 
playing with devmapper mirror combined with snapshot (without lvm) and 
report if it misbehaves.  So far it hasn't, but I only did some limited 
experiments.  I hope some future version of lvm will add support for 
this combination.

    Yoav

Jonathan Brassow wrote:
> No, there isn't a reason LVM prevents it, other than we haven't gotten 
> to it yet.  That being said... because we haven't gotten to it yet 
> also means there probably hasn't been a whole lot of testing of such a 
> configuration.  Therefore, it's difficult to quantify the safety.
>
>  brassow
>
> On Oct 28, 2008, at 7:32 PM, Yoav wrote:
>
>> I know how to do it through device-mapper.  I'm just worried that 
>> maybe there's a reason why lvm prevents it.  Are you aware of such 
>> reason, or is it safe?
>>
>> Jonathan Brassow wrote:
>>> It is possible to do all the things you are asking through 
>>> device-mapper... but there is no easy way to do it.  (and LVM does 
>>> not yet have the capabilities to manage this yet either.)
>>>
>>> brassow
>>>
>>> On Oct 27, 2008, at 9:28 PM, Yoav wrote:
>>>
>>>> According to lvcreate, a snapshot of a mirrored volume cannot be 
>>>> created ("Snapshots and mirrors may not yet be mixed").  However, 
>>>> devmapper does not seem to have the same limitation when used 
>>>> directly (not through lvm).
>>>>
>>>> Is there a current reason for lvcreate to enforce this rather harsh 
>>>> limitation?
>>>>
>>>> What are the risks I'm taking by manually creating a dm-snapshot 
>>>> from a dm-mirror device?  (of course I'm also replacing the 
>>>> dm-mirror device with a snapshot-origin of the actual dm-mirror 
>>>> device).
>>>>
>>>> If there is an actual reason for preventing this, what is the 
>>>> suggested way to consistently backup a mirror volume?  Is there a 
>>>> way to temporarily take one of the mirror "legs" (mimage devices)  
>>>> offline in order to back it up, and resync it later?
>>>>
>>>>  Yoav
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
