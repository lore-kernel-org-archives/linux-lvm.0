Return-Path: <jgarzik@mandrakesoft.com>
Message-ID: <3ADF45FC.EE7B2003@mandrakesoft.com>
Date: Thu, 19 Apr 2001 16:09:32 -0400
From: Jeff Garzik <jgarzik@mandrakesoft.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
References: <20010419142400.E10345@sistina.com> <200104191945.f3JJjKRn015661@webber.adilger.int> <20010419145337.K10345@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: AJ Lewis <lewis@sistina.com>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org

AJ Lewis wrote:
> Ok, the issue here is that we're trying to get a release out and so anything
> that majorly changes the code is getting shunted aside for the moment.  It
> would be stupid to just add everything that comes in on the ML without
> review.  Linus does the exact same thing.  I've said this before to you
> Andreas, but apparently you feel that you should have final say on whether
> your patches go in or not.

> As far as getting patches into the stock kernel, we've been sending patches
> to Linus for over a month now, and none of them have made it in.  Maybe
> someone has some pointers on how we get our code past his filters.

Read Documentation/SubmittingPatches, and also listen to kernel hackers
who know the block layer and want to fix lvm.

And I wonder, if kernel hackers are saying lvm is broken... why do you
want to freeze it and ship it in that state?

-- 
Jeff Garzik       | "The universe is like a safe to which there is a
Building 1024     |  combination -- but the combination is locked up
MandrakeSoft      |  in the safe."    -- Peter DeVries
