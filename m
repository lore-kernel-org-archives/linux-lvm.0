Return-Path: <kirth@hole.org>
Date: Wed, 21 Mar 2001 00:29:57 +0000
From: Kirth <kirth@hole.org>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
Message-ID: <20010321002957.A25309@prodding>
References: <200103202021.f2KKLR902727@webber.adilger.int> <3AB7BF33.CBCFAEA7@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AB7BF33.CBCFAEA7@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Tue, Mar 20, 2001 at 09:36:03PM +0100
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

* David Vidal Rodriguez (vidalrod@informatik.tu-muenchen.de) wrote:
> Andreas Dilger wrote:
> 
> >
> >
> > ????  If you are not root, then how do you expect to install a new kernel
> > or run the LVM user tools????
> >
> 

Hi,

	Having had the same problem, I did upgrade my kernel and can
	now access my LVM, but vgscan still doesnt work.

	The drives seem to be missing one UUID each:

hdg1:
	--- List of physical volume UUIDs ---

000: 3y4m3p-fgHn-0vAI-BRkG-rpAA-LZvd-3U98de
001: p66g9Y-hBKc-Ovlz-JX3V-6F6w-bk6a-1UP1MX
002: --- EMPTY ---

hdf1:

--- List of physical volume UUIDs ---

000: UsFg0p-DUVj-nNas-7JlU-WePY-ad7y-zyjPie
001: p66g9Y-hBKc-Ovlz-JX3V-6F6w-bk6a-1UP1MX
002: --- EMPTY ---

hde1:

--- List of physical volume UUIDs ---

000: UsFg0p-DUVj-nNas-7JlU-WePY-ad7y-zyjPie
001: p66g9Y-hBKc-Ovlz-JX3V-6F6w-bk6a-1UP1MX
002: --- EMPTY ---


	I have run vgcfgrestore before vgscan, and yet it still cant find
the VG. Any ideas on how to get the UUID's written back correctly ? (I guess
they are partly missing in the backup files). I have all three in the above
just the drives dont have all three themselves.

Any help would be appreciated


Regards
Richard
