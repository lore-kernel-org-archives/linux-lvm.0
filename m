Message-Id: <3C2CBB80.7060002@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RAID support...
References: <3C2CBAFB.90103@cdimed.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Dec 28 12:37:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Michael,

	I am replying to you personally, and not forwarding it to the list, not 
sure if that is correct netiquetee or not.  Here is the a link to the 
FAQ entry that discuss precisely the issue.  Basically, the primary 
developer disagrees with you.

I happen to agree with him, but that is because I end up using software 
RAID and mirror everything and then build LVM devices out of them. 
Technically there is not speed advantage for doing it for anything 
except for RAID0 in the LVM.  It causes a lot of code duplication 
between the software RAID and the LVM.

	A strong case could be made for a more GUI/command line capable disk 
volume management that encompassed RAID/LVM/GFS/ext3/XFS/JFS/ReiserFS/nb 
and every other thing under the sun to make administration easier, but 
well, somebody will get to it, just not today.

http://tech.sistina.com/cgi-bin/lvm-faqprocessor.cgi?q=Why%20does%20LVM%20not%20support%20mirroring%3F


	Kirby


Michael O'Rourke wrote:

> To whom it may concern,
> 
> Not that this is a show stopper, but it seems that the LVM is missing 
> important capabilities such as RAID 1 & 5.  I see that you already 
> support RAID 0, but that's it.  In my opinion, it makes sense to merge 
> the RAID support (seperate product) with the LVM product.  Because the 
> two really complement each other. 
> Sincerely,
> Michael O'Rourke
> Unix System Admin
> Per-Se' Technologies
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


-- 
Real Programmers view electronic multimedia files with a hex editor.
