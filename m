Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8HF8NLQ029355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2015 11:08:23 -0400
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mx1.redhat.com (Postfix) with ESMTPS id 69117C0B91BA
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2015 15:08:22 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so123061095wic.0
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2015 08:08:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAxjCEzXhCZc9NUx2Hprq9xyPej84UYFrjKh0m_GHoU38aAtww@mail.gmail.com>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
	<CAAxjCEzXhCZc9NUx2Hprq9xyPej84UYFrjKh0m_GHoU38aAtww@mail.gmail.com>
Date: Thu, 17 Sep 2015 17:08:21 +0200
Message-ID: <CAAxjCEy3kVASKzfpiFXKYDHb3h3paq0dv8bxeGAnV+8C2EvgFA@mail.gmail.com>
From: Stefan Ring <stefanrin@gmail.com>
Subject: Re: [linux-lvm] Strange dm-cache activity at startup
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

On Wed, Sep 16, 2015 at 9:48 AM, Stefan Ring <stefanrin@gmail.com> wrote:
> I would have hoped that the distro scripts would take care of this.
> Apparently not, for whatever reason :(. I have since upgraded to
> kernel 4.2, and the behavior has not changed. I'll try to reboot today
> instead of shutdown and see if anything changes.

Nothing has changed. However, I noticed this in dmesg during startup:

device-mapper: cache: You have created a cache device with a lot of
individual cache blocks (3491776)
All these mappings can consume a lot of kernel memory, and take some
time to read/write.
Please consider increasing the cache block size to reduce the overall
cache block count.

Now I'll have to see what to do about that.
