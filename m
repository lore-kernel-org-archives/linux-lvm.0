Message-Id: <200306272113.h5RLDD7E020638@ruby.ridersoft.net>
From: Mark de Ruijter <lvm@ruby.ridersoft.net>
Subject: Re: [linux-lvm] vgscan and initrd
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1056748393"
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
Date: Mon Jun 30 09:51:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

--bound1056748393
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I tried to do that just now. 
Sadly, it didn't work. Still vgscan doesn't see any volume group at all. So once again, kernel panic strikes.

This is so frustrating :) I mean, the livecd things boot just fine, but it absolutly refuses to boot to that lvm.

Any more suggestions ?

"Mark H. Wood" <mwood@IUPUI.Edu> wrote ..
> Your follow-up makes it sound as though you have a different problem from
> mine, but I can answer your question about mounting tmpfs over /etc:
> 
>   mount -t tmpfs tmpfs /etc
> 
> You wind up with an empty /etc, but at that point there should be no
> problem.  vgscan just wants some place to store a metadata backup which
> you are going to throw away, and after pivot-root runs you'll have a
> different /etc anyway.  If the Gentoo startup scripts are like Red Hat's,
> they'll do a second LVM metadata backup into the "real" /etc later.
> 
> -- 
> Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
> MS Windows *is* user-friendly, but only for certain values of "user".
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--bound1056748393--
