Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9OFVAOs011512
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 11:31:10 -0400
Received: from akita.dogpad.net (99-152-154-249.lightspeed.dllstx.sbcglobal.net
	[99.152.154.249])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9OFV8QU009931
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 11:31:09 -0400
Received: from [134.64.83.106] (unknown [192.65.45.20])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: joey@dogpad.net)
	by akita.dogpad.net (Postfix) with ESMTPSA id 7C9CD1C03A4
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 10:31:07 -0500 (CDT)
Message-ID: <52693D2E.705@dogpad.net>
Date: Thu, 24 Oct 2013 10:30:54 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
References: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
	<5267FCC6.6060605@tekcomms.com> <5268E9CA.60100@redhat.com>
In-Reply-To: <5268E9CA.60100@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Le 24/10/2013 04:35, Zdenek Kabelac a =EF=BF=BDcrit :
> Dne 23.10.2013 18:43, Joe Harvell napsal(a):
>>> Hi Joe,
>>>
>>> I am having similar issues in that I have a LVM2 raid1 mirror between a
>>> local disk and a iSCSI disk and once I remove the iSCSI disk and add it
>>> back, the mirror stays broken. I traced the cause of that to be LVM2=20
>>> still
>>> complains about a PV missing even though the same PV has been added=20
>>> back.
>>>
>>> I wonder if you have resolved your issue and what did you do.
>>> Thanks a lot.
>>> Shi
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> Shi,
>>
>> This is not yet resolved.  I'm still waiting for Peter Rajnoha to=20
>> follow up
>> after I provided him the information he requested.  He said he might=20
>> be able
>> to look at it more closely later this week. In the mean time, I work=20
>> around
>> this issue by activating the VG with --partial.  I can access my=20
>> data, but I
>> can't make any LVM config changes.
>>
>>
>
> If the missing PV is reattached to your system - you need to
>
> vgextend --restoremissing   /dev/path_to_PV
>
>
> Since once the PV is detected as missing - metadata are update on=20
> present PVs,
> and the missing PV is marked as MISSING.
> When such PV reappear - you need to run the command to re-synchronize=20
> metadata.
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
My faith in LVM is restored.  This fixed my problem.  I really need to=20
read through all those man pages more closely.
