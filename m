Message-Id: <001201c19c52$b07edd00$fc1e0e18@WARL0K>
From: "Glenn Shannon" <warl0k@lvcm.com>
References: <001201c1987d$858e8b50$18c8ba81@ormanpc>
    <007c01c19947$3637d140$18c8ba81@ormanpc>
    <20020113115331.A26594@golem.blacknet.de>
Subject: Re: [linux-lvm] ERROR "pv_read(): PV identifier invalid
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Jan 13 10:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I will back that up.

I have 1.4TB (soon to be 2TB) on lvm in a single lv, and I have had no
problems yet.

Glenn
----- Original Message -----
From: "Goetz Bock" <bock@blacknet.de>
To: <linux-lvm@sistina.com>
Sent: Sunday, January 13, 2002 3:53 AM
Subject: Re: [linux-lvm] ERROR "pv_read(): PV identifier invalid


>
> > This is a followon to my previous message, but noone seems to think it's
> > a large drive issue so I changed the subject!
> LVM defineitly has no problem with large drives, I'm running a 600GB and
> a 400GB PV (both RAIDs but for the kernel they are still harddrives with
> this size) with out any problems.
>
> Have you tries to change the partition type to 8e as told in the howto?
>
>     Goetz.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
