Return-Path: <carenas@chasqui.lared.net.pe>
Date: Mon, 23 Apr 2001 18:22:56 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] LVM version of 2.4.2 kernel?
In-Reply-To: <Pine.LNX.4.33.0104231933220.17635-100000@duckman.distro.conectiva>
Message-ID: <Pine.LNX.4.33.0104231810270.13970-100000@chasqui.LaRed.net.pe>
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

> On Mon, 23 Apr 2001, Joe Thornber wrote:
> > On Mon, Apr 23, 2001 at 04:13:32PM +0200, David Vidal Rodriguez wrote:
> > > Hi!
> > > I want to know what version of LVM (beta_x etc.) is included within
> > > Kernel 2.4.2 and if I can use the fresh compiled beta7 tools with it.
> >
> > Beta2 is in the 2.4.2 kernel.  You are advised to upgrade both the
> > kernel and the userland tools to beta7.
>
> Ummm ?

:(, not again please, i am a noname lvm user and i really found this kind
of misunderstanding really frustating.

but there is a time when "clearing the air" is needed and i am pretty sure
that you all (developers) love much to code than to argue.

please, take my words as they come, from a linux user and developer
wannabe that loves the way opensource is getting into the world.

> Weren't you people saying that the Linus tree would be the
> main LVM repository from now on?

sure we all hope it is, but if you take a look to the currently released
linus kernel (2.4.3 and for sure the olders), it is obvious than a broken
lvm was in place there.

and for sure taking the beta7 userland tools with that module is going to
piss anyone.

> Would it be possible to get at least the important bugfixes
> merged in Linus' kernel ?

i'll bet they (sistina) are working on that as they explained before, BTW
i just found it on 2.4.4-pre6

+ *    05/04/2001 - lvm_map bugs: don't use b_blocknr/b_dev in lvm_map, it
+ *                destroys stacking devices. call b_end_io on failed maps.
+ *                (Jens Axboe)

and i am pretty sure that there are more to come (Alan, Heinz, your turn
with the ball)

best regards,

Carlo
