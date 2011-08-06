Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p76DMlIc031852
	for <linux-lvm@redhat.com>; Sat, 6 Aug 2011 09:22:47 -0400
Received: from mail-iy0-f170.google.com (mail-iy0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p76DMk6Y010394
	for <linux-lvm@redhat.com>; Sat, 6 Aug 2011 09:22:47 -0400
Received: by iye16 with SMTP id 16so5601292iye.29
	for <linux-lvm@redhat.com>; Sat, 06 Aug 2011 06:22:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALHAVFz8v1-WwYGu7+PLW1w84werJvU8kf9wy7YkwKXUvHM=3g@mail.gmail.com>
References: <CAGRgLy6xQKgLM+_WA7REuYxD-gQCi6QpJTEc_Ka6W=p5oyO4hg@mail.gmail.com>
	<CAGRgLy6-ba=REk=RcOFAW7W3R3pu-eizRC1wWPZUcfBb=iML7Q@mail.gmail.com>
	<CALHAVFz8v1-WwYGu7+PLW1w84werJvU8kf9wy7YkwKXUvHM=3g@mail.gmail.com>
Date: Sat, 6 Aug 2011 16:22:46 +0300
Message-ID: <CAGRgLy5jjVJfRcnnDCbd56XmVfv2X3+affQk3b5XDcPY6YqGXg@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm_lv_deactivate seems to have no effect,
 LV is still available in lvdisplay
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you, Prathyush.
I use lvmlib and not command-line tools. There is no FS on the LVs, so
there are no mount issues. I am issuing lvm_lv_deactivate() and it
succeeds. But later, the LV is active again....

Alex.


On Tue, Jul 26, 2011 at 5:45 AM, Prathyush <prathyush.r@gmail.com> wrote:
> Hi,
>
> Hope its not dismounted properly .
> Do a resize2fs again and lvchange -an
>
> Regards
> Prathyush
>
> On Sun, Jul 24, 2011 at 1:17 PM, Alexander Lyakas <alex.bolshoy@gmail.com>
> wrote:
>>
>> OK, since nobody answered, let me perhaps ask a different question.
>>
>> Is there any way to prevent any automatic LV activation/deactivation?
>> And have full manual control via lvm_lv_deactivate/lvm_lv_activate?
>>
>> Setting activation = 0 in global section of lvm.conf did not do the
>> job, because then lvm_vg_create_lv_linear fails, so I even cannot
>> create a LV.
>>
>> Thanks,
>> � Alex.
>>
>>
>> On Tue, Jul 19, 2011 at 5:14 PM, Alexander Lyakas
>> <alex.bolshoy@gmail.com> wrote:
>> >
>> > Hello everybody,
>> > I am using stock ubuntu natty with lvmlib 2.02.66:
>> > root@11:/mnt/work/alex# uname -a
>> > Linux 11 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011
>> > x86_64 x86_64 x86_64 GNU/Linux
>> >
>> > In my code I open a VG, iterate over all the LVs and then call
>> > lvm_lv_deactivate() on each LV. The return value is 0, and also
>> > immediately after that, I call lvm_lv_is_active() for each LV and
>> > assert that it returns 0 (not-active).
>> > Later in the code, I close the VG handle.
>> >
>> > However, when I issue lvdisplay from command-line, I still see:
>> > LV Status � � � � � � �available
>> > and the dm device files for the LVs are also present (/dev/dm-0 etc).
>> >
>> > As a result I cannot later stop the underlying md devices (PVs) using
>> > 'mdadm --stop'.
>> > If I do lvchange -an from the command line later, it succeeds, LV
>> > status becomes 'NOT available' and I am able to stop the md arrays.
>> >
>> > From looking at the code of lvmlib, it looks like lvm_lv_deactivate()
>> > does not require lvm_vg_write(); I see that lvchange implementation
>> > does not seem to call this when de-activating LVs. Still, I have tried
>> > to call lvm_vg_write() with same effect.
>> >
>> > No other application on the machine uses the same VG (at least not
>> > that I know of).
>> >
>> > Can anybody please advise what I might be missing.
>> >
>> > Thanks,
>> > �Alex.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> --
> Regards,
> Prathyush
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
