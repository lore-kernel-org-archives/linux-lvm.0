From: pll+lvm@lanminds.com
Subject: Re: [linux-lvm] How to best use LVM? 
Message-Id: <20020816150554.11E08F90D@tater>
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
Date: Fri Aug 16 10:06:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


I guess I should re-title this "How best to lay out my disk space", 
but that seems rather long for a Subject line :)

As I mentioned in a previous post, I'm playing with fire.  I want to 
combine the concepts of LVM with NBD to get an almost infinitely 
scalable amount of storage.  At some point I expect there's going to 
be a limiting factor which prevents the infinite scalability from 
really being infinite.  I haven't determined whether that limiting 
factor is going to be Linux sw RAID, LVM, NBD, the Linux kernel, or 
the network, but one of them will invariably become a bottle neck :)

My idea can be broken down into basically 2 different types of system:
the Storage Node (SN), and the Access Node (AN).

The SN systems will essentially be nothing more than a system with a 
minimal OS installation on it containing almost nothing more than is 
absolutely necessary.  These systems are nothing more than an OS with 
access to gobs of local disk space.

The AN system(s) will be configured as any system which needs access 
to a lot of disk space.  In general, there will be a 1:many ratio 
between ANs and SNs, but I guess you could increase the number of ANs 
if you wanted to create an HA cluster environment.

The SNs will be configured as NBD servers, exporting their local, 
unused disk space out to the AN.

The AN will have LVM installed and be an NBD client.  It will have 
access to all the exported drive space of all the SNs.

Now, the question is, how to deal with all this disk space.  For the 
particular systems I'm using, the basic disk configuration is 4 80GB 
IDE drives partitioned thusly:

	/dev/hda5	487M	/
	/dev/hda1	130M	/boot
	/dev/hda6	4.9G	/usr
	/dev/hda7	4.9G	/var
	/dev/hda8	66GB	empty

	/dev/hdb	80GB	empty
	/dev/hdc	80GB	empty
	/dev/hdd	80GB	empty

Since each SN will have 3 empty IDE drives and one huge empty 
partition on /dev/hda8, I could potentially export about 306GB
((3 * 80GB) + 66GB)  from each system.  To do that, it would seem 
easiest to export each of the 3 drives and the empty partition as 
separate network block devices for a total of 4 exported devices per 
system.

The other option is to ignore the /dev/hda8 partition.  I could 
reserve that for future use on the local system for whatever.
This would leave 3 exportable devices from each SN.  

I was thinking of using RAID5 across these 3 partitions and exporting 
/dev/md0 out via NBD, which would mean only 1 NBD per SN, which leads 
to a little more managability if the number of SNs were to grow very 
high.  This has 2 advantages:

	- RAID5 at the back end for data integrity
	- minimizes the number of network connections back to the SN
	  from the AN.

	  (for some reason I fear a lot of network activity between 
	   the AN and SNs.  Limiting the number of network block 
	   devices seems like a good idea at this point.)

Since the SNs will only be exporting a single NBD in this 
configurations, I figured that I could then use RAID1 (mirroring) on 
the AN to ensure that if any one node were taken out for some reason, 
I'd still have the ability to access the data contained on it.

Since I plan on using LVM on the AN side, each SN-NBD would become a  
PV.  For every 2 SN-PVs added to the environment, I'd be 
able to create a RAID1 meta-device of those PVs, then add them to a 
VG, and then create LVs out of the new space.

There is obviously a *lot* that could go wrong with this entire house 
of cards.  Which is why I'm sending this post.  I'm hoping some 
others might have some good ideas I haven't thought of yet.

Anyway, any feedback anyone has is more than welcome.  I'd love to 
know what people think about this.  Btw, I know it's probably crazy 
to attempt this, but I have the time and the hardware to do so and 
I'm bored :)

Thanks,
-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
