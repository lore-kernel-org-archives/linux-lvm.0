Return-Path: <fl@fl.priv.at>
Date: Fri, 15 Jun 2001 22:54:17 +0200 (CEST)
From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] $(DESTDIR) inclusion into Makefile.in files
In-Reply-To: <20010615091805.A8645@sistina.com>
Message-ID: <Pine.LNX.4.33.0106152246350.23466-100000@www.scotty.co.at>
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

On Fri, 15 Jun 2001, AJ Lewis wrote:

> On Fri, Jun 15, 2001 at 12:12:09PM +0200, Gergely Tamas wrote:
> > It would be probably a good idea to insert a $(DESTDIR) in front of all
> > installation targets. This would make packagers life easyer.
>
> Thanks Gergely,
> I've been intending to do that but hadn't yet.  Instead of putting it in the
> Makefiles themselves though, I put it where the install directories are
> defined, make.tmpl.in.  The head of the current CVS has these changes.

When modifying makefiles for packaging I'd do it the same way as
Gregely because what if the "make install" creates a symlink to let's
say /usr/bin/some-file which now would link it to
$(DESTDIR)/usr/bin/some-file and so we'd break the whole thing. Also
some other stuff like config files end up wrongly referenced in the
compiled files. So I'd say, never do it where the install directories
get defined, use $(DESTDIR) only in the install section of the
makefile.

Just my 2 euro cents.

-- 
MfG / Regards
Friedrich Lobenstock
