Return-Path: <thornber@btconnect.com>
Date: Mon, 20 Aug 2001 21:14:02 +0100
Subject: Re: [linux-lvm] LVM 1.0 performance
Message-ID: <20010820211402.A1077@btconnect.com>
References: <20010820190959.A827@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010820190959.A827@dardhal.mired.net>; from jdomingo@internautas.org on Mon, Aug 20, 2001 at 07:10:00PM +0000
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Mon, Aug 20, 2001 at 07:10:00PM +0000, Josi Luis Domingo Lspez wrote:
<snip>
> There are a couple of things that surprised me: it seems like LVM over a
> single partition is even faster than the partition itself (??), random
> seek rate grows with stripe size on both RAID and LVM, write performance
> with striped LV is about the same as RAID-0 performance, but read
> performance with striped LV is terribly slow compared to a similar setup
> with RAID-0 (even slower that a LV with stripe=1).

Last time I tested striping with IDE I got read of 56 M/s with bonnie++.

- Joe
