Subject: Re: [linux-lvm] libgcc_s.so.1 dependancy
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030716072147.GC18961@percy.comedia.it>
References: <200307151853.56054.cousinmarc@free.fr>
	 <20030716072147.GC18961@percy.comedia.it>
Message-Id: <1058352267.3813.17.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
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
Date: Wed Jul 16 05:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Marc Cousin <cousinmarc@free.fr>

Am Mi, 2003-07-16 um 09.21 schrieb Luca Berra:

> libgcc_s.so.1 really belogs to /lib go and fix your distro
> L.

Why that? I know, usually gcc installs it into /usr/lib, but I don't
think there is anything wrong with this way of doing things. Gentoo
installs some things into the gcc directory that comes with gcc and puts
wrappers into /usr/bin. It's much easier to installing several compiler
versions in parallel and uninstalling them afterwards without having
trouble. Look at the mess on my other systems where I compiled
everything by hand and I've got a chaos in /usr/lib. And the directories
are listed in /etc/ld.so.conf anyway, so what's the problem?

But he's right. This is strange. On my gentoo system with gcc 3.3 lvm2
doesn't get linked to libgcc.so either.

Something has to be different on his system. Where's the depencency
coming from? From libdevmapper.so or from the tool itself?

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
