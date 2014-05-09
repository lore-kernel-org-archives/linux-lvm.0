Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s49CehnL020305
	for <linux-lvm@redhat.com>; Fri, 9 May 2014 08:40:43 -0400
Received: from feynman.spatium.org (feynman.spatium.org [178.248.248.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s49Cefd1005214
	for <linux-lvm@redhat.com>; Fri, 9 May 2014 08:40:42 -0400
Date: Fri, 9 May 2014 14:40:40 +0200
From: Michal Svoboda <lvm@spatium.org>
Message-ID: <20140509124040.GA686@feynman.spatium.org>
References: <20140508104546.GA610@feynman.spatium.org>
	<536CC710.4030708@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <536CC710.4030708@redhat.com>
Subject: Re: [linux-lvm] No device found for PV but is actually fine
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
To: linux-lvm@redhat.com

Marian Csontos wrote:
> Michal(-e), I suggest modifying global_filter to accept only the
> devices you want in the VG.

Hi,

I've tried playing with filter and global_filter in lvm.conf, but it did
not help - as if the conf file was ignored. I tried blacklisting and
whitelisting. Does something need to be restarted/rebooted for these
settings to take effect?

I then did some more experiments and eventually solved the issue.

First I tried pvscan --cache /dev/md0, at which point md0 was "accepted"
as existing PV, and the "system" VG would show up in vgdisplay. I was
even able to resize one of the LVs. However, after running pvscan --cache
with no extra agruments, I would receive the duplicate PV errors as in
previous e-mail and the "system" VG would disappear from vgdisplay. :-o

Finally I solved the issue by changing initcpio hook from "mdadm_udev"
to "mdadm". This is arch-linux specific thing that changes stuff that is
exported to the initial ramdisk used for boot. User-wise, that change
would stop using udev auto-magic for assembling md arrays, but use
/etc/mdadm.conf directly instead. I don't know the implementation details.

After that I receive *no more errors* about either missing or duplicate
PV and all VGs/LVs are displayed by the respective display commands. So
for me issue is solved but if anyone wants to get to the bottom I am
open to do some more experiments.


Michal Svoboda
