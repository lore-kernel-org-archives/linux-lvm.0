Return-Path: <kingjamm@colltech.com>
Date: Fri, 10 Aug 2001 14:04:51 -0500 (CDT)
From: James Mello <kingjamm@colltech.com>
Subject: Re: [linux-lvm] Why can't I get more bandwidth by adding more disks?
In-Reply-To: <Pine.SOL.3.95.1010810115414.25220A-100000@pecos.ncsa.uiuc.edu>
Message-ID: <Pine.GSO.4.21.0108101402530.26612-100000@psasolar.private.psa.pencom.com>
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
To: linux-lvm@sistina.com
Cc: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>

You've probably saturated the SCSI bus the disks are connected too. With
the newer disks, they are fully capable of flooding a bus with sequential
access. 

On a side note, a more useful test would be to take those same disks and
scatter the I/O across the RAID set randomly. This way you should see
nearly linear scaling of the bandwidth (depending on the block size of
your disk).

	-- Cheers
	-- James

On Fri, 10 Aug 2001, Xiaoxiang Liu wrote:

> I have tried to upgrade LVM to beta8 on kernel 2.4.7 and it
> works well. Then I am trying to do some raw io test to see
> how much bandwidth I can get. My machine is HP kayak and connected
> with a MTI RAID by fiber channel.
> 
> If I do sequence rawio on one scsi disk in MTI, the bandwidth is 14MB/s.
> Then I create a LV on two disks with striping size 4k, the bandwidth
> becomes 28MB/s and I really feel excited for this result. :)
> But when I create LV on more disks (3,4,5 or 8 disks), the bandwidth
> can't increase any more. I always get 28MB/s or less. I do 1G-byte sequence 
> rawio and my buffer size is 32k. The maximum bandwidth of fiber channel is
> 100MB/s and we could actually get 75MB/s in other tests.
>  
> I don't know what's the bottleneck here? If I create LV on 4 disks with
> striping size 4K and do 32k rawio, does and how LVM do parallel io on
> those 4 disks? Why can't I increase the bandwidth by 4 times? 
> Please help me! Your suggestions will be highly appreciated!
> 
> 
> Xiang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
