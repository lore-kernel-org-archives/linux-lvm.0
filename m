Subject: Re: [evms-devel] [linux-lvm] [ANNOUNCE] LVM reimplementation
    ready for beta testing
Message-Id: <20020131215124.A463@fib011235813.fsnet.co.uk>
References: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
    <20020131125211.A8934@fib011235813.fsnet.co.uk>
    <02020115304301.00650@boiler>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02020115304301.00650@boiler>; from corryk@us.ibm.com on Fri,
    Feb 01, 2002 at 03:59:06PM -0600
From: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
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
Date: Sun Feb  3 06:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Corry <corryk@us.ibm.com>
Cc: linux-lvm@sistina.com, evms-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Fri, Feb 01, 2002 at 03:59:06PM -0600, Kevin Corry wrote:
> I have been thinking about this today and looking over some of the 
> device-mapper interfaces. I will agree that, in concept, EVMS could be 
> modified to use device-mapper for I/O remapping. However, as things stand 
> today, I don't think the transition would be easy.
> 
> As I'm trying to envision it, the EVMS runtime would become a "volume 
> recognition" framework (see tanget below). Every current EVMS plugin would 
> then probe all available devices and communicate the necessary volume 
> remapping info to device-mapper through the ioctl interface. (An in-kernel 
> API set might be nice to avoid the overhead of the ioctl path).

The in kernel API already exists in drivers/md/dm.h, see dm-ioctl.c
for example code that uses this.


> A new device would then be created for every node that every plugin
> recognizes. This brings up my first objection. With this approach,
> there would be an exposed device for every node in a volume stack,
> whereas the current EVMS design only exposes nodes for the final
> volumes.

True, all the devices are exposed in /dev/device-mapper.  What we do
with LVM2 is stick with the /dev/<vg_name>/<lv_name> scheme, where the
lv is a symlink to the relevant node in the device-mapper dir.  That
way people only see the top level devices, unless they peek under the
hood by looking at /dev/device-mapper.

> Next, from what I've seen, device-mapper provides static remappings
> from one device to another. It seems to be a good approach for
> setting up things like disk partitions and LVM linear LVs. There is
> also striping support in device-mapper, but I'm assuming it uses one
> notion of striping. For instance, RAID-0 striping in MD is handled
> differently than striped LVs in LVM, and I think AIX striping is
> also different. I'm not sure if one stiping module could be generic
> enough to handle all of these cases. But, maybe it can. I'll have to
> think more about that one.

The thing that you've missed is that ranges of sectors are mapped by
dm onto 'targets', these targets are instances of a 'target_type'
virtual class.  You can define your own target types in a seperate
module and register them using the

int dm_register_target(struct target_type *t);

function (see <linux/device-mapper.h>).  We originally intended all
the standard target types to be defined in seperate modules, but that
seemed silly considering the tiny size of them (eg, < 200 lines for striping).

The targets type that we will be using in LVM2 are:

io-err - errors every io
linear
striped
snapshot, and snapshot origin
mirror (used to provide pvmove support as well as mirroring).

(both the snapshot targets and mirroring target will use kcopyd for
efficient copying using kiobufs.)

So if you invent a new form of striping, just implement a new target type.

> How about mirroring? Does the linear module in device-mapper allow
> for 1-to-n mappings?  This would be similar to the way AIX does
> mirroring, where each LP of an LV can map to up to three PPs on
> different PVs.

No, there's a seperate mirror target that Patrick Caulfields working
on at the moment.

> How would device-mapper handle a remapping that is dynamic at runtime?

Suspending a device flushes all pending io to the device, ie. all io
that has been through the driver but not yet completed.  Once you have
suspended you are free to loaded a new mapping table into the device
(this is essential for implementing snapshots and pvmove).  When the
new mapping is in place you just have to resume the device and away
you go.

- Joe
