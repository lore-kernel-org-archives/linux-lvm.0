Return-Path: <tack@orion.dok.org>
Date: Mon, 13 Aug 2001 13:58:27 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813135827.E24098@linux.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813161301.B6466@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010813161301.B6466@uk.sistina.com>; from agk@uk.sistina.com on Mon, Aug 13, 2001 at 04:13:01PM +0100
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

* Alasdair G Kergon (agk@uk.sistina.com) [010813 11:17]:
> I envisage any 'wrapper' application (eg. GUI) as simply opening a
> pipe/socket to 'lvm --condensed-output' (say) and passing individual
> lvm commands in and getting responses back in a consistent,

FWIW, this is precisely how Veritas Volume Manager's visual
administrator (vxva) works.  

It doesn't matter much to me how I interface with LVM and other
components, as long as there is a sane way to handle errors, and I'm
able to get all the same information vs. using ioctls.

So the general consensus seems to be to interface through the LVM tools.
That takes care of the lvm -- now the same question needs to be answered
for md and controller/disk/partition info.  This may be the wrong list.
:)

Cheers,
Jason.
