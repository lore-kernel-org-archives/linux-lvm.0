Subject: Re: [linux-lvm] snapshot size
Mime-Version: 1.0 (Apple Message framework v551)
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B54C@mercury.infiniconsys.com>
Message-Id: <79807CE4-5B12-11D7-91E2-000393CA5730@fib011235813.fsnet.co.uk>
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
Date: Thu Mar 20 14:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, March 20, 2003, at 06:16 PM, Barry, Christopher wrote:

> 	I just got LVM2 w/XFS up and running recently. I rsync'd all of my 
> existing home data into a new lv, and decided to test the snapshotting 
> functionality. I had tested with a dd'd test file in a test lv prior 
> to this, and all looked good. Now, I have a 110G lv with all of my 
> home data in it. I create a snapshot lv (takes under 10 seconds!) of 
> home without error, and I can mount the snapshot lv, and 'ls' it, poke 
> around in it, and it *looks* like all is there. However, a df shows 
> the snapshot volume to be only ~32G vs 110G for the original.
>
> Q: Is this normal? Is the snap just way more space efficient?
> Q: Also, how does the snapshot work so fast??

A couple of points:

1)  If you are taking snapshots of filesystems you will need to apply 
the vfs-lock patch from the LVM1 distro.
2)  Make sure you're using my latest dm patchset, Kevin  Corry fixed a 
couple of snapshot problems.  Choose the highest numbered tarball from 
here: http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/

Snapshots work by only copying data across t the snapshot volume as it 
changes on the origin volume.  So you only need to size the snapshot 
volume to be big enough to hold all the deltas.  You can use the 
display tools to track how full the snapshot volume is getting, and 
extend the volume if necessary.

- Joe
