Message-ID: <001b01c2c443$85025250$3200a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
References: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com> <20030124111515.O12662@schatzie.adilger.int> <20030124182629.GA3406@fib011235813.fsnet.co.uk>
Subject: Re: [linux-lvm] syncing with snapshots takes forever?
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
Date: Sat Jan 25 01:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message -----
From: "Joe Thornber" <joe@fib011235813.fsnet.co.uk>
To: <linux-lvm@sistina.com>
Sent: Saturday, January 25, 2003 3:26 AM
Subject: Re: [linux-lvm] syncing with snapshots takes forever?

>
> 30 minutes still seems _far_ too long for LVM2, although totally
> reasonable for LVM1.  At the risk of sounding patronising; when you
> tried LVM2 are you certain you were not running LVM1 by mistake ?
> (eg. was the LVM1 kernel driver present? did your volumes appear in
> /dev/mapper/ ?).
>

LVM1 was removed from the system cleanly. And LVM1 kernel driver was
removed,too.
Yes, /dev/mapper/? is there and /dev/vg01/?? is linked to /dev/mapper/??.

Thanks.
