Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0FKOrNG001662
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 15:24:53 -0500
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0FKOpUp030238
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 15:24:51 -0500
Received: by mail-qc0-f182.google.com with SMTP id c9so1458686qcz.41
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 12:24:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52D6B4AF.9010007@mglug.de>
References: <87zjmxzmga.fsf@red.mvo.lan>
	<52D6B4AF.9010007@mglug.de>
Date: Thu, 16 Jan 2014 00:24:50 +0400
Message-ID: <CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 15, 2014 at 8:17 PM, Oliver Rath <rath@mglug.de> wrote:
> Hi Marius!
>
> the /dev/mapper/.. devices are for internal use only.

If so, how come most commands use it (df, mount, findmnt, etc..) and
not /dev/vg/vol notation?

Thanks!
