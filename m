Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBBEmww2023222
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2014 09:48:59 -0500
Received: from smtprelay.hostedemail.com (smtprelay0111.hostedemail.com
	[216.40.44.111])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBBEmv76001816
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2014 09:48:57 -0500
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
	<5484C5A7.8080601@ubuntu.com>
	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
	<op.xqkhx9gjae9kta@comodus> <5488F019.80805@ubuntu.com>
	<op.xqokpwo4ae9kta@comodus> <5489A75F.6040307@ubuntu.com>
Date: Thu, 11 Dec 2014 08:48:32 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Jason Warr" <jason@warr.net>
Message-ID: <op.xqpkq6plae9kta@comodus>
In-Reply-To: <5489A75F.6040307@ubuntu.com>
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>, Anatoly
	Pugachev <matorola@gmail.com>, Phillip Susi <psusi@ubuntu.com>

On Thu, 11 Dec 2014 08:17:03 -0600, Phillip Susi <psusi@ubuntu.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12/10/2014 8:50 PM, Jason Warr wrote:
>> It ignores the name because what it does with "--trackchanges" is
>> rename the mirror leg to a visible & read only version of the meta.
>> Sample:
>
> You mean it changes the flags to visible and read only.  I don't see
> why it can't rename it as well.
>

Yes, visible and ro is what I meant.

>> You can't track changes and rename the "backup" leg at the same
>> time. If you wanted to keep the backup leg after making sure the in
>> use one was good you would need to issue a new "--splitmirror"
>> command with a new volume name and *no* "--trackchanges" option.
>
> Why not?  A name is just a name; it does not *have* to be called
> origin_rimage_0.

I don't disagree but it is the way the tool works.  My best guess is the  
name is ignored because when you issue "--trackchanges" it is not really  
splitting off the leg, more of off lining it from the perspective of the  
mirror.  It was likely a developer decision for lvconvert to do it that  
way when adding in RAID1 from the md stack.

The documentation for lvconvert could be more clear about it.

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.17 (MingW32)
>
> iQEcBAEBAgAGBQJUiadfAAoJENRVrw2cjl5Rt+kH/2edRv5pygm91ULcpZ9ehRuW
> 9bB0CpjyrLEp/f8bdqkcoyR2cpcuM2kUXBstvn7YLgyJnBdm8JNt6gZnanJLQ0gr
> CXx6Tu2OQfp87NTbUDqJOLku6EaAQ053zQAoBgnIctFaCUGU+hC1L3iwdkYGnVwZ
> uTdY0C3/t7ShPDvXqTrIqNugqOj7NFAptpENzxBavrkaIp5w47fvVHpWwFpwO3sU
> CheSV+gpqHKlc6T6DfZlDCcCnZHKmMhXzs4EigNZIZFzM8INhn01mJ64tUJKNET7
> eLvqIH8labOqAp4PVFido6Kgl6K/BKvGbzGJcqE9IR2V23yvzRHjretAGnFwed4=
> =sGDQ
> -----END PGP SIGNATURE-----
