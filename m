Return-Path: <declerck@sistina.com>
Subject: Re: [linux-lvm] Oops in 2.4.0 (@ LVM) 
In-Reply-To: Message from Paul Jakma <paul@clubi.ie> 
   of "Fri, 12 Jan 2001 00:49:33 GMT." <Pine.LNX.4.31.0101112141150.27729-100000@fogarty.jakma.org> 
Mime-Version: 1.0
Date: Thu, 11 Jan 2001 18:48:24 -0800
From: "Michael J. Declerck" <declerck@sistina.com>
Message-Id: <20010112024824.7BED7E0B7@wraith>
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

paul@clubi.ie said:
> aye, i know it is.. but not in Linus' tree, and that's the problem.
> Linus was given 0.9 by Andrea a good while ago. It has problems. CVS
> has had many updates.. but these are not fed to Linus. Not good.
> Either keep Linus LVM relatively closely in-sync by feeding to him
> frequently, or else feed him /stable/ updates less frequently.

I believe that is what we are doing.  We are building stable, tested patches
that can be submitted to Linus for inclusion in his tree.  The submission by
a party outside of the LVM commit team disrupted the stability of LVM.  The
LVM team is working to build a new patch that can be applied against 2.4.0
that will not need to be updated on a daily basis.

> In the former case, users can rely on stock LVM being up to date. In
> the latter case users can choose to stick with stock or use CVS. The
> current half-way house case means you never really know where you
> stand.

Once again, the LVM team did not put the community in this situation, but they
are working to rectify it.

> I'm sorry for complaining, and please read all my 'complain' emails
> with an implicit #include "thanks-for-lvm.txt", but....

Well reasoned criticism is not a compliant.  It is a rationale way of helping
to keep things on track.  The LVM developers appreciate this type of input.

> The release practices of the LVM developers has, to date, /sucked/
> (witness pre 0.8.1). I guess you guys (understandably) prefer spending
> time on the code over spending time on organising releases/updates,
> but the current situation makes life difficult for users.

This issue is being addressed.  Hopefully, after the submission of what I will
label for lack of a better term, the 0.91 patch, things will stabilize.  At
that point a more sane update sequence should prevail.

> Perhaps a solution could be that you (Heinz et al) could delegate to
> someone with the technical competance to understand the fixes who
> could undertake 'watching' the developers and feeding the fixes on to
> Linus? Eg, Andreas did a really good job of maintaining 0.8 fixes (to
> tools) until 0.8.1 came out. *cough* 

I believe the current LVM team is attempting to do that.  Help from within the
LVM is greatly appreciated and encouraged.  Having said that, there sometimes
needs to be a final authority (ala Linus for the kernel) on changes and Heinz
is it currently.

I really believe that both the LVM team and the LVM community as a whole are
working diligently to provide the best tool possible.  The process of 
accomplishing this hit a snag recently and actions have been taken to rectify
it.  I expect that within the next couple of days all of this will be smoothed
out and we can all get back to advancing Linux and its use throughout the
computing community.


---
Michael Declerck, declerck@sistina.com   +1.510.823.7991
