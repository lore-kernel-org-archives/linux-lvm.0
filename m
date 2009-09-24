Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8O5D0Tr007040
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 01:13:00 -0400
Received: from mail-ew0-f208.google.com (mail-ew0-f208.google.com
	[209.85.219.208])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8O5CoN4007351
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 01:12:50 -0400
Received: by ewy4 with SMTP id 4so1317175ewy.7
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 22:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090924012648.GB16777@us.ibm.com>
References: <29ae894c0909230507g70719ab2ga2810256d10ae667@mail.gmail.com>
	<20090924012648.GB16777@us.ibm.com>
Date: Thu, 24 Sep 2009 07:12:49 +0200
Message-ID: <29ae894c0909232212kd60e85fx713226a95cc1c2f9@mail.gmail.com>
Subject: Re: [linux-lvm] LVM mirror resync
From: brem belguebli <brem.belguebli@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

2009/9/24 �<malahal@us.ibm.com>:
> brem belguebli [brem.belguebli@gmail.com] wrote:
>> My questions are:
>>
>> 1) Am I using the right method to simulate a drive failure by echoing
>> a scsi delete ? How would behave the scsi layer in case a disk came to
>> physically disappear ?
>
> You are using a right method. You could pull the cables physically but
> it is not going to make any difference to LVM mirror behaviour.
>
>> 2) If the above method is correct, isn't the role of the mirror log to
>> keep track of region changes �in case of a drive failure to be able to
>> incrementally resync the mirror when the missing drive is back to
>> operation?
>
> Yes, but the implementation is not complete yet! Without the mirror
> log (corelog), every reboot needs a complete resync. Mirror log is used
> to avoid that but nothing more at this point!
>
>> �Missing drive is not replaced, the UUID is the same, the problem
>> could have occured at scsi connectivity not on the physical media (SAN
>> failure for instance).
>>
>> 3) if so, why does disappear the log device from the VG though being
>> on a physically present device ?
>
> If you really look at your LV, it is no more a mirror. It is just a
> linear LV! So your failed mirror leg as well as your mirror log are not
> used. "dmeventd" will remove the failed mirror leg from the VG. It
> probably removed the now unused mirror log also.
>
>> 4) when the missing drive is back again,
>> � � 4-1) �why does it appear as not belonging to its original VG ?
>
> Because it was removed from the VG in the first place. The metadata on
> other disks is the latest and is used.
>

The VG information is still present on the "failed and back" disk. This could
help the recovery process combined with next point to re assemble the mirror
and to eventually do partial resync.

>> � � 4-2) why doesn't it get automatically resync'ed by dmeventd ? .
>
> It doesn't know any better! It doesn't know that it was a mirror.

Keeping the log device in the VG wouldn't have helped it to keep track of this?


>> The recover process seems to be to reconstruct from scratch the mirror
>> treating the failed and back again drive as a totally new drive.
>
> Yes! I heard that mdadm (raid1) can do (optimal resyncs) what you want
> but I have no direct experience. You may want to try that if you need
> this feature.

Yes, I already use it. The setup is to configure an internal bitmap
(log area) on
your md array and it will do optimal resyncs in case of such a failure.
The thing is that I am doing this on a cluster and mdadm is not
naturally cluster aware.

Mirror log relocation doesn't seem to be implemented yet / working either  .

Regards
