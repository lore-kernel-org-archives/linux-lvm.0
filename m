Return-Path: <dave@galilean.d2g.com>
Date: Sun, 18 Mar 2001 22:25:01 +0100
From: Dave Wapstra <dave@xs4all.nl>
Subject: Re: [linux-lvm] Kernel 2.4.x with LVM beta 6 on Sun E450?
Message-ID: <20010318222501.A30232@mercury.mercury.multiweb.nl>
References: <20010318125600.A24084@mercury.mercury.multiweb.nl> <3AB51A73.8D931205@wrkhors.com>
Mime-Version: 1.0
In-Reply-To: <3AB51A73.8D931205@wrkhors.com>; from lembark@wrkhors.com on Sun, Mar 18, 2001 at 02:28:35PM -0600
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

On 18 March, 2001 at 14:28:35 -0600, Steven Lembark <lembark@wrkhors.com> wrote:
> 
> > With kernel 2.4.2 "make menuconfig" doesn't work.  No problem,
> > now I'm using v2.4.3-pre3 and this is running fine.
> 
> if you have a decent display (or network access) see what 
> "make xconfig" does for you.  it may be a curses/ncurses
> version issue (was for me).  by the time you're done cursing
> [so to speak] you'd be better off in X11.  if you just want
> to get the thing working then:
> 

Steve,

Thanks, but this is a non-X box. It is probably worth trying to use the
.config of -pre3 with 2.4.2 and use the beta6 plus ioctl patches to try
and get this thing to compile correctly.

I'll just give that a try...

-Dave

BTW: The problem with 2.4.2 is an awk parser error.

Using defaults found in arch/sparc64/defconfig
Preparing scripts: functions, parsingAwk died with error code 132. Giving up.
..........scripts/Menuconfig: unexpected EOF while looking for `''
scripts/Menuconfig: ./MCmenu17: line 121: syntax error
.......scripts/Menuconfig: unexpected EOF while looking for `''
scripts/Menuconfig: ./MCmenu6: line 362: syntax error

-- 
Dave Wapstra
dave@xs4all.nl
