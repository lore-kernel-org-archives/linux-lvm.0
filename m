From: Stephan Austermuehle <au@hcsd.de>
Message-ID: <20020604154638.B8663@babbage.hcsd.de>
References: <20020604145334.A8663@babbage.hcsd.de> <20020604152042.D17699@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020604152042.D17699@sistina.com>; from mauelshagen@sistina.com on Tue, Jun 04, 2002 at 03:20:42PM +0200
Subject: [linux-lvm] Re: pvmove: ERROR "pv_read(): device major number"
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
Date: Tue Jun  4 08:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello, Heinz,

On Tue, Jun 04, 2002 at 03:20:42PM +0200, Heinz J . Mauelshagen wrote:

> Could you please either use LVM 1.1-rc2 or LVM 1.1 from top of CVS
> (see instructions at www.sistina.com IRT CVS repository on how to
> check that out) and tell me, if that works.

I've just tried it with 1.1-rc2 without success:

	# ./pvmove --version
	pvmove: Logical Volume Manager 1.1-rc2
	Heinz Mauelshagen, Sistina Software  23/04/2002 (IOP 10)

	# ./pvmove /dev/vg00/lv_swap /dev/hda1 /dev/hdc1
	pvmove -- ERROR "pv_read(): device major number" reading source physical volume "/dev/vg00/lv_swap"

I built the LVM tools statically to avoid interference with installed
packages (Debian Woody).

Stephan
