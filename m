From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] vgscan and initrd
In-Reply-To: <200306270725.h5R7POMs018131@ruby.ridersoft.net>
Message-ID: <Pine.LNX.4.55.0306270858120.6510@mhw.ULib.IUPUI.Edu>
References: <200306270725.h5R7POMs018131@ruby.ridersoft.net>
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
Date: Fri Jun 27 09:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Your follow-up makes it sound as though you have a different problem from
mine, but I can answer your question about mounting tmpfs over /etc:

  mount -t tmpfs tmpfs /etc

You wind up with an empty /etc, but at that point there should be no
problem.  vgscan just wants some place to store a metadata backup which
you are going to throw away, and after pivot-root runs you'll have a
different /etc anyway.  If the Gentoo startup scripts are like Red Hat's,
they'll do a second LVM metadata backup into the "real" /etc later.

-- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
