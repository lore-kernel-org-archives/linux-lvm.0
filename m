Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAHN0Jr17492
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 18:00:19 -0500
Received: from mail.iinet.net.au (mail-05.iinet.net.au [203.59.3.37])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iAHN0BLL000406
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 18:00:17 -0500
Subject: Re: Re: [linux-lvm] Software RAID 5 Resizing and LVM
From: Adam K-F <adam@slackguy.net>
In-Reply-To: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>
References: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>
Content-Type: multipart/mixed; boundary="=-0XYuFc6r4HsJu7FErrnb"
Date: Thu, 18 Nov 2004 07:01:35 +0800
Message-Id: <1100732495.2496.6.camel@Slacktop.local>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-0XYuFc6r4HsJu7FErrnb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Jon,

What I was trying to achieve was a a single, really big raid drive that
I could _easily_ expand later on down the track.  It only needs to have
the single filesystem on it (i'm going to use reiserfs) which has to be
resizable (using resize_reiserfs).

So yeah, I ended figuring out what i actally needed to do in the end,
after playing with LVM, which incidently was a bit of fun :)  I've found
an application for it for my other file server. As they say, all's well
that ends well :)

Adam

--=-0XYuFc6r4HsJu7FErrnb
Content-Disposition: inline
Content-Description: Forwarded message - Re: [linux-lvm] Software RAID 5
	Resizing and LVM
Content-Type: message/rfc822

Return-Path: <Jetkins@austinlogistics.com>
Delivered-To: 47-adam@slackguy.net
Received: (qmail 27927 invoked from network); 17 Nov 2004 16:53:11 -0000
Received: from mail.austinlogistics.com (HELO www.austinlogistics.com)
	(69.150.203.234) by bbw.org.au with SMTP; 17 Nov 2004 16:53:11 -0000
In-Reply-To: <1100647794.419a8d72734bb@webmail.slackguy.net>
Subject: Re: [linux-lvm] Software RAID 5 Resizing and LVM
To: adam@slackguy.net
X-Mailer: Lotus Notes Release 6.0.4 June 01, 2004
Message-ID: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Wed, 17 Nov 2004 10:53:00 -0600
X-MIMETrack: Serialize by Router on Uni/AustinLogistics(Release 6.0.4|June
	01, 2004) at 11/17/2004 10:53:11 AM
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


I asked pretty much that exact question on Monday! :)  The only difference
was that mine is a hardware RAID.  Someone replied with a possible
workaround if you're using LVM2, but if you're using LVM1 like me, and you
pvcreate'd your PV across the entire disk like me, then you're screwed like
me. :(

If you partitioned the logical disk and pvcreate'd a partition, then you
should be able to create a new partition on the newly-available space, then
pvcreate a second PV and add it into the VG.  The wonders of 20/20
hindsight.

Cheers,

Jon Etkins
IT Administration & Support
Austin Logistics, Inc
ph:  (512) 651-5641
fax: (512) 329-5625


linux-lvm-bounces@redhat.com wrote on 11/16/2004 05:29:54 PM:

> I've been playing around with adding disks to a software RAID 5 array,
and it
> works fine.  However, i have LVM running over the top of that and i can't
> figure out how to enlarge the Phisical Volume to encompass the newly
added
> capacity on the raid device.  Has anyone achieved this at all?
>
> Am I barking up the wrong tree here? If so, how would you go about
> adding drives
> to a software RAID 5 device, and actually adding the new space to
> the filesystem
> inside the RAID device?
>
> Thanks in advance
>
> Adam
>
> ----------------------------------------------------------------
> This message was sent using IMP, the Internet Messaging Program.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=-0XYuFc6r4HsJu7FErrnb--
