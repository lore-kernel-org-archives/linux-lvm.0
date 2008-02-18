Received: from [192.168.1.101] (vpn-248-104.boston.redhat.com [10.13.248.104])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1IG8nEL008090
	for <linux-lvm@redhat.com>; Mon, 18 Feb 2008 11:08:50 -0500
Message-Id: <CB529B09-D602-4B23-AD87-6702B24B2086@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <31248093.1203252552606.OPEN-XCHANGE.WebMail.ox@lucy.ulx.hu>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Mon, 18 Feb 2008 10:08:48 -0600
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
	<F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
	<1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
	<31248093.1203252552606.OPEN-XCHANGE.WebMail.ox@lucy.ulx.hu>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

How are you performing the failures?  It looks like just one machine  
is loosing its connection to the device, while the other machines  
links remain in place.

  brassow

On Feb 17, 2008, at 6:49 AM, Lajk� Attila wrote:

> Here is the output of vgreduce:
> ftp://ftp.ulx.hu/upload/clvmd/vgreduce.tar.gz
>
> Attila
>
>
> 2008. febr. 15, 22:06 DU d�tummal Jonathan Brassow <jbrassow@redhat.com 
> >
> ezt �rta:
>
>> If the problem is reproducible, we should be able to track it down.
>>
>> When a failure happens, the kernel sends an event to userspace that
>> signals 'dmeventd' to take action. If we take dmeventd out of the
>> picture, we can run the commands ourselves with higher verbose
>> settings.
>>
>> When you activate the volume, you can 'lvchange -ay --monitor n <vg>/
>> <lv>' - this will prevent dmeventd from monitoring the mirror. Then
>> kill the log device. Finally, run 'vgreduce --removemissing <VG> -
>> vvvv' to perform the recovery. (redirecting all the output to a file
>> will give us something to look at if the failure is reproduced.)
>>
>> We may need to grab debugging output from clvmd too, but that can get
>> messy, so we'll start with this.
>>
>> brassow
>>
>> P.S. It looks like you must have *.debug; in your /etc/syslog.conf,
>> yes?
>>
>> On Feb 15, 2008, at 10:17 AM, Lajk� Attila wrote:
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
