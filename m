Message-ID: <3F00F024.8050006@cablespeed.com>
From: Howard Clifford <howardclifford@cablespeed.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] performance writing to an lv with no file system
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
Date: Mon Jun 30 21:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz,

Thank you for the response.

My logical volume is striped - 7 ways.

I am writing to the lv with a simple c program I wrote.

Each write is 7*stripesize, which in this case is 28 blocks.

Any thoughts on how I can get top speeds without mounting and unmounting 
  the volume?

Thanks,
Howie


 > Howard,

 > what's the LV layout (linear/striped ?).
 > How do you write to the LV (dd or soemthing).
 > What's the write pattern (sequential ? block size ?)

 > 80MB/sec raw sounds like you use a striped LV.


On Sun, Jun 29, 2003 at 12:08:34PM -0400, Howard Clifford wrote:
 > I built a 7 disk vg and put 1 lv on it.  I do not want to mount a file
 > system.
 > I just want to write directly to the disk device, /dev/vg1/vol1.
 >
 > My write performance has an odd behavior.
 > If after booting I write to the volume I get roughly 175MB/sec.
 > If after booting I do a mke2fs on the volume, mount it, umount it, then
 > write to the volume I get roughly 230 MB/sec.
 >
 > Any ideas?  How can I get top speed without first mounting then
 > umounting the volume?
 > By the way, I tried binding a raw device to the lv and got very bad
 > performance; around 80 MB/sec.  Would that be expected?
 >
 > (I'm using redhat 9.0 -> lvm-1.0.3-12)
 >
 > Thanks...
 >
 >
 > _______________________________________________
 > linux-lvm mailing list
 > linux-lvm@sistina.com
 > http://lists.sistina.com/mailman/listinfo/linux-lvm
 > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
     Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                   56242 Marienrachdorf
                                                   Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                        FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
