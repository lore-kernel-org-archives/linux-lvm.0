Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAMVn120352
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:31:49 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.21])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBAMVl5f007792
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:31:48 -0500
Received: from pc8.trash.bin (pc8.trash.bin [192.168.4.8])
	by pc1.trash.bin (Postfix) with ESMTP id F25AF42D9
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 23:31:40 +0100 (CET)
Date: Sat, 10 Dec 2005 23:31:40 +0100
From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051210223139.GI3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
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

On Sat, 10 Dec 2005 at 15:10 (-0700), Michael Loftis wrote:
> --On December 10, 2005 9:22:32 PM +0100 Marc-Jano Knopp <pub_ml_lvm@marc-jano.de> wrote:
> 
> >Thanks for the detailled explanation!
> 
> I try not to say something without actual experience and technical details 
> to back it up. :)

If only everyone would do that ... (that said, I should better shut up
from now on :-}


> > So for now, I'll probably stay with ext3, with which I had
> > no problems so far.
[...]
> XFS has terrible unpredictable performance in production.  Also it has very 
> bad behavior when recovering from crashes, often times it's tools totally 
> fail to clean the filesystem.

Okay, so I'm even more biased to using ext3. :-}


[...]
> I've had far better reliability and performance out of ReiserFS in 
> production (late 2.4 series... 2.4.20+, currently 2.4.25, with some patches 
> on most of our larger systems) than XFS.

Hmm ... i guess for 2.6.x, experiences can totally differ.


[...]
> XFS may be a proven filesystem, but it has not yet been proven in Linux' 
> implementation.  That said, all of the filesystems have their own quirks 
> and shortcomings.  We had a corruption problem with our CX200 that caused 
> our ReiserFS to lose most of it's tails.  Really it was the CX200 (EMC 
> Clariion) fault, but it felt (And still does) at the time that ReiserFS 
> could've or atleast should've been able to save more of the tail data that 
> it lost.  It didn't lose any files, just a the tails.

I thought the tails would be used to save the file blocks with less than
$BLOCKSIZE? So, if ReiserFS lost the tails, it would be a very lucky
coincidence, if none of the files were damaged. Or am I misguided again?
:-}


Best regards

  Marc-Jano
