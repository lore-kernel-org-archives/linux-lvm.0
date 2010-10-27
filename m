Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9R5r3qU029329
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2010 01:53:04 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9R5qpvD004686
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2010 01:52:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id E4C8886FB4
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2010 07:52:49 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id VOSU1pRjYP1I for <linux-lvm@redhat.com>;
	Wed, 27 Oct 2010 07:52:44 +0200 (CEST)
Date: Wed, 27 Oct 2010 07:52:44 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20101027055244.GA12653@maude.comedia.it>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
Subject: Re: [linux-lvm] Determine boot disk device name...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Oct 23, 2010 at 10:58:03PM -0400, Jon Price wrote:
>Hi,
>For starters, how can I determine the physical device name of current/active
>boot disk in Linux?
which architecture?

with x86 it is impossible to determine from what device the current
system has booted, and it is very difficult to guess which device will
be used to boot next time, this is why grub uses a device map to
associate bios hard disks to devices, which is configured at install
time.

On different arches you could have some interface to query nvram.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
