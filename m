Received: from reti (vpn50-6.rdu.redhat.com [172.16.50.6])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2298Suq014961
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 09:08:29 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1Ay5to-00036Z-Up
	for linux-lvm@redhat.com; Tue, 02 Mar 2004 09:09:12 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] snapshot failes with kcopyd error
Message-ID: <20040302090912.GE662@reti>
References: <200403010557.i215vC40023828@bongo.freakout.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200403010557.i215vC40023828@bongo.freakout.de>
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
Date: Tue Mar  2 04:07:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Mar 01, 2004 at 06:57:12AM +0100, Axel Reinhold wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello,
> 
> i'm working with Linux 2.4.25/device-mapper: 4.0.5-ioctl and from
> time to time on creating snapshots i get:
> 
> device-mapper: Could not create kcopyd client
> device-mapper: error adding target to table
> 
> after that the system sometimes hangs completely.
> Is there any resource low? I use snapshots intensively
> and let them stay for long times.

Yes, this is a bit of a mess.  Snapshot creation can fail due to our
use of PF_MEMALLOC, which can't be removed until the tools are updated
to preload tables.  I also think the tools aren't backing out
properly, resulting in your hang.  Your best bet for now is to try and
use dmsetup to unpick the mess whenever it happens.  Sorry this sucks.

- Joe
