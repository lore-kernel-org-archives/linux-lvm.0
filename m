Subject: Re: [linux-lvm] what's different between LVM 2 and LVM 1
Message-ID: <20020830094728.GB1812@fib011235813.fsnet.co.uk>
References: <OF8EA0B97F.89DBA647-ON48256C25.0024512E@legend.com.cn> <20020830085824.GA1090@fib011235813.fsnet.co.uk> <E17ki0Z-0007dJ-00@arwen.dev33.cvf>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E17ki0Z-0007dJ-00@arwen.dev33.cvf>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Aug 30 04:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 30, 2002 at 11:24:03AM +0200, Pierrick PONS wrote:
> just a stupid question :
> Why does LVM2 was not a version of lvm so that we just had to upgrade LVM ?

You will be able to upgrade from LVM1.

> If LVM2 is just an upgrade of LVM1, why couldn't you continue with lvm-xxxxx ?

Because LVM2 is a complete rewrite, and we wanted to avoid confusion
between the two products.  If you look you will find that the LVM2
tools currently return a version number of 1.95.x.

- Joe
