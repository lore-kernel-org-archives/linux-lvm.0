Subject: Re: [linux-lvm] LVM on Raid 5 Performance?
Message-ID: <OFE2CD45B2.0EA112E9-ONC1256D27.002FA1CF-C1256D27.0030AED4@nl.ibm.com>
From: "Rick van der Linde" <h.r.vanderlinde@nl.ibm.com>
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
Date: Thu May 15 03:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


Hi All!

>I'm using LVM for a long time, usually on non RAID
>systems to simplify storage space modifications ...
>
>recently I configured a nice system (Dual Athlon,
>with 4 18.2G U160 SCSI IBM (DDYS-T18350N) disks
>on an Adaptec 29160N Ultra160. Because I had some
>troubles with the Adaptec/SCSI cabeling I reduced
>the bus speed to 40Mhz, which gives 80MB/s transfer
>(theoretically) via SCSI, each disc seems to do
>about 15MB/s (which seems a little low). I decided
>to arrange the 4 discs in a RAID 5 array to gain
>some speedup and redundancy (which resulted in
>about 33MB/s burst, 25% below the, again theoretical
>limit of 45MB/s). Ontop of the RAID 5 array I
>configured LVM 1.0.7 to create several partitions
>for further use ...
>
>Now what happened was, that the performance (read)
>dropped to about 18MB/s burst, which wasn't what
>I expected at all ...
>
>Has anybody any explanations why the LVM layer eats
>up about 45% of the available throughput?
>(in this configuration?)

<SNIP results>

I can't yet tell you why, I see same kind of results with RAID 5 on 4 IDE
disks on
seperate channels (as master). In my case I use an ATA133 and onboard ATA33
controller. In my case the RAID5 set performs about 50 MB/s and the LVM
about
18 MB/s. I suspect my ATA controller as bottelneck because my disks which
can do
40 MB/s om the ATA133 controller suddenly operate at 18 MB/s on the ATA33.
That made me decide to buy another ATA100/133 controller.

As I searched internet on this issue I saw some discussion about ext3 in
combo with
md-raid and lvm. What filesystem did you use on your lvm volume on top of
RAID5?

What's fun too is when I use ext3 on RAID5 I see a performance of about 48
MB/s.
When I use reiserfs it reduces too abou 44 MB/s. ext2 shows almost the same
results
as ext3. Till now I same same results for ext2, ext3 and reiserfs in my
case, however
I still suspect my ATA33 channel to be the bottleneck in my case. When I
have another
ATA100/133 controller I'll post new results.

Rick
