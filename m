Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643417@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Date: Mon, 16 Jul 2001 15:35:35 -0500
MIME-Version: 1.0
Subject: [linux-lvm] FW: LVM on Linux
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

From the XFS list. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Ric Tibbetts [mailto:ric@pipcws.ca.boeing.com]
> Sent: Monday, July 16, 2001 3:09 PM
> To: Linux XFS Mailing List; JFS Discussion List
> Subject: LVM on Linux
> 
> 
> For anyone considering using LVM on Linux. You might want to take a 
> second to look at the following "short" article. It casts a 
> questionalble light on the current state of the LVM code.
> 
> ================================================
> 
> 0 Jun - 5 Jul (8 posts) Archive Link: [RFC][PATCH] first cut 
> 64 bit block
> support
>                   Summary by Zack Brown
> 
> Ben LaHaise posted a patch and announced, "Below is the first 
> cut at making
> the block size limit configurable to 64 bits on x86, as well 
> as always 64
> bits on 64 bit machines. The audit isn't complete yet, but a 
> good chunk of
> it is done." [..] "The following should be 64 bit clean now: 
> nbd, loop,
> raid0, raid1, raid5." He gave links to two homepages at
> http://people.redhat.com/bcrl/lb/ and
> http://www.kvack.org/~blah/lb/. He added, "Ugly bits: I had 
> to add libgcc.a
> to satisfy the need for 64 bit division. Yeah, it sucks, but 
> RAID needs some
> more massaging before I can remove the 64 bit division 
> completely. This will
> be fixed." Chris Wedgwood proposed some changes to libgcc.a 
> to be less ugly,
> and Ben replied, "I'm getting rid of the need for libgcc 
> entirely. That's
> what "This will be fixed" means. If you want to expedite the 
> process, send a
> patch. Until then, this is Good Enough for testing purposes."
> 
> Elsewhere, Ragnar Kjarstad was very happy about Ben's work, 
> asking if LVM
> was also 64-bit clean. Ben replied cryptically, "Errr, I'll 
> refrain from
> talking about LVM." Ragnar wanted some clarification, and Ben 
> explained:
> 
> Fixing LVM is not on the radar of my priorities. The code is 
> sorely in need
> of a
> rewrite and violates several of the basic planning tenents 
> that any good
> code in the block layer should follow. Namely, it should have 
> 1) planned on
> supporting 64 bit offsets, 2) never used multiplication, 
> division or modulus
> on block numbers, and 3) don't allocate memory structures 
> that are indexed
> by block numbers. LVM failed on all three of these -- and 
> this si just what
> I noticed in a quick 5 minute glance through the code. Sorry, 
> but LVM is
> obsolete by design. It will continue to work on 32 bit block 
> devices, but if
> you try to use it beyond that, it will fail. That said, we'll 
> have to make
> sure these failures are graceful and occur prior to the user 
> having a chance
> at loosing any data.
> 
> Now, thankfully there are alternatives like ELVM, which are working on
> getting the
> details right from the lessons learned. Given that, I think 
> we'll be in good
> shape
> during the 2.5 cycle.
> 
> End Of Thread (tm).
> 
> 
