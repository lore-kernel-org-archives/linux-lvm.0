From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1-rc4 and 2.4.13
Message-ID: <20011026095641.C587@tykepenguin.com>
References: <20011026005405.A21775@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011026005405.A21775@sky.net>; from U.Wiederhold@gmx.net on Fri, Oct 26, 2001 at 12:54:05AM +0200
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
Date: Fri Oct 26 03:59:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 12:54:05AM +0200, Ulrich Wiederhold wrote:
> Hello,
> I untared 2.4.13, applied the official xfs patch, then the fresh created
> lvm patch.
> 
> No mistakes.

The XFS patch removes some essential LVM bits from the Makefile I think (maybe
it has an old LVM in there or something)

Edit drivers/md/Makefile and change the lvm-mod-objs line to read:

lvm-mod-objs    := lvm.o lvm-snap.o lvm-fs.o



patrick
