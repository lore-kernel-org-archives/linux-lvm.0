Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9VEnv7J017110
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 10:49:58 -0400
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9VEnsFG017085
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 10:49:56 -0400
Received: by mail-lb0-f177.google.com with SMTP id 10so6208620lbg.36
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 07:49:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54539A35.9050601@redhat.com>
References: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>
	<54535811.3050906@redhat.com> <54535B0B.50700@redhat.com>
	<CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
	<54539A35.9050601@redhat.com>
Date: Fri, 31 Oct 2014 10:49:54 -0400
Message-ID: <CANHNcP8TSbwWtFn7YmNkjq3GjB3+NjMtCDJ_iK0A9omGxKWmfQ@mail.gmail.com>
From: Roman Mashak <roman.mashak@gmail.com>
Subject: Re: [linux-lvm] vgscan can't see LVM volumes on QEMU image
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Peter,

2014-10-31 10:18 GMT-04:00 Peter Rajnoha <prajnoha@redhat.com>:
[skip]
>> After I disabled the daemon, vgscan has found the volume group on the
>> image and I could mount it;however I observed that after the vgscan
>> has completed, lvmetad has started running back again (probably it
>> doesn't hurt).
>
> OK, so that's certainly a problem with pvscan not run from udev for
> nbd devices at proper time - we still need to fix this - we haven't
> covered this yet properly. It needs special treatment like we do
> in /lib/udev/rules.d/69-dm-lvm-metad.rules for MD and loop devs.
>
> The lvmetad running back - have you also disabled lvmetad in lvm.conf
> (use_lvmetad=0)?

Thanks, I didn't disable use_lvmetad in lvm.conf.

>
>>> What is the lvm2 version in use here ?
>>
>> Where can I find this information?
>>
>
> Just run "lvm version"

% lvm version
  LVM version:     2.02.106(2) (2014-04-10)
  Library version: 1.02.85 (2014-04-10)
  Driver version:  4.27.0
%

-- 
Roman Mashak
