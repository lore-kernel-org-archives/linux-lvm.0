Return-Path: <jdomingo@internautas.org>
Date: Sat, 10 Mar 2001 14:27:47 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM X front end
Message-ID: <20010310142747.A1365@dardhal.mired.net>
References: <Pine.LNX.4.20.0103091926210.27453-100000@rdb.linux-help.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.20.0103091926210.27453-100000@rdb.linux-help.org>; from ardy@rdb.linux-help.org on Fri, Mar 09, 2001 at 07:30:48PM -0500
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Friday, 09 March 2001, at 19:30:48 -0500,
ardy@rdb.linux-help.org wrote:

> Is there any other X front ends for LVM maintenance other than the one on
> freshmeat.net?
> 
> As an aside, I emailed the maintainer of lvm-viewer, he hasn't updated the
> code since last year, and told me he had no time for further development.
> It'd be a shame to have that code go stale, I don't code so I couldn't
> offer to take it over.
> 
This is a recurring idea that comes to my mind very often: having a
reasonably good user interface on top on lvm tools would be nice. But this
should be a must, of course.

Moreover, last Friday I saw the graphical user interface that Veritas
Volume Managar ships on Enterprise and higher-priced SCO Unixware
licences. The UI seemed (IMHO) hardly useful, and taking into account that
volume mangement is not precisely that kind of thing newbies tend to do,
command line utilities are the best choice for now.

I also considered making a GUI frontend, but programming is not my best
skill, and available time is not on excess. Maybe this kind of frontends
is what distro-makers should do, ease the learning curve for newbies. The
community provides the functionality, and distro-makers provide the GUI.
There have plenty of GTK/Qt programmers, project management skills and
money, and a product to sell, which could gain market share if they
focused on this kind of things (apart from services, this is what RedHat,
SuSe, Mandrake and so on should do, IMHO).

Maybe what would be most interesting is a frontend and/or script to allow
simultaneous resizing of the filesystem and the underlying LV. Or there is
already such a program ?

Greetings, and thank you all for this great piece of software called LVM.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
