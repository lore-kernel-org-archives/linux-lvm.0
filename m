From: bscott@ntisys.com
Subject: Re: [linux-lvm] How to best use LVM? 
In-Reply-To: <20020816150554.11E08F90D@tater>
Message-ID: <Pine.LNX.4.44.0208161735420.28115-100000@dragon.inside.ntisys.com>
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
Date: Fri Aug 16 16:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 16 Aug 2002, at 11:05am, pll+lvm@lanminds.com wrote:
> Now, the question is, how to deal with all this disk space.  For the 
> particular systems I'm using, the basic disk configuration is 4 80GB 
> IDE drives partitioned thusly:
> 
> 	/dev/hda5	487M	/
> 	/dev/hda1	130M	/boot
> 	/dev/hda6	4.9G	/usr
> 	/dev/hda7	4.9G	/var
> 	/dev/hda8	66GB	empty

  Since you describe the Storage Nodes as being little more than a Network
Block Device, that layout seems wrong to me.  I would aim for a totally
stripped down, absolute bare minimum for the SNs.  Say you fit the whole
system into 100 MB.  So create a 100 MB partition on each local drive.  The
system goes into the 100 MB partition on the first disk.  The other three
are ignored.

  The remaining space on each drive is partitioned, and each partition is
exported separately via NBD.  Do all the storage management (concatenation,
stripping, mirroring, etc.) on the Access Node(s).  That gives you maximum
flexibility -- you could mirror individual drives across SNs, for example.

  For reliability, instead of a single partition for the system on SNs,
mirror it using Linux software RAID.

  To make things really interesting, create a four-way mirror of the system
partition on each SN.  That way, an SN would not be completely dead unless
all four disks were dead.  Modifying the Linux software RAID code to support
a four-way mirror is left as an exercise to the reader.

  Actually, if the SN system is simple enough, you could prolly just mirror
it "by hand" -- write the configuration state to each of the four drives.  
Software updates would be a pain, though.  Might just be easier to enable 
4-way mirror (see above).

- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
