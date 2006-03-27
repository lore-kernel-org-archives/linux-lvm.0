Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2R5oxTS001831
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 00:50:59 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2R5oxGS001124
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 00:50:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 9DFFFD8FB
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 05:50:58 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 20723-01-4 for <linux-lvm@redhat.com>;
	Mon, 27 Mar 2006 05:50:55 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id B80B7D904
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 05:50:55 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] online resize
Date: Sun, 26 Mar 2006 23:50:53 -0600
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260537.00242.krakrjak@volumehost.net>
	<20060326123511.GS31387@lug-owl.de>
In-Reply-To: <20060326123511.GS31387@lug-owl.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603262350.53701.krakrjak@volumehost.net>
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

On Sunday 26 March 2006 06:35, Jan-Benedict Glaw wrote:
> Nice story, but as a bug report, this is mostly useless:
This is not a bug report.  I did not file one (at the time I didn't have the 
time to track it).  And I needed my data then.  The time it would take to 
track the bug down, get a fix and get it running would have put me even 
further behind.  I remade the fs into reiser3 and restored the data.  I have 
had many successful resizes (but grow and shrink) since using reiser3.

>   * After umount, did you run an e2fsck -f?
Yes.

>   * Do you have a script(1) log of the whole session? (You'd probably
>     have this started as a last resort log then you started the
>     fsck'ing after the resize.)
No.  The session was not run through script(1).

>   * What exactly is "ext resizing utilities"? Did you save a copy of
>     it (incl. sources to find out about additionally applied patches?)
resize2fs.  I do not have a copy of the version used.

>   * These nonsensical names you refer to are the file's inode numbers,
>     in decimal. For mission-critical systems, it's wise to regularly
>     get inode listings with filenames. Did you compare those inode
>     numbers with your backups?
I know they are inode numbers, but they don't help you much in that situation.  
You think people keep inode listings with backups?  What a perfect world you 
live in.  I think it's not superflous information, but it is not a part of 
your average backup.  As a matter of fact I've not incountered a system that 
does this.  Sure you can do this on your own and it sort of makes sense.  
This just seems like a strange suggestion to me.

>   * Did you prepare an image-backup of your 1GB container beforehand?
>     Helps for easy recovery as well as error reproduction (esp.
>     because 1GB isn't all that hard to store on one CD when there's
>     plenty of free space, which can be made to compress very well.)
I did restore the data eventually.  I apologize if that was not clear.  I was 
frustrated that the tool did not perform as expected and it is something I 
should have followed up on with a bug report.  I should go back and do some 
experimenting with the current e2fsprogs and see if they behave better now.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
