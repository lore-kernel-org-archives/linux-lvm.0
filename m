Subject: Re: [linux-lvm] what's different between LVM 2 and LVM 1
Message-ID: <20020830085824.GA1090@fib011235813.fsnet.co.uk>
References: <OF8EA0B97F.89DBA647-ON48256C25.0024512E@legend.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF8EA0B97F.89DBA647-ON48256C25.0024512E@legend.com.cn>
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
Date: Fri Aug 30 03:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 30, 2002 at 02:50:03PM +0800, lilha@legend.com.cn wrote:
> I am puzzled what's different between LVM 2 and LVM 1
> and I can't find any doc or introduction about the LVM2.
> 
> who is kind to tell me what is LVM2,
> and why i should use LVM2 replace of lvm1?

LVM2 is the next version of LVM that has a couple of goals:

i) A simpler more extensible kernel driver.  This driver, called
device-mapper, is already in the -ac series of 2.4 kernels.  Hopefully
device-mapper will replace the LVM1 driver completely in 2.[56].

ii) Ability to more easily support the new features we want to put in.
ATM we're concentrating on reproducing the functionality of LVM1,
though a couple of new features (eg. writeable/fast snapshots) have
crept in.

> and what's the future of LVM1? LVM1 will be discarded?

LVM1.0.x is the stable branch and will continue to be maintained by
Heinz for the foreseeable future (at least while people are using 2.4
kernels).  No new features will be added.

LVM1.1.x was an experimental/development branch, and will not be taken
further.

- Joe
