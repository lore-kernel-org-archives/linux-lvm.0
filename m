Date: Tue, 9 Oct 2001 02:40:19 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
Message-ID: <20011009024019.C18508@colombina.comedia.it>
References: <20011008120338.B18314@sistina.com> <Pine.LNX.4.33.0110090123200.11852-100000@fogarty.jakma.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0110090123200.11852-100000@fogarty.jakma.org>; from paul@clubi.ie on Tue, Oct 09, 2001 at 01:25:47AM +0100
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

On Tue, Oct 09, 2001 at 01:25:47AM +0100, Paul Jakma wrote:
> On Mon, 8 Oct 2001, Heinz J . Mauelshagen wrote:
> 
> > Well, our impression is that optimizing under gcc > 2.95.2 doesn't seem
> > to be a good idea.
> 
> have you pinned it down to a specific bug in gcc, or is it based on 
> "doesn't happen with -O0"?
> 
i rebuilt latest cvs wih mandrake compiler:
gcc version 2.96 20000731 (Mandrake Linux 8.1 2.96-0.62mdk)

using -O2 -march=athlon and it looks like vgscan is ok

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
