From: Andries.Brouwer@cwi.nl
Message-Id: <UTC200201152044.UAA324996.aeb@cwi.nl>
Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
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
Date: Tue Jan 15 14:46:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch@caldera.de, torvalds@transmeta.com
Cc: alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org, linux-lvm@sistina.com, viro@math.psu.edu

    On Mon, 14 Jan 2002, Christoph Hellwig wrote:
    >
    > I know - still it makes Linus' suggestion not work on ~90% of the
    > systems.

    It doesn't matter if user-land compilation breaks. As long as old binaries
    work (and they will), we're fine.

    User-land was _already_ broken. By virtue of using a type that it should
    NOT have used.

    If you want to use __kernel_dev_t, go ahead.

            Linus

Yes. As everyone knows, one should not use kernel includes.
On the other hand, having local copies of everything is also
a bad habit, to be avoided when possible.
With Linux it is generally impossible to avoid going to local
copies, but so far losetup survived with the construction

% cat loop.h
#include <linux/posix_types.h>
#undef dev_t
#define dev_t __kernel_dev_t
#include <linux/loop.h>
#undef dev_t
%

Yecch.

(This is terribly ugly, but the alternative may be even worse:
lots of #ifdef's testing architecture etc.)

It is a pity that dev_t, a type that is not used anywhere in the
kernel except at the interface with user space, is a different
type from what user space uses.

Andries
