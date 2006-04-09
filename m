Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k392xuVq024106
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 22:59:56 -0400
Received: from black.open2space.com ([68.144.188.211])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k392xk4H021214
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 22:59:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id 689B431A61
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2006 02:59:41 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id 45C0E31BA5
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2006 02:59:40 -0600 (MDT)
Received: from black.open2space.com ([127.0.0.1])
	by localhost (black [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 00312-10 for <linux-lvm@redhat.com>;
	Sun,  9 Apr 2006 02:59:37 -0600 (MDT)
Received: from [192.168.0.20] (unknown [192.168.0.20])
	by black.open2space.com (Postfix) with ESMTP id CA864319B3
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2006 02:59:36 -0600 (MDT)
From: Shawn <sgrover@open2space.com>
Subject: Re: [linux-lvm] Recovering data from a damaged LVM partition?
Date: Sat, 8 Apr 2006 20:59:40 -0600
References: <200604061545.09082.sgrover@open2space.com>
In-Reply-To: <200604061545.09082.sgrover@open2space.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604082059.40457.sgrover@open2space.com>
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

I managed to work out a method to recover the lost data.  I've documented this 
on my blog (http://grover.open2space.com/node/17), for anyone who may be 
facing a similar problem.

Of course, I'm sure those more experienced with LVM may have suggestions, and 
I'd be happy to hear them.  The solution basically meant learning more about 
LVM in general.

Shawn

On Thursday 06 April 2006 15:45, Shawn wrote:
> First post to this list, so please forgive me if I'm not on topic, or
> repeating a common issue.
>
> I have been asked to try to get data from a drive with a damaged partition.
> In the past I've done this with ddrescue, and then mounted the resulting
> image file.  That's not working in this case because the partition in
> question was part of an LVM volume.
>
> My experience with LVM is not that great, as I've never seen a need for it
> on my systems.  But, I've installed the LVM tools, and modified my kernel
> for LVM support, and can at least see the volume on the damaged drive now. 
> But I want to focus on the image file, not the drive.
>
> So, the question is how to mount an image file of an LVM partition? 
> Anytime I try the mount command, it's complaining about the file system
> type.  I've tried the different options for the -t argument, (and am using
> the -o loop as well).
>
> I'm hesitant to run any of the LVM commands to create a volume set, or
> intialize a partition, for fear of loosing the data.  (though I could run
> ddrescue again I suppose, as long as I don't touch the source drive).
>
> Does anyone have any experience here they'd care to share?  Thanks.
>
> BTW, the disk in question is from a default install of Fedora Core 4, and
> the system only had a single drive.  So LVM probably wasn't needed in this
> case, but the person that installed the system is not comfortable with the
> file system details.
>
> Shawn
