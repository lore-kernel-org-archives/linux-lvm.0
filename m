Return-Path: <riel@conectiva.com.br>
Date: Wed, 7 Feb 2001 21:00:28 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Re: [lvm-commit] cvs commit: LVM/tools/lib
 pv_read_all_pv_of_vg.c
In-Reply-To: <Pine.LNX.4.21.0102072046440.1193-100000@duckman.distro.conectiva>
Message-ID: <Pine.LNX.4.21.0102072058440.1249-100000@duckman.distro.conectiva>
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

On Wed, 7 Feb 2001, Rik van Riel wrote:
> On Wed, 7 Feb 2001, AJ Lewis wrote:

> > It looks like the following *should* fix things for you (this from Patrick):
> 
> # lvcreate -h
> lvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

Oooops, this was in a running system with lvm 0.8,
in the not-runnable system with 0.9.x (latest from
CVS) I get the following:

# lvcreate -h
lvcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

(and, of course, vgscan doesn't work because the metadata
is inconsistent -- catch22)

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
