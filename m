Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3CCEAru031129
	for <linux-lvm@redhat.com>; Thu, 12 Apr 2012 08:14:10 -0400
Received: from nelson.canoo.com (gate0.canoo.com [195.141.68.118])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3CCE8oo009996
	for <linux-lvm@redhat.com>; Thu, 12 Apr 2012 08:14:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by nelson.canoo.com (Postfix) with ESMTP id A1DDD6FC093
	for <linux-lvm@redhat.com>; Thu, 12 Apr 2012 14:14:08 +0200 (CEST)
Received: from nelson.canoo.com ([127.0.0.1])
	by localhost (nelson.canoo.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LgexknTVHSF for <linux-lvm@redhat.com>;
	Thu, 12 Apr 2012 14:14:08 +0200 (CEST)
Received: from nelson.canoo.com (nelson.canoo.com [192.168.0.9])
	by nelson.canoo.com (Postfix) with ESMTP id 2CC716FC031
	for <linux-lvm@redhat.com>; Thu, 12 Apr 2012 14:14:08 +0200 (CEST)
Date: Thu, 12 Apr 2012 14:14:08 +0200 (CEST)
From: Erik Schwalbe <erik.schwalbe@canoo.com>
Message-ID: <1943758108.360003.1334232848115.JavaMail.root@nelson.canoo.com>
In-Reply-To: <4F86C1F4.4080809@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Hide volume group during startup
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

there is only one dm-device in /dev:

...
drwxr-xr-x  5 root root         100 2012-04-05 12:50 disk
brw-rw----  1 root disk    251,  18 2012-04-05 12:51 dm-18
drwxr-xr-x  4 root root          80 2012-04-05 12:51 drbd
...

/dev/data/kvm_disk0 is a blockdevice for drbd, so there are many drbd files in /dev

...
brw-rw----  1 root disk    147,  20 2012-04-08 11:48 drbd20
...

drbd20 is the drbd resource using kvm_disk0 as device.

The symlink in /dev/data/ is:

lrwxrwxrwx  1 root root   24 2012-04-05 12:51 kvm_disk0 -> ../mapper/data-kvm_disk0

Should I be using this:

filter = [ "r|/dev/mapper/data-kvm_disk0|", "r|/dev/kvm_disk0|", "a|.*|"]
 
I know, it is a little bit confusing.
The LV in VG data is called kvm_disk0 and the VG initiated on this device is also called kvm_disk0.

Sorry, but thank you for help.

Regards,
Erik


----- Original Message -----
From: "Bryn M. Reeves" <bmr@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Cc: "Erik Schwalbe" <erik.schwalbe@canoo.com>
Sent: Thursday, 12 April, 2012 1:52:20 PM
Subject: Re: [linux-lvm] Hide volume group during startup

On 04/12/2012 12:41 PM, Erik Schwalbe wrote:
> Hi,
> 
> filter was:
> 
> filter = [ "r|/dev/data/kvm_disk0|" ]
> 
> path:
> /dev/data/kvm_disk0 -> ../mapper/data-kvm_disk0

To filter a device-mapper device you also have to filter out the
/dev/dm-N device nodes that udev manages. There's also a symlink from
/dev/$VG_NAME/$LV_NAME to the dm-N node (although I think that should be
handled by filtering /dev/dm-N).

I'd be using something like:

    [ "r|/dev/dm.*|", "r|/dev/$VG_NAME|", "a|.*|"]

Alternately (and I prefer this for many configurations) you can accept
("a|..|") the device you need for the data VG and reject all other
devices ("r|.*|").

> The device name is stable, but what other way of control activation are possible??

Tags but since you're not currently filtering dm-N nodes I would try
that first.

Regards,
Bryn.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
