Return-Path: <riel@conectiva.com.br>
Date: Wed, 7 Feb 2001 20:47:55 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Re: [lvm-commit] cvs commit: LVM/tools/lib
 pv_read_all_pv_of_vg.c
In-Reply-To: <20010207153515.O22166@sistina.com>
Message-ID: <Pine.LNX.4.21.0102072046440.1193-100000@duckman.distro.conectiva>
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

On Wed, 7 Feb 2001, AJ Lewis wrote:
> On Wed, Feb 07, 2001 at 06:29:24PM -0200, Rik van Riel wrote:

> > Would it be an idea to have some debugging tool around which
> > allows us to fix (simple) things like this ourselves ?
> 
> It looks like the following *should* fix things for you (this from Patrick):
> 
>  o Grab the latest CVS code for LVM.
>  o Create a very small LV (or extend an existing one) to force a meta-data
>    update.
>  o The UUIDs should be cleaned up
> 
> If this is not possible with your setup, or does not work for
> you, let me know and we'll see what else we can do to fix the
> problem.

# lvcreate -h
lvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

(yes, every utility except for vgscan and pvdata
seem to spit out this complaint ...)

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
