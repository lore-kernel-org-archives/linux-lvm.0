Return-Path: <root@srv.sistina.com>
Date: Mon, 19 Feb 2001 13:55:29 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan creation of device nodes for volume groups.
Message-ID: <20010219135529.H15089@srv.sistina.com>
References: <Pine.LNX.4.30.0102172218260.8781-100000@beefcake.hdqt.valinux.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.30.0102172218260.8781-100000@beefcake.hdqt.valinux.com>; from jweber@valinux.com on Sat, Feb 17, 2001 at 10:24:38PM -0800
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

On Sat, Feb 17, 2001 at 10:24:38PM -0800, Jay Weber wrote:
> Hi,
> 
> I've noticed the following and am wondering about the proper way to handle
> this.
> 

A fast workaround (assuming bash) to avoid those invalid entries
in /dev/ would be:

(cd /dev;ls -A /etc/lvmtab.d/|xargs rm -r)

You need to run it *before* vgscan for sure, because vgscan starts with
removing /etc/lvmtab*.

One extension could be to let vgscan do the removal job itself.

> I'll try to explain by example, since it's kinda awkward.
> 
> I've created 3 volume groups.  vol0, vol1, vol2.  On these I have a

<SNIP>

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
