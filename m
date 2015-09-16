Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8G8INFK027169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2015 04:18:23 -0400
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mx1.redhat.com (Postfix) with ESMTPS id 1FFA48CF76
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2015 08:18:22 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so59274551wic.1
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2015 01:18:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150911125104.GA8027@rh-vpn>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
Date: Wed, 16 Sep 2015 09:48:54 +0200
Message-ID: <CAAxjCEzXhCZc9NUx2Hprq9xyPej84UYFrjKh0m_GHoU38aAtww@mail.gmail.com>
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

On Fri, Sep 11, 2015 at 2:51 PM, Joe Thornber <thornber@redhat.com> wrote:
> On Thu, Sep 10, 2015 at 11:30:27AM +0200, Stefan Ring wrote:
>> Is this normal/expected? What does it do? Why does it write back huge
>> amounts of data to the HDD after each system start?
>
> No, this is not expected.  The most likely cause is your system was
> not shutdown cleanly so dm-cache has no choice but to assume all
> blocks are dirty and need writing back.  Make sure your volumes are
> being deactivated as part of shutdown.

I would have hoped that the distro scripts would take care of this.
Apparently not, for whatever reason :(. I have since upgraded to
kernel 4.2, and the behavior has not changed. I'll try to reboot today
instead of shutdown and see if anything changes.
