Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB51A73.8D931205@wrkhors.com>
Date: Sun, 18 Mar 2001 14:28:35 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Kernel 2.4.x with LVM beta 6 on Sun E450?
References: <20010318125600.A24084@mercury.mercury.multiweb.nl>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> With kernel 2.4.2 "make menuconfig" doesn't work.  No problem,
> now I'm using v2.4.3-pre3 and this is running fine.

if you have a decent display (or network access) see what 
"make xconfig" does for you.  it may be a curses/ncurses
version issue (was for me).  by the time you're done cursing
[so to speak] you'd be better off in X11.  if you just want
to get the thing working then:

	take your pre3 .config and move it to /usr/src (i.e., "..").
	blow off /usr/src/linux-2.4.2-pre3.
	re-extract 2.4.2 into, say, linux-2.4.2.
	cp ../config ./.config;
	make oldconfig;

this will re-use the old (assumedly working) .config from 2.4.3-pre3
w/ questions about anything new it doesn't have answers for.  you
can use this method to migrate up versions w/o having to wander 
through the entire process each time.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
