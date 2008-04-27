Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3RNmU2Y012316
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 19:48:30 -0400
Received: from fmailhost01.isp.att.net (fmailhost01.isp.att.net
	[204.127.217.101])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3RNmJ1x011494
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 19:48:19 -0400
Message-ID: <481510BA.2040706@bellsouth.net>
Date: Sun, 27 Apr 2008 18:48:10 -0500
From: Dale <dalek1967@bellsouth.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>	<4813D644.7080003@Media-Brokers.com>	<4813E225.7040900@kadzban.is-a-geek.net>	<4814D88C.3050304@Media-Brokers.com>
	<48150E36.7090708@kadzban.is-a-geek.net>
In-Reply-To: <48150E36.7090708@kadzban.is-a-geek.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryan Kadzban wrote:
>   < SNIP >
>
> Some of the horror stories that I've heard are exactly the case that
> you're protecting against with your batteries: Supposedly a sudden
> removal of power causes some grief with certain journaling methods,
> including the method that reiserfs uses.  (Or used to use; maybe it's
> changed since then.)
>
  < SNIP >

I think things have changed since then.  I have had to on a couple 
occasions unplug my rig or use the halt command and not have a clean 
shutdown.  It fixes the errors when I reboot, if any.  I have read where 
others have done the same with no losses. 

I have tried XFS and others and had trouble in these areas before.  That 
is one reason I use reiserfs and it came highly recommended because it 
can recover so well.

On XFS, if you have a UPS and can always have a clean shutdown, very 
cool.  It seriously hates unclean shutdowns.

Dale

:-)  :-) 
