From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] LVM on Raid 5 Performance?
Message-ID: <20030515214531.GA22215@www.13thfloor.at>
References: <OFE2CD45B2.0EA112E9-ONC1256D27.002FA1CF-C1256D27.0030AED4@nl.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFE2CD45B2.0EA112E9-ONC1256D27.002FA1CF-C1256D27.0030AED4@nl.ibm.com>
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
Date: Thu May 15 16:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 15, 2003 at 10:51:44AM +0200, Rick van der Linde wrote:
> 
> 
> Hi All!
> 

To cut it short LVM on 4 Disc RAID 5 reduces RAW
throughput about 45% from 33MB/s to 18MB/s :(

> >Has anybody any explanations why the LVM layer eats
> >up about 45% of the available throughput?
> >(in this configuration?)
> 
> <SNIP results>
> 
> I can't yet tell you why, I see same kind of results with 
> RAID 5 on 4 IDE  disks on seperate channels (as master). 
> In my case I use an ATA133 and onboard ATA33 controller. 
> In my case the RAID5 set performs about 50 MB/s and the LVM
> about 18 MB/s. I suspect my ATA controller as bottelneck 

hmm, sounds interesting, especially because you
do not get ~ 27MB/s (55%) but 18MB/s the same as
I got ...

> because my disks which can do 40 MB/s om the ATA133 
> controller suddenly operate at 18 MB/s on the ATA33.
> That made me decide to buy another ATA100/133 controller.
> 
> As I searched internet on this issue I saw some discussion 
> about ext3 in combo with md-raid and lvm. What filesystem 
> did you use on your lvm volume on top of RAID5?

yeah, I read something similar, that was the reason
why I conducted my tests on the raw partitions 
(without any filesystem on top ;)

> What's fun too is when I use ext3 on RAID5 I see a 
> performance of about 48 MB/s.
> When I use reiserfs it reduces too abou 44 MB/s. 
> ext2 shows almost the same results as ext3. 

FYI: at least for ext2/ext3 you should make
sure that the 'stride' (raid options for mke2fs)
matches the block/stripe size of the underlying
RAID configuration ...

> Till now I same same results for ext2, ext3 and reiserfs 
> in my case, however I still suspect my ATA33 channel 
> to be the bottleneck in my case. When I have another
> ATA100/133 controller I'll post new results.

many thanks,
Herbert

> 
> Rick
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
