Message-ID: <20011126172715.1498.qmail@web12301.mail.yahoo.com>
From: Lars Kellogg-Stedman <thelars@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Here we go again: vgscan doesn't see my volume groups.
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
Date: Mon Nov 26 11:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> This is a different problem than what I encountered earlier, which
> appeared to be a problem with software RAID devices that went away
> when
> I upgraded to the latest code from CVS.  I'm now using whatever was
> in
> CVS as of Monday Nov. 19.

I've upgraded the userspace tools to today's CVS code.  There's not
much I can do with the kernel until *after* I'm able to access the
volume group again.

There doesn't appear to be any chance in behavior with the updated
tools.

Is there any way for me to determine *why* the lvm tools won't assemble
this volume group?  Vgscan isn't giving me any errors, and the debug
output, while copious, doesn't really help me much.

Thanks,

-- Lars


=====
lars@larsshack.org

__________________________________________________
Do You Yahoo!?
Yahoo! GeoCities - quick and easy web site hosting, just $8.95/month.
http://geocities.yahoo.com/ps/info1
