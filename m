Return-Path: <paul@clubi.ie>
Date: Fri, 12 Jan 2001 00:49:33 +0000 (GMT)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] Oops in 2.4.0 (@ LVM)
In-Reply-To: <20010111164504.C15726@srv.t-online.de>
Message-ID: <Pine.LNX.4.31.0101112141150.27729-100000@fogarty.jakma.org>
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

On Thu, 11 Jan 2001, Heinz J. Mauelshagen wrote:

> It is updated continously.
>

aye, i know it is.. but not in Linus' tree, and that's the problem.

Linus was given 0.9 by Andrea a good while ago. It has problems. CVS
has had many updates.. but these are not fed to Linus. Not good.
Either keep Linus LVM relatively closely in-sync by feeding to him
frequently, or else feed him /stable/ updates less frequently.

In the former case, users can rely on stock LVM being up to date. In
the latter case users can choose to stick with stock or use CVS. The
current half-way house case means you never really know where you
stand.

I'm sorry for complaining, and please read all my 'complain' emails
with an implicit #include "thanks-for-lvm.txt", but....

The release practices of the LVM developers has, to date, /sucked/
(witness pre 0.8.1). I guess you guys (understandably) prefer
spending time on the code over spending time on organising
releases/updates, but the current situation makes life difficult for
users.

Perhaps a solution could be that you (Heinz et al) could delegate to
someone with the technical competance to understand the fixes who
could undertake 'watching' the developers and feeding the fixes on to
Linus? Eg, Andreas did a really good job of maintaining 0.8 fixes (to
tools) until 0.8.1 came out. *cough*

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
A Fortran compiler is the hobgoblin of little minis.
