Return-Path: <john@oswf.de>
From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15201.4293.260605.275782@rigel.oswf.de>
Date: Fri, 27 Jul 2001 08:57:09 +0200 (MEST)
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
In-Reply-To: <20010726151725.A28574@sistina.com>
References: <20010726131928.D1779@linux.com>
	<20010726134732.A27706@sistina.com>
	<20010726160701.H1779@linux.com>
	<20010726151725.A28574@sistina.com>
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
To: linux-lvm@sistina.com

AJ Lewis writes:
> [...]
> > 
> > Still, the bugs that surface in md and reiserfs make me a little
> > worried.  md has been around for a while now, hasn't it?  I get the
> > feeling it's a bit fragile.  Well, maybe it's just me.
> 
> I personally don't know a whole lot about MD, but there seem to be a lot
> of people using it.  Maybe people on the list using MD and LVM together can
> comment.
> [...]

I cannot comment on reiserfs, because I only use it on my equipment for
test reasons, but I have LVM on top of a RAID-5 and a RAID-0 up and running
for more than 140 days on one of our machines. No problems so far, although
it is still 0.9.1-beta5 and a "rather old" kernel ;-). Maybe it is time to
upgrade this one, too.

I use RAID since kernel 2.2.14 came out, one machine here is still running
2.2.18 with a RAID-5 (no LVM) and is up ever since.

Regards,

-- 
   Werner John                         Tel: +49 (0)69 829 757-0
   Offenbacher Stanzwerkzeugfabrik     Fax: +49 (0)69 829 757-25
   Ludwigstr. 30                       E-Mail: john at oswf dot de
   63067 Offenbach, Germany
