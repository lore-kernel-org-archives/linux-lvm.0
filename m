Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6O7l2ao008323
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2011 03:47:02 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6O7l1oX011999
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2011 03:47:02 -0400
Received: by iyb12 with SMTP id 12so5029352iyb.33
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2011 00:47:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy6xQKgLM+_WA7REuYxD-gQCi6QpJTEc_Ka6W=p5oyO4hg@mail.gmail.com>
References: <CAGRgLy6xQKgLM+_WA7REuYxD-gQCi6QpJTEc_Ka6W=p5oyO4hg@mail.gmail.com>
Date: Sun, 24 Jul 2011 10:47:01 +0300
Message-ID: <CAGRgLy6-ba=REk=RcOFAW7W3R3pu-eizRC1wWPZUcfBb=iML7Q@mail.gmail.com>
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
To: linux-lvm@redhat.com

OK, since nobody answered, let me perhaps ask a different question.

Is there any way to prevent any automatic LV activation/deactivation?
And have full manual control via lvm_lv_deactivate/lvm_lv_activate?

Setting activation = 0 in global section of lvm.conf did not do the
job, because then lvm_vg_create_lv_linear fails, so I even cannot
create a LV.

Thanks,
   Alex.


On Tue, Jul 19, 2011 at 5:14 PM, Alexander Lyakas
<alex.bolshoy@gmail.com> wrote:
>
> Hello everybody,
> I am using stock ubuntu natty with lvmlib 2.02.66:
> root@11:/mnt/work/alex# uname -a
> Linux 11 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011
> x86_64 x86_64 x86_64 GNU/Linux
>
> In my code I open a VG, iterate over all the LVs and then call
> lvm_lv_deactivate() on each LV. The return value is 0, and also
> immediately after that, I call lvm_lv_is_active() for each LV and
> assert that it returns 0 (not-active).
> Later in the code, I close the VG handle.
>
> However, when I issue lvdisplay from command-line, I still see:
> LV Status � � � � � � �available
> and the dm device files for the LVs are also present (/dev/dm-0 etc).
>
> As a result I cannot later stop the underlying md devices (PVs) using
> 'mdadm --stop'.
> If I do lvchange -an from the command line later, it succeeds, LV
> status becomes 'NOT available' and I am able to stop the md arrays.
>
> From looking at the code of lvmlib, it looks like lvm_lv_deactivate()
> does not require lvm_vg_write(); I see that lvchange implementation
> does not seem to call this when de-activating LVs. Still, I have tried
> to call lvm_vg_write() with same effect.
>
> No other application on the machine uses the same VG (at least not
> that I know of).
>
> Can anybody please advise what I might be missing.
>
> Thanks,
> �Alex.
