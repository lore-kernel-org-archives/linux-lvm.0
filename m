Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 11:40:46 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm-problems?
Message-ID: <20010528114046.K26710@sistina.com>
References: <20010527234117.A759@mind.bartosch.net>
Mime-Version: 1.0
In-Reply-To: <20010527234117.A759@mind.bartosch.net>; from peter@bartosch.net on Sun, May 27, 2001 at 11:41:17PM +0200
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
To: linux-lvm@sistina.com

Did you report that to the reiserfs list too?

On Sun, May 27, 2001 at 11:41:17PM +0200, Peter Bartosch wrote:
> hello,
> 
> i recently made my three LV new (caused by an accident as i tried to
> extend an existing (0.8i) LV)
> 
> so i created a new kernel (2.4.2) with lvm 0.9.1_beta7
> 
> the first problems came when i tried to create more than one VG - the
> second VG couldn't be activated (always inactive after reboot and unable
> to activate)
> 
> so i'm using only one VG
> 
> the first two LV's of this VG could i create without problems, but the
> third makes problems:
> 
> i created the reiserfs on it, but when i tried to mount it, the mount
> failed
> an reiserfsck --rebuild-sb and after that reiserfsck --rebuild-tree
> clears it and i could mount my LV -- UNTIL the next reboot
> 
> i had to reboot because something oopsed:
> 
> ----
> 
> is_leaf: item location seems wrong (second one): *NEW* [9 10 0x0 SD],
> item_len 44, item_location 2308, free_space(entry_count) 65535
> vs-5150: search_by_key: invalid format found in block 8271. Fsck?
> kernel BUG at namei.c:343!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c018ff08>]
> EFLAGS: 00010286
> eax: 0000001b   ebx: c6655e58   ecx: 00000001   edx: 00000001
> esi: c02d4fb4   edi: c6655edc   ebp: c6655e70   esp: c6655e40
> ds: 0018   es: 0018   ss: 0018
> Process cp (pid: 1799, stackpage=c6655000)
> Stack: c02d4c7e c02d4d7e 00000157 00000000 c02d4fb4 c6655e9c 00000002 0000000e 
> 	4a0507ff 000001f4 00000000 00000003 c3e55a20 c0190030 c7742c20 c7dd3b20 
>         0000001b c6655e9c c6655edc fffffff4 c6654000 c7742c20
> 	c3e55a20 00000001 
> Call Trace: [<c0190030>] [<c01468e9>] [<c013de9a>]
>         [<c013e6e9>] [<c013db5a>] [<c013ee4c>] [<c013b8c6>] 
>         [<c0133047>] [<c0108f5b>] 
> Code: 0f 0b 83 c4 0c 8d 76 00 8b 4d 10 51 8b 45 0c 50 57 8d 55 e8 
> 
> -----
> 
> this oops let the process which works on the third LV freeze - so i
> couldn't kill it
> 
> the first and the second LV seem to work well
> 
> when i reboot the third LV won't be mountet automagically and the
> filesystem seems to be corrupt
> 
> 
> any help will be appreciated
> 
> 
> :wq - until next mail B-), l8r
> 
> Peter
> -- 
>    :~~~~~~~~~~~~~~~~~~  peter@bartosch.net  ~~~~~~~~~~~~~~~~~~:
>    :          student of technical computer science           :
>    :     university of applied sciences krefeld (germany)     :
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    FD314F21   C7 AE 2F 28 C1 33 71 77  0D 77 CD 6E 58 E9 06 6B
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
