From: Robert Macaulay <robert_macaulay@dell.com>
Subject: Re: [linux-lvm] More information on my LV with bad read performance..
In-Reply-To: <Pine.LNX.4.33.0110260825240.26478-100000@ping.us.dell.com>
Message-ID: <Pine.LNX.4.33.0110260834210.26478-100000@ping.us.dell.com>
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
Date: Fri Oct 26 08:38:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 26 Oct 2001, Macaulay, Robert wrote:

> 
> True. I have done that. This is a "let's see if it goes really fast with a
> lot of disks" test. We have the disks divided up in stripe sets no bigger
> than 8 typically, all separated out by function. I was just playing around
> with a massive stripe, and ran into this oddity.

I made 2 12-way stripes with mdtools, then another layer of raid0 on top
of that, just to see if it would make any difference. The md got about the
same write performance, but the read was about the same as the writes
were, much higher than LVM.

Where is the patch you referred to to increase the read ahead? Part of our 
Oracle testing(with volumes separated by use) involves sequential table 
scans, which sound like they could benefit greatly from this patch. Thx

Robert
