Return-Path: <mike@marxmeier.com>
Date: Wed, 6 Dec 2000 19:49:35 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20001206194935.A14728@colombina.comedia.it>
References: <3A2E0A5B.2EB3CCEB@elinux.com.sg>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A2E0A5B.2EB3CCEB@elinux.com.sg>; from michael@elinux.com.sg on Wed, Dec 06, 2000 at 05:43:55PM +0800
Subject: [linux-lvm] Re: WebMin LVM module development
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
To: Michael Boman <michael@elinux.com.sg>
Cc: linux-lvm <linux-lvm@msede.com>, linux-raid <linux-raid@vger.kernel.org>

On Wed, Dec 06, 2000 at 05:43:55PM +0800, Michael Boman wrote:
> 
> - I have problem using MD as a PV of my VG, any hints what it can be?
> <output>
> mike:/mnt# vgextend vg_test /dev/md0
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgextend -- ERROR: no physical volumes usable to extend volume group
> "vg_test"
> </output>

It's a known problem,
LVM 0.8final does not work
LVM 0.8.1 does work
LVM 0.9 does not again

Tomorrow is holiday in Milan, so i will try to give it a look

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
