Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLFlar08146
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:47:36 -0500
Received: from ny-bas07.csfb.com (ny-bas07.csfb.com [198.240.130.80])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLFlLJo027860
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:47:21 -0500
Received: from snyc11p30741.csfb.cs-group.com (snyc11p30741.csfb.mail
	[169.37.102.72])
	by ny-bas07.csfb.com (Postfix) with ESMTP id 00A7A2789
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:47:15 -0500 (EST)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF01B2@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] lvm/fs issue
Date: Tue, 21 Dec 2004 10:47:03 -0500
MIME-Version: 1.0
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> On Tue, Dec 21, 2004 at 03:19:49PM -0000, Rosenstrauch, David wrote:
> > Hi.  Having an odd problem with lvm and/or my file system.  
> Can anyone offer
> > any ideas what might be wrong?
> > 
> 
> The data is fine - it's LVM trying to read the extended 
> partition (which
> contains no data).
> 
> Simply exclude /dev/sda3 using a filter in /etc/lvm/lvm.conf.
> 
> -- 
> 
> patrick


OK - that's easy enough to do.

I was just about to write  "Not sure why I just started seeing this only
recently, though".  But then I realized that my distro just upgraded to LVM
2.00.31 last Monday (12/13).  As I shutdown every Friday and reboot every
Monday, that explains why yesterday was the first time I would have seen this.

Thanks for the help!

DR

P.S.  LVM has been working great for me.  Kudos and thanks to everyone who's
worked hard to provide such a great tool to the community!

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================
