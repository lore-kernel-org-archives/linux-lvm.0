Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8ADBZPd021304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 09:11:35 -0400
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mx1.redhat.com (Postfix) with ESMTPS id 99DE48EA46
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 13:11:34 +0000 (UTC)
Received: by qgx61 with SMTP id 61so34383253qgx.3
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 06:11:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55F17EC1.6070903@redhat.com>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<55F17EC1.6070903@redhat.com>
Date: Thu, 10 Sep 2015 15:11:32 +0200
Message-ID: <CAAxjCEw1Jv_UUc81H_dWVVyfkiR_C9rZaRD6ioXOxddpuzZB4g@mail.gmail.com>
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

On Thu, Sep 10, 2015 at 2:59 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Please first try to use the latest kernel.
> Kernel 3.17 is almost a year old.
>
> Lots of optimizations went in meanwhile.
> It's pointless to hunt already fixed bug.

No problem. I'll soon upgrade to 4.2 because I'm eager to try smq.
I've been held back by a zfsonlinux bug that has prevented an upgrade
and has only very recently been fixed.
