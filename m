Return-Path: <riel@conectiva.com.br>
Date: Tue, 6 Feb 2001 16:58:22 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <20010206183505.7773.qmail@fraggle.cs.uit.no>
Message-ID: <Pine.LNX.4.21.0102061656090.1535-100000@duckman.distro.conectiva>
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

On Tue, 6 Feb 2001 gobo@gimle.nu wrote:

> Running vgscan I got the following message:
> 
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "widow"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
> data of volume group "widow" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating 
> "/etc/lvmtab" and "/etc/lvmtab.d"

I am running into the same bug, with the very latest LVM
utilities and kernel 2.4.1.

I have posted a bugreport in the LVM bugzilla, but I haven't
heard anything from the LVM developers. Lets just hope they're
not ignoring us...

> If anyone have an idea on how I can get my filesystem back I'd
> very much appreciate it.

LVM 0.8final with the lvm-iop6 tools (as shipped by Conectiva)
seem to be able to use this volume group just fine. The utilities
still complain and I cannot change any configuration things, but
at least I can access my data...

For now, there's nothing we can do until the LVM people acknowledge
and fix our bug. ;(

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
