Return-Path: <xiliu@ncsa.uiuc.edu>
Date: Fri, 10 Aug 2001 15:02:15 -0500 (CDT)
From: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>
Subject: Re: [linux-lvm] Why can't I get more bandwidth by adding more disks?
In-Reply-To: <Pine.GSO.4.21.0108101402530.26612-100000@psasolar.private.psa.pencom.com>
Message-ID: <Pine.SOL.3.95.1010810144441.29765A-100000@pecos.ncsa.uiuc.edu>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Mello <kingjamm@colltech.com>
Cc: linux-lvm@sistina.com

Hello James

Thanks for your prompt response. But how can I scatter the I/O
across the RAID randomly? My rawio code is very simple and the 
main part is:
	buffer_size = 32768;
	fd=open("/dev/raw/raw1", O_RDWR);
	gettimeofday(&t0,NULL);
	for(i=0;i<32768;i++)
	   write(fd,begin[i%number_of_buffer],buffer_size);
	gettimeofday(&t1,NULL);
        write_time=(t1.tv_sec-t0.tv_sec)+(t1.tv_usec-t0.tv_usec)*1e-6;
        bandwidth=1024/write_time;
To my opinion, because every time I write 32KB, LVM should scatter 32K-IO
across 4 disks automatically. How can the fiber channel be saturated
by the sequential access? Maybe I have some misunderstanding here.
Could you give me more hints? Thank you very much!


Xiang
On Fri, 10 Aug 2001, James Mello wrote:

> You've probably saturated the SCSI bus the disks are connected too. With
> the newer disks, they are fully capable of flooding a bus with sequential
> access. 
> 
> On a side note, a more useful test would be to take those same disks and
> scatter the I/O across the RAID set randomly. This way you should see
> nearly linear scaling of the bandwidth (depending on the block size of
> your disk).
> 
> 	-- Cheers
> 	-- James
> 
> On Fri, 10 Aug 2001, Xiaoxiang Liu wrote:
> 
> > I have tried to upgrade LVM to beta8 on kernel 2.4.7 and it
> > works well. Then I am trying to do some raw io test to see
> > how much bandwidth I can get. My machine is HP kayak and connected
> > with a MTI RAID by fiber channel.
> > 
> > If I do sequence rawio on one scsi disk in MTI, the bandwidth is 14MB/s.
> > Then I create a LV on two disks with striping size 4k, the bandwidth
> > becomes 28MB/s and I really feel excited for this result. :)
> > But when I create LV on more disks (3,4,5 or 8 disks), the bandwidth
> > can't increase any more. I always get 28MB/s or less. I do 1G-byte sequence 
> > rawio and my buffer size is 32k. The maximum bandwidth of fiber channel is
> > 100MB/s and we could actually get 75MB/s in other tests.
> >  
> > I don't know what's the bottleneck here? If I create LV on 4 disks with
> > striping size 4K and do 32k rawio, does and how LVM do parallel io on
> > those 4 disks? Why can't I increase the bandwidth by 4 times? 
> > Please help me! Your suggestions will be highly appreciated!
> > 
> > 
> > Xiang
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
