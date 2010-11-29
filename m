Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATH0vgu011460
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 12:00:58 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATH0lt0020458
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 12:00:48 -0500
Received: by eye27 with SMTP id 27so2049606eye.33
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 09:00:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101129162756.GN16420@barkeeper1-xen.linbit>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
	<20101129162756.GN16420@barkeeper1-xen.linbit>
Date: Tue, 30 Nov 2010 00:00:46 +0700
Message-ID: <AANLkTikparzJ5H_uPVNAYD1o4xpMH5XPDLcuvkCsejTX@mail.gmail.com>
From: hansbkk@gmail.com
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
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

On Mon, Nov 29, 2010 at 11:27 PM, Lars Ellenberg
<lars.ellenberg@linbit.com> wrote:
> Did you consider DRBD?
>

I mentioned that as a "down the road" possibility in my last paragraph
- I just spelled it wrong :)

> An enhancement of this idea would be to implement the "TopRAID" with a full-server mirror using drdb and heartbeat. . .


No budget at the moment for a extra filer, nor for the hefty WAN needed.
