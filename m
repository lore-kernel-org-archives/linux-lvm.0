Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBHKTaZZ016842
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 15:29:36 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBHKTQjt012085
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 15:29:27 -0500
Received: by qwa26 with SMTP id 26so1119992qwa.33
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 12:29:26 -0800 (PST)
Message-ID: <4D0BC824.1010308@gmail.com>
Date: Fri, 17 Dec 2010 15:29:24 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <4D0B9D71.3080602@gmail.com>
	<AANLkTin8CfZhNGoA_DcMkgaCFtpp_OMMoXTV7X1DfNHv@mail.gmail.com>
In-Reply-To: <AANLkTin8CfZhNGoA_DcMkgaCFtpp_OMMoXTV7X1DfNHv@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Conflicting vg names but can't rename one
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

On 12/17/2010 01:56 PM, Richard Shaw wrote:
> On Fri, Dec 17, 2010 at 11:27 AM, Mauricio Tavares<raubvogel@gmail.com>  wrote:
>> vgrename SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D export1
>>   WARNING: Duplicate VG name export: Existing
>> fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence over
>> SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>>   WARNING: Duplicate VG name export: Existing
>> fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence over
>> SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>>   WARNING: Duplicate VG name export: fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB
>> (created here) takes precedence over SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>>   Volume group "export" still has active LVs
>>
>> What am I missing here? I thought if I told it to rename the vg with a given
>> uuid I would be golden. As you can see, that is not the case.
>
> I think you need to make the vg unavailable before you can rename it:
>
> vgchange -an SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>
> then your vgrename should work.
>
> Richard
>
	Do you think I need to persuade it some more?

raub@ubuntu:~$ sudo vgdisplay export
   WARNING: Duplicate VG name export: Existing 
fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence 
over SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
   --- Volume group ---
   VG Name               export
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  2
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               1
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               465.76 GiB
   PE Size               4.00 MiB
   Total PE              119234
   Alloc PE / Size       102400 / 400.00 GiB
   Free  PE / Size       16834 / 65.76 GiB
   VG UUID               fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB

raub@ubuntu:~$ sudo vgchange -an SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
   WARNING: Duplicate VG name export: Existing 
fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence 
over SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
   Volume group "SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D" not found
raub@ubuntu:~$

Maybe I need to unmount/disconnect the hard drive with the vg being used 
and then try to rename the other drive...

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
