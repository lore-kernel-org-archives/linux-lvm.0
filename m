Return-Path: <john@oswf.de>
From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15205.8116.140118.536815@rigel.oswf.de>
Date: Mon, 30 Jul 2001 10:49:56 +0200 (MEST)
Subject: Re: [linux-lvm] Fwd: lvm help
In-Reply-To: <20010727140754.A22982@sistina.com>
References: <20010727181807.11198.qmail@web13409.mail.yahoo.com>
	<20010727140754.A22982@sistina.com>
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
To: linux-lvm@sistina.com

AJ Lewis writes:
> On Fri, Jul 27, 2001 at 11:18:07AM -0700, Pierre Lamb wrote:
> > help 
> > I placed the 2 required commands in rc.sysinit (rh71)
> > before hte section "Mounting other file"
> > gave vgscan the -d option and left vgchange -ay.
> > During the boot process I see where vscan uodated
> > lvmtab and lvmtab.d and it say successfull but when I
> > look into lvmd.d it is empty. after I log in then do
> > the vgscan the correct entries are made. Ant help
> > would be appreciated.

hmmm, is your /etc already mounted rw at the point you run vgscan?

Regards,
Werner

> > Pierre
> 
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Mountain Dew... because breakfast is the most important meal of the day.
> -----End Obligatory Humorous Quote------------------------------------------
