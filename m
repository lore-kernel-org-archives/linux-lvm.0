Return-Path: <jones@hpc.utexas.edu>
Message-Id: <4.2.0.58.20010423180159.01684270@127.0.0.1>
Date: Mon, 23 Apr 2001 18:24:59 -0500
From: "William L. Jones" <jones@hpc.utexas.edu>
Subject: Re: [linux-lvm] LVM version of 2.4.2 kernel?
In-Reply-To: <Pine.LNX.4.33.0104231933220.17635-100000@duckman.distro.co
 nectiva>
References: <20010423171726.A1837@66bassett.freeserve.co.uk>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.comlinux-lvm@sistina.com

SGI has beta6 in their linux-2.4-xfs-beta release. You only need the
LVM beta6 command set.   It is based on linux-2.4.2 and works out of the
box just add the LVM beat6 commands.   You don't have to use their
xfs file if you don't want.

I think this will be the best place to get a linux 2.4 kernel with fairly 
current LVM
for a while.


Bill Jones


At 07:34 PM 4/23/01 -0300, Rik van Riel wrote:
>On Mon, 23 Apr 2001, Joe Thornber wrote:
> > On Mon, Apr 23, 2001 at 04:13:32PM +0200, David Vidal Rodriguez wrote:
> > > Hi!
> > > I want to know what version of LVM (beta_x etc.) is included within
> > > Kernel 2.4.2 and if I can use the fresh compiled beta7 tools with it.
> >
> > Beta2 is in the 2.4.2 kernel.  You are advised to upgrade both the
> > kernel and the userland tools to beta7.
>
>Ummm ?
>
>Weren't you people saying that the Linus tree would be the
>main LVM repository from now on?
>
>Would it be possible to get at least the important bugfixes
>merged in Linus' kernel ?
>
>thanks,
>
>Rik
>--
>Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml
>
>Virtual memory is like a game you can't win;
>However, without VM there's truly nothing to lose...
>
>                 http://www.surriel.com/
>http://www.conectiva.com/       http://distro.conectiva.com/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
