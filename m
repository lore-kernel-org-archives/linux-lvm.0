Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0GL386C016764
	for <linux-lvm@redhat.com>; Thu, 16 Jan 2014 16:03:08 -0500
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0GL37vj002283
	for <linux-lvm@redhat.com>; Thu, 16 Jan 2014 16:03:07 -0500
Received: by mail-pb0-f51.google.com with SMTP id rp16so3187071pbb.38
	for <linux-lvm@redhat.com>; Thu, 16 Jan 2014 13:03:07 -0800 (PST)
Received: from leela (host-134-71-248-24.allocated.csupomona.edu.
	[134.71.248.24])
	by mx.google.com with ESMTPSA id sx8sm22977031pab.5.2014.01.16.13.03.05
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 13:03:06 -0800 (PST)
Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
References: <87zjmxzmga.fsf@red.mvo.lan>	<52D6B4AF.9010007@mglug.de>	<CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>	<084301cf125a$d4b4a980$7e1dfc80$@acm.org>
	<52D7714F.3080105@redhat.com>
In-Reply-To: <52D7714F.3080105@redhat.com>
Date: Thu, 16 Jan 2014 13:03:02 -0800
Message-ID: <093401cf12fe$59e75640$0db602c0$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> Peter Rajnoha
> Sent: Wednesday, January 15, 2014 9:43 PM
>
> This applies only if the symlinks/nodes are created directly with
> libdevmapper - which is the old classical way.
> If udev is used to manage /dev
> content for dm/lvm devices then the /dev/vg/vol is a symlink to /dev/dm-X
> (also /dev/mapper/vg-vol is a symlink to /dev/dm-X). And dm-X is not a

Hmm, yah, I see on my RHEL6 boxes that is indeed the case, as opposed to my
older RHEL5 boxes.

> As for mount, findmnt and other utilities from util-linux - they all use
> one common code which can handle this situation (e.g. if you call
> "findmnt /dev/vg/vol", it shows you /dev/mapper/vg-vol on output, not
> the dm-X the /dev/vg/vol is referencing actually).

IIRC, this thread started when somebody was being advised *not* to use the
/dev/mapper path, but rather to use the /dev/vg path. If there is special
case handling in util-linux, why isn't it returning what is being advertised
as the preferable path to use rather than the one that is said to be
internal and not to be referenced?
