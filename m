Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r999hFT1002330
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 05:43:15 -0400
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r999hER5002550
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 05:43:14 -0400
Received: by mail-qa0-f53.google.com with SMTP id k4so449646qaq.19
	for <linux-lvm@redhat.com>; Wed, 09 Oct 2013 02:43:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52550C81.2020607@fu-berlin.de>
References: <5253CB06.2000901@fu-berlin.de>
	<CAJc7SsYG90wMMaK6SrM-mNTiFhDxRJYGR3WapchAZSWD9vsdYw@mail.gmail.com>
	<1381273135.70303.YahooMailNeo@web181501.mail.ne1.yahoo.com>
	<52550C81.2020607@fu-berlin.de>
From: Gabriel <jarod125@gmail.com>
Date: Wed, 9 Oct 2013 12:42:54 +0300
Message-ID: <CAJc7SsZ8L607fhRzWZPtsiqMFfwxjCHikDWCm83eDdFs0wsNdw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Find Correct LE Size of ext4 Filesystem (16TB)
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I think what Matthew is saying is that you should first shrink your
filesystem to a smaller size (15.8 TiB), then adjust the LV size to 16
TiB (this is safe because the filesystem above is smaller) and finally
resize the filesystem to the LV size (resize2fs /your/filesystem).
This is a much safer approach and leaves you with no unused space.

On Wed, Oct 9, 2013 at 10:57 AM, Sebastian Walter
<sebastian.walter@fu-berlin.de> wrote:
> Hi Matthew,
>
> On 10/09/2013 12:58 AM, matthew patton wrote:
>
>>
>> The whole point of using LVM is to dispense with the malarky of hard disk partitions so I don't know why you're resizing them. If I read your email correctly you're going about this dangerously.>
>
> Thanks for pointing this out. Now I realize that I used the term
> "partition" instead of "filesystem" erroneously (changed subject).
>
> What I initially wanted to do is to extend the filesystem to the whole
> size of the underlying physical disks. So first I extended the LV to
> fill the disks (19TB). As the second step I wanted to resize the ext4
> filesystem to the LV size of 19TB. This last step failed with an error
> message saying that tune4fs can't allocate more than 16TB. Setting the
> filesystem's size to 16T worked.
>
> Now I have a 16TB filesystem on a 19.18TB logical volume. The additional
> 3TB are unused on the LV so I want to reduce the LV to the same size as
> the filesystem. This way I could use the 3TB for other LVs.
>
>> 3) resize2fs (no args) <LV device>
>>
>> Step 3 will resize the FS to as close as the LV size allows and won't let you write past the LV's endpoint like your method makes so easy to screw up when doing the extent calculation. Maybe your maths are always perfect but I wouldn't risk my data for a measly few bytes. Do it the fool-proof way.
>
> I agree with you that resizing the filesystem to the therotical values
> of the LV geometry is much too risky.
>
> What would be the fool-proof way? Creating a new filesystem on a 16TB LV
> and copying the data from the backup?
>
> Or is it really safe to reduce the LV by some amount - let's say 2.5TB -
> and sacrifice 500GB for safety?
>
> Thanks! Sebastian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
