From: Donald Thompson <dlt@lunanet.biz>
Message-ID: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz>
MIME-Version: 1.0
Subject: [linux-lvm] LV Fragmentation determination
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
Date: Wed Nov  6 02:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

First off, can LV's become fragmented across a PV/VG? If yes then...

I'm looking for an easy way to determine how fragmented an LV might been
inside the VG. Is there any command I can run that'll give me nice
estimate on this?

Assuming theres no such command, can I determine this by looking at the
PE's displayed from an 'lvdisplay -v' command? I'm guessing it'd be pretty
easy to write a script that analyzes the PE numbers and looks for skips in
the sequence to give myself an idea of the amount of fragmention for the
LV. Or am I competely wrong thinking you can use PE's to make such a
determination?

I do shrinks and enlarges for different LV's sometimes on an almost daily
basis, and my VG's are getting to be very old. So I'm curious to see how
fragmentated my LVs have become.

TIA for any clues.

-Don
