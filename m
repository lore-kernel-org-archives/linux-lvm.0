Received: from reti (vpn50-34.rdu.redhat.com [172.16.50.34])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2ADRSuq004774
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 13:27:29 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1B13la-0000Ne-Ph
	for linux-lvm@redhat.com; Wed, 10 Mar 2004 13:28:58 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] Patch for Miguel Cabe?a's lvm2create_initrd script
Message-ID: <20040310132858.GD643@reti>
References: <403E8A0E.9070308@ist.utl.pt> <1078884314.2919.16.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1078884314.2919.16.camel@localhost>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 08:25:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Mar 09, 2004 at 09:05:14PM -0500, Jeff Layton wrote:
>  The second one is an ugly hack, and I'm definitely open to better ways
> of handling it. After my kernel upgrade (from 2.6.1 to 2.6.4-rc2), the
> major number of the device mapper devices on my system changed. So, I
> added a hack to copy the contents of the ramdisk /dev/mapper directory
> to the /dev/mapper directory on the lvm2 root filesystem, prior to the
> pivot_root. It works for me, but I'd love to hear about better ways of
> handling this.

Mount tmpfs on /dev/mapper, and then run 'dmsetup mknods' ?

- Joe
