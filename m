Return-Path: <riel@conectiva.com.br>
Date: Wed, 7 Feb 2001 18:29:24 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
In-Reply-To: <20010207134128.9EA0716B31@postfix.conectiva.com.br>
Message-ID: <Pine.LNX.4.21.0102071814030.1193-100000@duckman.distro.conectiva>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [lvm-commit] cvs commit: LVM/tools/lib pv_read_all_pv_of_vg.c
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
To: Heinz Mauelshagen <mauelshagen@sistina.com>
Cc: linux-lvm@sistina.com

On Wed, 7 Feb 2001, Heinz Mauelshagen wrote:

>   Modified files:        (Branch: LVM_0-9-patches)
>     tools/lib            pv_read_all_pv_of_vg.c 
>   Log:
>   fixed multiple access path avoidance problem
>   leading to removed but valid PV structure;
>   this could probably be the reason for lost PVs we faced in the past

I've gathered a bit more debugging output to see why even
this fix failed to make vgscan run.

It turns out the LVM utilities messed up some of the info
in the PV headers so badly that there's no way to reasonably
expect the LVM utilities to pick up their mess ...

I have attached the output from pvdata -a on the PVs to:
	http://bugzilla.sistina.com/show_bug.cgi?id=193

Would it be an idea to have some debugging tool around which
allows us to fix (simple) things like this ourselves ?

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
