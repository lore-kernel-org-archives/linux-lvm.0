Return-Path: <axboe@brick.kernel.dk>
Date: Thu, 19 Apr 2001 21:56:02 +0200
From: Jens Axboe <axboe@suse.de>
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
Message-ID: <20010419215602.F30135@suse.de>
References: <20010419142400.E10345@sistina.com> <200104191945.f3JJjKRn015661@webber.adilger.int> <20010419145337.K10345@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010419145337.K10345@sistina.com>; from lewis@sistina.com on Thu, Apr 19, 2001 at 02:53:37PM -0500
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
To: AJ Lewis <lewis@sistina.com>
Cc: linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jes Sorensen <jes@linuxcare.com>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, Arjan van de Ven <arjanv@redhat.com>, Martin Kasper Petersen <mkp@linuxcare.com>, riel@conectiva.com.br

On Thu, Apr 19 2001, AJ Lewis wrote:
> As far as getting patches into the stock kernel, we've been sending patches
> to Linus for over a month now, and none of them have made it in.  Maybe
> someone has some pointers on how we get our code past his filters.

The diff between 2.4.4-pre LVM and your last beta is HUGE. That's a very
good clue why Linus hasn't taken it! Find a bug, fix it, submit diff.
Not find lots of bugs for a month, submit huge diff.

-- 
Jens Axboe
