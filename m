Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0Q8t5Jn004171
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 03:55:05 -0500
Received: from destar.net (mail.destar.net [12.12.71.35])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0Q8sniJ022436
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 03:54:50 -0500
Message-ID: <20090125235446.9e4zqpl3y8wkowgc@www.destar.net>
Date: Sun, 25 Jan 2009 23:54:46 -0900
From: jonr@destar.net
Subject: Re: [linux-lvm] How to change the PV Volume Group name?
References: <1232950858.3807.26.camel@localhost.localdomain>
In-Reply-To: <1232950858.3807.26.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Quoting Doug Gray <dgra1233@bigpond.net.au>:

> Hi,
> I am a new here and new to lvm management, so be gentle please.
>

> I don't see a facility in pvchange to change the name.

I think you are looking for vgchange and not pvchange for this.


> Is it necessary to change the name?

It is helpful to name your vg's something other than letting the  
system name them. that way you won't have multiple vg's named the  
same, which quickly will become a nightmare to work with.

> How do I mount the CF partition?

Look at dmesg and see what device it is then mount it like a normal drive.

> How do I mount the CF partition file image?

If it is a vg then you will want to run
'vgchange -ay'
vgscan

The issue the lvs command to see your lv's.

Then you can mount the individual lv's of the vg.

> I would be grateful for any help.  This is straight forward with the
> normal disk volumes and partitions but to do so with lvm I am
> bamboozled.
>
> Doug Gray

Hope that helps,

Jon
