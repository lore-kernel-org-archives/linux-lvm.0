Return-Path: <thornber@btconnect.com>
Date: Fri, 22 Jun 2001 10:49:21 +0100
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010622104921.C365@gambit>
References: <134718885.992837796416.JavaMail.root@boots> <20010618123318.A31606@tiger.bigcats.invalid> <20010621094645.A300@gambit> <20010622025926.B3938@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010622025926.B3938@tiger.bigcats.invalid>; from weissel@netcologne.de on Fri, Jun 22, 2001 at 02:59:26AM +0200
From: Joe Thornber <thornber@btconnect.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 22, 2001 at 02:59:26AM +0200, Wolfgang Weisselberg wrote:
> man pvmove:
> [...]
>        You  can  move  physical  extents in use but make sure you
>        have an current backup in case of  a  system  crash  while
>        moving!!!
> 
> Now, this does *not* look like *crashproof*, does it?
> This is from the CVS, btw, dated 2001-06-10.

Heinz,

Do we update the metadata after each individual extent is moved ?  Or
at the end of the whole pvmove ?

I'd assumed we were doing the former, in which case this comment from
the man page is unduly pesimistic.

- Joe
