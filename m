Return-Path: <cblunck2000@yahoo.com>
Message-ID: <20010814023405.71181.qmail@web10608.mail.yahoo.com>
Date: Mon, 13 Aug 2001 19:34:05 -0700 (PDT)
From: Christopher Blunck <cblunck2000@yahoo.com>
Subject: Re: [linux-lvm] Bad Disk
In-Reply-To: <16190000.997752650@duke.wrkhors.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

But it doesn't kill / contaminate the rest of the
volume group?  i didn't enable striping so I'm
assuming it'll leave the other data alone.

Would you have to issue any administrative commands
via the vg or lv commands to reduce the vg size?

chris

--- lembark@wrkhors.com wrote:
> 
> 
> -- Christopher Blunck <cblunck2000@yahoo.com> on
> 08/13/01 18:32:30 -0700
> 
> > I didn't find this in the FAQ anywhere -
> > 
> > Let's say I have a vg01 consisting of PV1 and PV2.
> 
> > Then let's say that PV2 dies (hardware problem). 
> What
> > happens to vg01 and furthermore, what happens to
> any
> > LVs created out of vg01?  
> 
> It depends.
> 
> If all of your lv's are on pv1 then you can often
> get them
> back w/ the old vgexport/vgimport trick.  If your
> lv's are
> spread across the two pv's then whatver lv's touched
> pv2 
> are history.
> 
> sl
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
