Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAK6PlDe016422
	for <linux-lvm@redhat.com>; Thu, 20 Nov 2008 01:25:47 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAK6NwNW017858
	for <linux-lvm@redhat.com>; Thu, 20 Nov 2008 01:23:58 -0500
Received: by rv-out-0506.google.com with SMTP id f6so328068rvb.51
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 22:23:57 -0800 (PST)
Message-ID: <b072968d0811192223i5dc7c58dic6b4b929b18f9c3a@mail.gmail.com>
Date: Thu, 20 Nov 2008 06:23:57 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] messages in /var/adm
In-Reply-To: <BAY107-W29C6E87177CC7E627964F28F0D0@phx.gbl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <BAY107-W26871D7D9114EE57CB567B8F170@phx.gbl>
	<491C4285.20302@redhat.com>
	<BAY107-W29C6E87177CC7E627964F28F0D0@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

2008/11/19 Mark Reardon <markreardon4@hotmail.com>:
> Hello All,
>
> Would anybody have a list of return codes and their meenings to hand?

http://tldp.org/HOWTO/archived/SCSI-Programming-HOWTO/SCSI-Programming-HOWTO-21.html

--Dave

>
> Thanks,
>
> Kind regards.
>
> Mark,
>
>> Date: Thu, 13 Nov 2008 15:06:45 +0000
>> From: bmr@redhat.com
>> To: markreardon4@hotmail.com
>> Subject: Re: [linux-lvm] messages in /var/adm
>>
>> Mark Reardon wrote:
>> > Hello All,
>> >
>> > Has anybody ever come across these messages before. They have only
>> > started logging since we upgrade our kernel and PowerPath version.
>> >
>> > Redhat 4 U7
>> >
>> > kernel: SCSI error : <1 0 0 19> return code =
>> > 0x8000002
>> > kernel: Current sdt: sense key Aborted
>> > Command
>> > kernel: Additional sense: Internal target
>> > failure
>>
>> Hi Mark,
>>
>> This is a very specific SCSI error message. The storage controller is
>> telling us that it had to abort the I/O command and that this occurred
>> due to an internal failure. This is a quite rare error to see in a fibre
>> channel storage environment.
>>
>> What type of arrays are you using here? I have seen this specific error
>> combination with certain firmware revisions on Hitachi arrays in the
>> past (although it is possible with other vendors/products).
>>
>> If you'd like to open a support request with Red Hat Global Support
>> Services and pass me the ticket details, I'll make sure that it gets
>> escalated to my group for further analysis.
>>
>> Kind regards,
>> Bryn.
>>
>> ----------------------------------------------------------------
>> Bryn M. Reeves direct: +44 1252 362926
>> Senior Software Maintenance Engineer mobile: +44 7740 812997
>> Red Hat, 200 Fowler Avenue, Farnborough, Hants, UK. GU14 7JP
>> GnuPG : C61463DE BE48 187A 378B D0FD 7773 49AF E984 90A0 C614
>> ----------------------------------------------------------------
>
> ________________________________
> Click here for FREE customisable desktop wallpapers. Get them Now!
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
