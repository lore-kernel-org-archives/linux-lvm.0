From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] One VG or many?
Message-ID: <20020606095152.A18311@babbage.hcsd.de>
References: <F888C30C3021D411B9DA00B0D0209BE8038F9522@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F9522@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Wed, Jun 05, 2002 at 12:33:23PM -0700
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
Date: Thu Jun  6 02:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jun 05, 2002 at 12:33:23PM -0700, Poul Petersen wrote:

> Let me ask a slightly different question - what is the advantage to
> creating a VG for every logical business/application unit? Or

When I setup a system I try to separate data that doesn't belong
together as far as possible to get maximum protection from software
and/or hardware faults. Multiple VGs increase chances to let other
applications in different VGs continue to work if a PV in one VG
fails. Of course if a system only has one application or if it doesn't
make sense to split up the disks into multiple VGs then create a
single VG only. So maybe having multiple VGs is useful on large
servers only.

Stephan
