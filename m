Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8Q05KV31325
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2005 20:05:20 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8Q059J2026577
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2005 20:05:14 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j8Q04vbB018262
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2005 02:04:58 +0200
Subject: Re: [linux-lvm] LVM Status?
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <D3DC8F9206F0D24085E459720ECDF3ED693EFF@mail-18ps.atlarge.net>
References: <D3DC8F9206F0D24085E459720ECDF3ED693EFF@mail-18ps.atlarge.net>
Date: Mon, 26 Sep 2005 02:04:58 +0200
Message-Id: <1127693099.15029.1.camel@pc7.dolda2000.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2005-09-25 at 10:15 -0500, Don Shesnicky wrote:
> How do you check the status of an LVM set of disks in RHEL3 and 4?
> The LVM FAQ mentions that you should have a /proc/lvm but my default
> RHEL3 and 4 systems do not have this directory in /proc and doing a
> Modprobe for lvm-mod does not create one. On an RHEL4 test system I
> do see an lvm tool but it doesn't show the status. 

I'm not *sure* about this, but I believe that /proc/lvm was only used
for LVM 1.0, while device-mapper doesn't have such a thing. RHEL3 is
based on a 2.6 kernel, right?

How about the userspace tools instead? Try pvdisplay, vgdisplay or
lvdisplay, depending on what info you want. Or is there some other info
that you're hunting for?

Fredrik Tolf
