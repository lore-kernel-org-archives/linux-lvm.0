Return-Path: <h@ns.engren.org>
Date: Mon, 12 Feb 2001 07:09:49 +0100 (CET)
From: Hans Engren <h@ns.engren.org>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM
In-Reply-To: <200102102318.f1ANIMw08543@webber.adilger.net>
Message-ID: <Pine.LNX.4.20.0102120702400.5354-100000@menswerk.cyclone.se>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 10 Feb 2001, Andreas Dilger wrote:

> > I've attached a gzip'ed output from "vgscan -d -v" to this mail. Checking
> > out the end of the output, it doesn't seem that good - atleast to me..
> You must not have been running my version of vgscan?  One of the obvious
> problems is that the "lvm_dir_cache" is not a cache at all, and re-reads
> the devices each time it is called, making your output 25667 lines -
> nearly useless from a debugging standpoint (not to mention it is doing a
> LOT of duplicate work).  That will be my first patch...

Very true. I did not. New attached output has, although your code was
beta3 instead of beta4. I guess that won't make a difference in my
case. See the attached file (which actually has 44889 lines .. ?) with
output from 'your' vgscan.

Using beta3, vgscan doesn't segfault. It does with beta4. :/

> > Suggestions ?
> Looking at the end of your output shows the following:
> <22> pv_read_all_pv()  -- avoiding multiple entries in case of MD; np: 25
> so it found 25 PVs in your system.  This is correct I believe, from your
> previous email.  24 of these PVs are in VG mw1, and 1 is unused?

Correct.

> At this point your vgscan output ends?  It is an error, but there
> _should_ be some more output saying it was an error, unless that is
> where you have your segfault.

That's the point where a segfault occured.

 -- Hans.

 /"\                                   o
 \ /     ASCII RIBBON CAMPAIGN        /|\
  X        AGAINST HTML MAIL           >>
 / \                                   o
