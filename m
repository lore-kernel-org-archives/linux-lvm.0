Subject: Re: [linux-lvm] Re: device-mapper beta3 (fast snapshots)
Message-ID: <20020717110345.GA767@fib011235813.fsnet.co.uk>
References: <3D2F6464.60908@us.ibm.com> <02071513565400.06209@boiler> <20020716084234.GA431@fib011235813.fsnet.co.uk> <200207161105.49328.habanero@us.ibm.com> <20020716163157.GA11334@fib011235813.fsnet.co.uk> <20020716141406.W7316@xanex.hippierage.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020716141406.W7316@xanex.hippierage.org>
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
Date: Wed Jul 17 06:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Manning <jmm@sublogic.com>, linux-lvm@sistina.com

On Tue, Jul 16, 2002 at 02:14:06PM -0400, James Manning wrote:
> I'd love any feedback about tiobench - it's gotten kinda stale and I
> really need to find out what can get added to make it a more useful tool
> for benchmarking filesystems.
> 
> http://sf.net/projects/tiobench

I couldn't find an overview document, did I miss it ?

I really want a benchmark that will reflect typical uses of snapshots.
For instance the dbench test starts with an empty filesystem - who
snapshots an empty fs !

I'm going to write a target for device mapper that logs all io to an
LV (the log will be written to a device rather than via printk so it
shouldn't slow things down too much).  We can then ask people to run
with this stat collector over their LVs, and in that way get record
some realistic block device use.  All we need then is a benchmark
program that takes this log and plays back the requests to the block
layer.

This is very similar to what dbench does, except we will be recording
traffic at the block device level, rather than the fs.

Does tiobench work at the block or fs level ?

- Joe
