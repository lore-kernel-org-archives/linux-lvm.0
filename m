Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7O9Egvp001834
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 05:14:42 -0400
Received: from mail-iy0-f170.google.com (mail-iy0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7O9Efsc025045
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 05:14:41 -0400
Received: by iye16 with SMTP id 16so1806682iye.29
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 02:14:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E5392A6.6000201@redhat.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
Date: Wed, 24 Aug 2011 12:14:41 +0300
Message-ID: <CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek,
thank you for your reply.

I am using stock ubuntu natty:
2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011 x86_64
x86_64 x86_64 GNU/Linux
and 2.02.66 is what comes with natty.

I will check the udev rules part further.

If I want to try the new LVM package, say LVM2.2.02.88.tgz, do I need
to do any update to the kernel, or will it work with my existing
kernel 2.6.38-8-server.

Thanks,
  Alex.

On Tue, Aug 23, 2011 at 2:44 PM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
> Dne 21.8.2011 20:14, Alexander Lyakas napsal(a):
>> Greetings all,
>> on stock ubuntu natty, using liblvm 2.02.66, sometimes
>> lvm_vg_create_lv_linear () gets stuck in the following stack.
>>
>> #0 �0x00007f3b9636a0f7 in semop () from /lib/x86_64-linux-gnu/libc.so.6
>> #1 �0x00007f3b9606863c in dm_udev_wait () from /lib/libdevmapper.so.1.02.1
>> #2 �0x00007f3b973df41b in ?? () from /lib/liblvm2app.so.2.2
>>
>
> dmsetup udevcomplete_all
>
> this should finish the execution of this command.
>
>>
>> I realize that somehow it is related to udev synchronization. In my
>> application, I have a udev monitor for "block" subsystem type, but
>> currently it does nothing with the events it receives (it calls
>> udev_monitor_receive_device(), udev_device_get_action() and then
>> udev_device_unref() for every event. I plan in the future to use it
>> for waking up other threads.
>>
>> Can somebody pls advise on how to investigate this issue. It does not
>> happen always.
>
>
> My assumption is - you Debian system is using non-upstream Debian deviation of
> udev rules and those are broken (I guess some related discussion might be googled)
>
> Another issue which is currently being explored is the namespace usage - but I
> think this is not related to the problem you are seeing.
>
> Anyway I'd strongly suggest to use newer lvm package (either build form CVS)
> or at least �Debian unstable version - as 2.02.66 is very old one.
>
> Zdenek
>
>
