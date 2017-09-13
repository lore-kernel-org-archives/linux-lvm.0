Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 493CC5D744
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 21:36:53 +0000 (UTC)
Received: from sonic305-21.consmr.mail.gq1.yahoo.com
	(sonic305-21.consmr.mail.gq1.yahoo.com [98.137.64.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E6B84E33A
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 21:36:52 +0000 (UTC)
Date: Wed, 13 Sep 2017 21:36:48 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <498090067.1559855.1505338608244@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <498090067.1559855.1505338608244.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Xen wrote:

> The issue with scripts is that they feel rather vulnerable to  corruption, not being there etc.

Only you are responsible for making sure scripts are available and correctly written.

>  So in that case I suppose that you would want some default, shipped  scripts that come with LVM as
> example for default behaviour and that are  also activated by default?
...
> /usr/share/lvm/scripts/

Heck no to activation. The only path that's correct is that last one. The previously supplied example code should have been more than enough for you to venture out on your own and write custom logic.
 
> Then not even a threshold value needs to be configured.

Nobody else wants your particular logic, run interval, or thresholds. Write your scripts to suck in /etc/sysconfig/lvm/<vgname> or whatever the distro of your choice puts such things.
 
> Yes. One obvious scenario is root on thin.
> It's pretty mandatory for root on thin.

Can you elaborate with an example? Because that's the most dangerous one not to have space fully reserved unless you've established other means to ensure nothing writes to that volume or the writes are very, very well defined. ie. 'yum update' is disabled, nobody has root, the filesystem is mounted RO, etc.
 
>  You cannot set max size for thin snapshots?

And you want to do that to 'root' volumes?!?!
 
> you cannot calculate in advance what can  happen,
> because by design, mayhem should not ensue, but what if your
> predictions are off?

Simple. You don't do stupid things like NOT reserving 100% of space in a thinLV for all root volumes. You buy as many hard drives as necessary so you don't get burned.

> Being able to set a maximum snapshot size before it gets dropped could  be very nice.

Write your own script that queries all volumes, and destroys those that are beyond your high-water mark unless optionally they are "special".

> When free space on thin pool drops below ~120MB

At best your user-space program runs each minute and writing 120MB takes a couple seconds and thus between runs of your 'monitor' you've blown past any chance of taking action.

8TB drives are $250 bucks. buy disk. and buy more disk already and quadruple your notion of reserves. If your workload isn't critical then nobody cares if you blow it sky high and you can do silly things like shaving too close. But I have to ask, to what possible purpose?

> I want the 20GB volume  and the 10GB volumes to be frozen

It takes time for a script log into each KVM domain and issue an fsfreeze or even to just suspend the VM from the hypervisor. Meanwhile writers are potentially writing at several hundred MB per second. You're looking at a massive torrent of write errors.

> much deleted

Sounds like you got all the bits figured out. Write the script and post it to GitHub or PasteBin.


> so that the burden on the administrator is very minimal.

No sysadmin worth a damn is going to not spend a LOT of time thinking whether this sort of thing is even rational, and if so, where they want to draw the line. This sort of behavior doesn't suffer fools gladly nor is it appropriate for people to attempt who don't first know what they are doing. Some parts of Linux/Unix are Experts-Only for a reason.
