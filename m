Received: from reti (vpn50-40.rdu.redhat.com [172.16.50.40])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2HIAVJh018015
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 18:10:31 GMT
Received: from joe by reti with local (Exim 4.30) id 1B3fWo-0000pE-9a
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 18:12:30 +0000
Date: Wed, 17 Mar 2004 18:12:30 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] EXT3 snapshot not quiesced by LVM2?
Message-ID: <20040317181230.GA2624@reti>
References: <20040315182356.35f5ca40.donald.murray@pason.com>
	<20040317105725.15a71d21.donald.murray@pason.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317105725.15a71d21.donald.murray@pason.com>
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

On Wed, Mar 17, 2004 at 10:57:25AM -0700, Donald Murray P.Eng. wrote:
> Does anyone have any theories why our LVM2 snapshots have orphaned inodes?

Yes, it's because the VFS lock patch isn't wired up correctly in the
version of dm that you're using - it's quiescing the wrong device.

You could try my _unstable_ dm tree if you wish to experiment.

people.sistina.com/~thornber/dm

- Joe
