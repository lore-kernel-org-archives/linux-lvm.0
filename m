From: Andrew Morton <akpm@digeo.com>
Message-Id: <20030628222938.78c16450.akpm@digeo.com>
In-Reply-To: <20030628115033.GA660@gmx.de>
References: <20030627202130.066c183b.akpm@digeo.com>
	<20030628115033.GA660@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: 2.5.73-mm2
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
Date: Sun Jun 29 00:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Wiktor Wodecki <wodecki@gmx.de>
Cc: linux-lvm@sistina.com

Wiktor Wodecki <wodecki@gmx.de> wrote:
>
> On Fri, Jun 27, 2003 at 08:21:30PM -0700, Andrew Morton wrote:
>  > ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.73/2.5.73-mm2/
>  > 
>  > Just bits and pieces.
> 
>  I have problems with lvm2 and the 2.5.73-mm2 patchset.

Could be because -mm uses a 64-bit dev_t.

Could you please revert 
ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.73/2.5.73-mm2/broken-out/64-bit-dev_t-kdev_t.patch
and retest?

I think there's a version of devicemapper userspace which works correctly
with 64-bit dev_t.  Perhaps the Sistina team can shed some light.
