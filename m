Message-Id: <25E4CA13D679FF48BC30769420220971467A5B@nd1-clusa.local.bunnings.com.au>
From: Colin Coe <CCoe@bunnings.com.au>
Subject: RE: [linux-lvm] RAID support...
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Dec 30 08:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all

Kirby, can you describe how you use software raid and lvm?  I have been
trying to install RH7.1 directly onto software raid and lvm without success.

Any help much appreciated.

CC

> -----Original Message-----
> From:	Kirby C. Bohling [SMTP:kbohling@birddog.com]
> Sent:	Saturday, December 29, 2001 2:36 AM
> To:	linux-lvm@sistina.com
> Subject:	Re: [linux-lvm] RAID support...
> 
> Michael,
> 
> 	I am replying to you personally, and not forwarding it to the list,
> not 
> sure if that is correct netiquetee or not.  Here is the a link to the 
> FAQ entry that discuss precisely the issue.  Basically, the primary 
> developer disagrees with you.
> 
> I happen to agree with him, but that is because I end up using software 
> RAID and mirror everything and then build LVM devices out of them. 
> Technically there is not speed advantage for doing it for anything 
> except for RAID0 in the LVM.  It causes a lot of code duplication 
> between the software RAID and the LVM.
> 
> 	A strong case could be made for a more GUI/command line capable disk
> 
> volume management that encompassed RAID/LVM/GFS/ext3/XFS/JFS/ReiserFS/nb 
> and every other thing under the sun to make administration easier, but 
> well, somebody will get to it, just not today.
> 
> http://tech.sistina.com/cgi-bin/lvm-faqprocessor.cgi?q=Why%20does%20LVM%20
> not%20support%20mirroring%3F
> 
> 
> 	Kirby
> 
> 
> Michael O'Rourke wrote:
> 
> > To whom it may concern,
> > 
> > Not that this is a show stopper, but it seems that the LVM is missing 
> > important capabilities such as RAID 1 & 5.  I see that you already 
> > support RAID 0, but that's it.  In my opinion, it makes sense to merge 
> > the RAID support (seperate product) with the LVM product.  Because the 
> > two really complement each other. 
> > Sincerely,
> > Michael O'Rourke
> > Unix System Admin
> > Per-Se' Technologies
> > 
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
> -- 
> Real Programmers view electronic multimedia files with a hex editor.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

**************************************************************************
Bunnings Legal Disclaimer: 

1) 	This document is confidential and may contain legally privileged 
	information. If you are not the intended recipient you must not 
	read, copy, distribute or act in reliance on it.
	If you have received this document in error, please telephone
	us immediately on (08) 9365-1555. 

2)	All e-mails sent to and sent from Bunnings Building Supplies are
	scanned for content. Any material deemed to contain inappropriate
	subject matter will be reported to the e-mail administrator of
	all parties concerned.

**************************************************************************
