Return-Path: <riel@conectiva.com.br>
Date: Fri, 5 Jan 2001 09:57:34 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [lvm-devel] Re: [linux-lvm] LVM 0.9 vgscan problem
In-Reply-To: <20010105123820.A1886@gondor.com>
Message-ID: <Pine.LNX.4.21.0101050956050.1295-100000@duckman.distro.conectiva>
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
To: Jan Niehusmann <jan@gondor.com>
Cc: linux-lvm@sistina.com, lvm-devel@sistina.com

On Fri, 5 Jan 2001, Jan Niehusmann wrote:
> On Thu, Jan 04, 2001 at 08:01:10PM -0200, Rik van Riel wrote:
> > But when I type (with the IOP10 tools) the following
> > all hell breaks loose:
> > 
> > # vgextend vg0 /dev/hda5    (the previously removed PV)
> > 
> > The oops is below.
> 
> This is already known, a fix is in cvs. (But I didn't try it, I
> just remembered that somebody mentioned it on the mailinglist).

Then the all-important question:

Why the hell wasn't this bugfix given to Linus for
inclusion in the 2.4.0 kernel ?

IMHO it is nothing but unresponsible to sit on bugfixes
and not give them back to the maintainers of the main
source repository (in this case, the kernel tarball).

LVM folks: please send this patch to Linus, Alan and the
list asap so we have a chance of a working LVM in 2.4.

regards,

Rik
--
Virtual memory is like a game you can't win;
However, without VM there's truly nothing to loose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/
