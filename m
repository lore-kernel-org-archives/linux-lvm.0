From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] One VG or many?
Message-ID: <20020605100920.R8663@babbage.hcsd.de>
References: <F888C30C3021D411B9DA00B0D0209BE8038F951A@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F951A@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Tue, Jun 04, 2002 at 02:03:38PM -0700
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
Date: Wed Jun  5 03:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 04, 2002 at 02:03:38PM -0700, Poul Petersen wrote:

> We have about 2TB to slice up and using a single VG seems to provide
> the most flexibility for usage of the space. However, using one VG

First, I would separate system (= containing the OS) and data area.
Second, if you do not intend to stripe data across LVs I would create
one VG for every logical business/application unit and assign disk
space on demand. That means that you leave most disks in a pool and
if you need more space in one VG you'll add the disk online with
vgextend. Why not start with one disks per VG?

If you plan to use the striping feature of LVM you should think of
what is sane looking at the two aspects speed and cost of extension
(e.g., striping across four disks requires you to add four disks at a
time if you need more space).

Stephan
