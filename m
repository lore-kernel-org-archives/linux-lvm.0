Message-Id: <20020130230954.E7763@fib011235813.fsnet.co.uk>
References: <20020130202254.A7364@fib011235813.fsnet.co.uk>
    <20020130145408.I763@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020130145408.I763@lynx.adilger.int>; from
    adilger@turbolabs.com on Wed, Jan 30, 2002 at 02:54:08PM -0700
From: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementation ready for beta
 testing
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
Date: Thu Jan 31 03:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, lvm-devel@sistina.com

On Wed, Jan 30, 2002 at 02:54:08PM -0700, Andreas Dilger wrote:
> On Jan 30, 2002  20:22 +0000, Joe Thornber wrote:
> > Sistina is pleased to announce that the LVM2 software is ready for
> > beta testing.
> > 
> > This is a complete reimplementation of the existing LVM system, both
> > driver and userland tools.
> 
> What is the current and future licensing of the LVM2 code?  Given the
> GFS events, I think people will be hesitant to accept an all-Sistina
> reimplementation of LVM.


LVM2 is GPL/LGPL-licensed - just like the original version of LVM.
This means the whole Linux community benefits from this aspect of
Sistina's work.  The device-mapper and LVM2 packages will *always* be
GPL/LGPL.

As those who have been following LVM development closely will be aware,
the decision to rewrite was taken for sound technical - not licensing -
reasons, and of course we welcome and encourage contributions to LVM2
from outside Sistina.

- Joe
