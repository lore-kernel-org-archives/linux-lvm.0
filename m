Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
Date: Thu, 5 Jul 2001 07:17:05 -0400
References: <20010704083759.A294@btconnect.com> <Pine.LNX.4.33.0107041635050.27160-100000@chasqui.LaRed.net.pe> <20010705103908.A400@btconnect.com>
In-Reply-To: <20010705103908.A400@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010705111706.7F0A28A8C@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, Joe Thornber <thornber@btconnect.com>

On July 5, 2001 05:39 am, Joe Thornber wrote:
> On Wed, Jul 04, 2001 at 04:50:53PM -0500, Carlo Marcelo Arenas Belon wrote:
> > <SNIP>
> > (BTW anyone knows what happened to the 1.0 release that was supposed to
> > be yesterday?)
>
> The release is delayed :( I think we're going to need another beta
> release before the great 1.0.  We want to be careful that we can still
> support existing systems with the bad alignments, as well as newly
> created LV's that have correct alignment.  This is going to involve an
> upgrade tool that will be run on existing VG's before the new software
> (beta8) can be used.

Think creating this tool is a very good idea.  Suggest that you use beta8
in a very dirrected way - possibly publicly stating that the beta8 release
is to test X, Y and Z and will last N weeks/days (if no serious problems are
found).  Alternatly you could use rc1 instead of beta8 and work from there.

Thanks
Ed Tomlinson
