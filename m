From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] lvm in SuSE 7.3
In-Reply-To: <200112200912.fBK9CLC14632@mailgate5.cinetic.de>
Message-Id: <Pine.LNX.4.33.0112201024260.10231-100000@www.scotty.co.at>
MIME-Version: 1.0
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
Date: Thu Dec 20 03:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 20 Dec 2001 10:12, r.kahrl@web.de wrote:

> I just wondered what LVM in Yast2 means and opened it... but i
> didn't want to create a LV on my System, so i closed the program
> without creating a Logical Volume. If i restart my system, LVM
> reports no volume group was found and starts vgchange. How can i
> remove this problem?

rm -fR /etc/lvmtab.d/
should do the trick for you.

-- 
MfG / Regards
Friedrich Lobenstock
