Return-Path: <adalbert.list@lopez.at>
Date: Sun, 11 Feb 2001 15:42:37 +0100
From: Adalbert Michelic <adalbert.list@lopez.at>
Message-ID: <17316403266.20010211154237@lopez.at>
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
In-reply-To: <3A85CE89.67D252D7@wrkhors.com>
References: <3A85CE89.67D252D7@wrkhors.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM List <linux-lvm@sistina.com>

Hi,

* On Sunday, February 11, 2001 at 00:28, Steven Lembark wrote:
>         ./configure --prefix=/opt/lvm/0.9.1

> leaves only the man pages in the prefix dir, exec's still go
> to /sbin.  this is bad news since it will blow off the entire
> LVM installation the next time i test an install.  

> checking ./configure --help:
[..]
> Directory and file names:
>   --prefix=PREFIX         install architecture-independent files in
> PREFIX
>                           [/usr]
>   --exec-prefix=EPREFIX   install architecture-dependent files in
> EPREFIX
[...]
> so, prefix should set eprefix & friends which should leave the
> binaries in /opt/lvm/0.9.1/sbin, etc.

You have to set --exec-prefix either - --prefix does _not_ modify
--exec-prefix as far as i can see.


Adalbert
