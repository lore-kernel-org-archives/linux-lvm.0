Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1LIpv128207
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 13:51:57 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1LIpujp031659
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 13:51:56 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1FBcc7-0001xn-G5
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 10:51:55 -0800
Date: Tue, 21 Feb 2006 10:51:55 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] LVM - help replacing a drive.
Message-ID: <20060221185155.GA7180@old.davidb.org>
References: <BAY101-F36B95A665C96EE64901F3CC1FC0@phx.gbl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY101-F36B95A665C96EE64901F3CC1FC0@phx.gbl>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 21, 2006 at 05:14:41PM +0000, Dave Schile wrote:

> This is a simple question, but I really don't want to lose any data, so I'd 
> really appreciate it if someone could give me a quick rundown on how this 
> is done. I've searched around and read the LVM Howto but Im still not 
> comfortable with this specific scenario:

I just did something similar, and it seemed to work fine.

> I have a simple implementation of LVM that creates logical volume from 
> /dev/hda3 and /dev/hdc1. /dev/hda is a 250G drive that holds the filesystem 
> on /dev/hda1, but only /dev/hda3 is part of the volume group. /dev/hdc1 is 
> a 100G drive with only one partition and its part of the volume group.

Sounds like a reasonable setup.

# lvs --segments -o +devices
will show you the device (and offset) of each segment of each logical
volume.  It is the most concise way to see where everything is at.

> I want to replace /dev/hdc1 with a 250G drive I just bought. Right now the 
> whole logical volume is 334G. All of that is allocated and none is free as 
> far as physical extens go. However, I only have 119G of data on the whole 
> logical volume. Is there any way to tell where physically that data 
> resides? I cannot do a pvmove (as I understand it) because I have no free 
> extens on /dev/hda3. Is it better to make extens available somehow on 
> /dev/hda3 and do a pvmove? or should I install the new drive somewhere 
> else, like /dev/hdb, then add it to the volume group and do a pvmove? If 
> that's the case, then will it screw up the volume group when I move the new 
> drive into its permanent location at /dev/hdc?

Well, assuming that you volume on /dev/hda3 is about 84G, you don't have
enough space to store all of your data on that drive.

If you have another interface to add another drive, that is by far the
easiest way to do it.  I've even added a physical volume on a USB drive,
but I'm not sure I recommend it.

LVM will have no problem with the drives moving around.  Part of each
physical volume is a uuid, and it builds the volume group out of those, not
specific locations.  This does, of course, assume that your startup scripts
are correct.

So, after you add /dev/hdb and partition /dev/hdb1 as your lvm partition.

  # pvcreate /dev/hdb1
  # vgextend vgname /dev/hdb1
  # pvmove /dev/hdc1
    .. Wait ..
  # lvs --segments -o +devices
     Make sure everything is off of /dev/hdc1
  # vgreduce vgname /dev/hdc1

Now you should be able to remove the hdc drive, and put the new drive on
its own controller.

And, standard caveat, do a backup before trying any of this.

Dave
