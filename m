Subject: Re: [linux-lvm] lvm2 + linux 2.6.0-test2 + nptl
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <200307311721.24805.cousinmarc@free.fr>
References: <200307311721.24805.cousinmarc@free.fr>
Message-Id: <1059665440.4658.1.camel@chtephan.cs.pocnet.net>
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
Date: Thu Jul 31 10:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Do, 2003-07-31 um 17.21 schrieb Marc Cousin:

> What information can I provide ?
> kernel is 2.6.0-test2
> lvm tools are LVM2.2.00.05
> glibc is 2.3.2, with NPTL 0.55
> 
> Is it a know problem ?

Exactly the same configuration here (glibc/nptl from the latest Gentoo
Linux ebuild), I don't see any problems.

Can you strace vgscan?

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
