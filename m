Received: from reti (vpn50-40.rdu.redhat.com [172.16.50.40])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2HM4AJh026081
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 22:04:11 GMT
Received: from joe by reti with local (Exim 4.30) id 1B3jAw-00014N-PM
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 22:06:10 +0000
Date: Wed, 17 Mar 2004 22:06:10 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] EXT3 snapshot not quiesced by LVM2?
Message-ID: <20040317220610.GB2624@reti>
References: <20040315182356.35f5ca40.donald.murray@pason.com>
	<20040317105725.15a71d21.donald.murray@pason.com>
	<20040317181230.GA2624@reti>
	<20040317120056.430fbe2b.donald.murray@pason.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317120056.430fbe2b.donald.murray@pason.com>
Sender: Joe Thornber <thornber@redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 17, 2004 at 12:00:56PM -0700, Donald Murray P.Eng. wrote:
> Because we're using device-mapper 1.00.08, I'm assuming we need only
> apply patches 9 through 16 to our already-patched kernel, correct?

No, apply them all, the patch numbers just signify application order.

- Joe
