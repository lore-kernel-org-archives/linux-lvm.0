Received: from reti (vpn50-41.rdu.redhat.com [172.16.50.41])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2IAgsJh018573
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 10:42:54 GMT
Received: from joe by reti with local (Exim 4.30) id 1B3v1D-0000eI-J5
	for linux-lvm@redhat.com; Thu, 18 Mar 2004 10:44:55 +0000
Date: Thu, 18 Mar 2004 10:44:55 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] quiescing physical volumes
Message-ID: <20040318104455.GA628@reti>
References: <OF8332408E.0F643C1C-ONC1256E5B.00364305-C1256E5B.003A0263@provinzial.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF8332408E.0F643C1C-ONC1256E5B.00364305-C1256E5B.003A0263@provinzial.de>
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

On Thu, Mar 18, 2004 at 11:33:36AM +0100, m.klaeschen@provinzial.de wrote:
> features. Background is that we have quite a couple of disk which we do not
> want to double to have a snapshot device.

The snapshot devices are generally much smaller than the origin
devices since they only store blocks that have changed.

- Joe
