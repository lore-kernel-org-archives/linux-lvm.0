Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k25KsK128271
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 15:54:20 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k25KsBSh002153
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 15:54:11 -0500
Received: by nproxy.gmail.com with SMTP id o25so775685nfa
	for <linux-lvm@redhat.com>; Sun, 05 Mar 2006 12:54:10 -0800 (PST)
Message-ID: <1d4c059f0603051227l6ca53c1foae4a7feb0390d6af@mail.gmail.com>
Date: Sun, 5 Mar 2006 15:27:41 -0500
From: "Joel Gwynn" <joelman@gmail.com>
Subject: Re: [linux-lvm] LVM drive changed from USB to Firewire
In-Reply-To: <44033100.6010600@tsss.org>
MIME-Version: 1.0
Content-Disposition: inline
References: <1d4c059f0602250659u54eeaa7bldce33e389430b1d6@mail.gmail.com>
	<20060225191211.GB31720@old.davidb.org> <44033100.6010600@tsss.org>
Content-Transfer-Encoding: 8bit
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

Thanks.  It turns out that on Debian the hotplug scripts run after the
mount scripts, so I ended up taking the LVM entries out of fstab
altogether and adding a script to do the vgscan, vgchange and mount.

On 2/27/06, kelsey hudson <khudson@tsss.org> wrote:
> David Brown wrote:
> >>The problem is that the drive is not found at boot anymore, and an
> >>error is raised because it can't be mounted. But if I do a vgscan,
> >>then a vgchage -ay, then mount -a, all is well and my volumes are
> >>mounted.
> >>
> >>How do I tell LVM to look at the firewire card instead of the usb controller?
> >
> > LVM should look at all of the devices.
> >
> > Most likely the firewire interface/driver takes longer to startup than the
> > USB does, and the drive isn't visible when the startup scripts do their
> > vgscan.
>
> i've had a bunch of success with one machine on which I run LVM by
> simply adding a 5-second wait period between the time the kernel calls
> /sbin/init and it begins executing the contents of whatever rc script
> init starts at your desired runlevel (add 'sleep 5' to the beginning of
> this script). kernel threads are great in some circumstances (like
> improving boot speed), but sometimes i guess you could say it boots too
> fast for its own good!
>
> just a side note though: my experience with ieee1394 under linux has
> been less-than-satisfactory: i can't seem to get a decent aggregate raw
> transfer rate of >11MByte/sec, no matter what hardware i use. i've since
>   switched back to usb2.0, even though usb is completely and wholly the
> wrong transport to use for mass storage devices :(
>
> if you can get your disks working faster than this, please let me know
> how you did it. :)
>
> thanks
> -kelsey
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
