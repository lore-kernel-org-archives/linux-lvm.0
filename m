From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Problem with 1.2Tera byte.
Message-ID: <20030124200057.GA2370@localhost>
References: <001601c2c393$6730dea0$0400a8c0@venkat>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001601c2c393$6730dea0$0400a8c0@venkat>
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
Date: Fri Jan 24 14:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Friday, 24 January 2003, at 19:28:57 +0900,
abbireddy venkatram reddy wrote:

>  I have installed LVM and kernel patch on a Linux box which contains 3ware RAID controller ,1.2Tera of IDEs, 1024MB RAM. I have created 3 Logical volumes of each 50GB and for each LV created 3 snaps of same size.
> 
I don't have an explanation for the slowdown you are experiencing with
"snapshots", but remember that snapshots hold the same data as the LV
the come from, but the snapshot size must be only large enough to hold
the changes made to the original LV during the snapshot lifetime.

That is, if your LV are 50 GB long, and there is no much write activity
on them, snapshots of just a couple of GB (or even less) should be
perfectly reasonable for your setup. Try this and report if the slowdown
still continues.

Regards,

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.4.20-xfs)
