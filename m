From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] ERROR "pv_read(): PV identifier invalid
Message-Id: <20020113115331.A26594@golem.blacknet.de>
References: <001201c1987d$858e8b50$18c8ba81@ormanpc>
    <007c01c19947$3637d140$18c8ba81@ormanpc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007c01c19947$3637d140$18c8ba81@ormanpc>; from
    orman@iastate.edu on Wed, Jan 09, 2002 at 01:52:47PM -0600
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
Date: Sun Jan 13 04:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> This is a followon to my previous message, but noone seems to think it's
> a large drive issue so I changed the subject!
LVM defineitly has no problem with large drives, I'm running a 600GB and
a 400GB PV (both RAIDs but for the kernel they are still harddrives with
this size) with out any problems.

Have you tries to change the partition type to 8e as told in the howto?

    Goetz.
