Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7LIFXH1009779
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 14:15:33 -0400
Received: from mail-iy0-f170.google.com (mail-iy0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7LIFWZf031126
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 14:15:32 -0400
Received: by iye16 with SMTP id 16so9717532iye.29
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 11:15:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E368882.2060700@redhat.com>
References: <CAGRgLy4Qk1r7Zd-uOZc7araf2tpfFLgGGigv7xyzfvrkMo2hmQ@mail.gmail.com>
	<4E368882.2060700@redhat.com>
Date: Sun, 21 Aug 2011 21:15:32 +0300
Message-ID: <CAGRgLy5mr9UvhzzoMW9DZmj-ge3j0OfQRo6i96UE88+u_+Dnaw@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Subject: Re: [linux-lvm] lvm_t handles and thread-safety
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek,
thank you for the clarification.

Alex.


On Mon, Aug 1, 2011 at 2:05 PM, Zdenek Kabelac <zdenek.kabelac@gmail.com> wrote:
> Dne 1.8.2011 10:12, Alexander Lyakas napsal(a):
>> Hello everybody,
>> I am using stock ubuntu natty with lvmlib 2.02.66.
>>
>> In my application I would like to have several threads, each operating
>> on a different VG.
>>
>> When I tried to share the same lvm_t handle between the threads, very
>> soon I got segmentation faults in dm_hash operations. Looking at the
>> code, I indeed saw that the contents of lvm_t are used without
>> synchronization.
>
>
> lvm library is not thread safe and it's quite far from being thread safe.
>
> So there is no point on having 2 handles on 2 VGs - it will not work.
>
>>
>> Are there any plans or intentions to provide some support for
>> threading with lvmlib?
>>
>
> With current version of lvm2 code there is no way.
>
> Just use the pthread mutex around the lvm command. It's serialized in kernel
> anyway. So you cannot gain any speed by using threads. (Check the clvmd code.)
>
>
> Zdenek
>
>
>
