Subject: Re: [linux-lvm] Linux 2.4.13-ac7 missing/wrong methods
Message-ID: <20011105093848.A406@btconnect.com>
References: <20011105004028.A322@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011105004028.A322@dragon.blacknet.de>; from bock@blacknet.de on Mon, Nov 05, 2001 at 12:40:28AM +0100
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
Date: Mon Nov  5 03:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 05, 2001 at 12:40:28AM +0100, Goetz Bock wrote:
> Hi,
> 
> after I'v just installed a new server with Linux 2.4.13-ac7 and LVM
> 1.0.1-rc4, I'd just wanted to tell you (dear list) that there are two
> missing symbols in lvm-snap.c

I see that Alan just merged the set of patches into -ac7, this means
he is now *very* close to what we have in cvs.  IRC all he's missing
is the extra bits of checking in lvm-snap, and the optimisation that
Andreas put into the hardsectsize calculation.  So unless you're a
heavy snapshot user, just use -ac as it comes.

BTW: if someone (Andreas ?) finds time to build a patch to update him
in these two areas I'd appreciate it.

- Joe
