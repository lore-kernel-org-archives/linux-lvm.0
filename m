Return-Path: <kingjamm@colltech.com>
Date: Fri, 10 Aug 2001 15:12:28 -0500 (CDT)
From: James Mello <kingjamm@colltech.com>
Subject: Re: [linux-lvm] Why can't I get more bandwidth by adding more disks?
In-Reply-To: <Pine.SOL.3.95.1010810144441.29765A-100000@pecos.ncsa.uiuc.edu>
Message-ID: <Pine.GSO.4.21.0108101508220.26612-100000@psasolar.private.psa.pencom.com>
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
To: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>
Cc: linux-lvm@sistina.com

> Hello James
> 
> Thanks for your prompt response. But how can I scatter the I/O
> across the RAID randomly? My rawio code is very simple and the 
> main part is:
> 	buffer_size = 32768;
> 	fd=open("/dev/raw/raw1", O_RDWR);
> 	gettimeofday(&t0,NULL);
> 	for(i=0;i<32768;i++)
> 	   write(fd,begin[i%number_of_buffer],buffer_size);
> 	gettimeofday(&t1,NULL);
>         write_time=(t1.tv_sec-t0.tv_sec)+(t1.tv_usec-t0.tv_usec)*1e-6;
>         bandwidth=1024/write_time;

In this case instead of writing seqentially, you can use an a random call
followed by an fseek to write a block or block(s) to a relatively random
location. If I can get some time, I'll try to write something up. But I'd
venture to say that someone out there has written a tool that already does
this. Perhaps a google search may be in order.

> To my opinion, because every time I write 32KB, LVM should scatter 32K-IO
> across 4 disks automatically. How can the fiber channel be saturated
> by the sequential access? Maybe I have some misunderstanding here.
> Could you give me more hints? Thank you very much!

Depends on the specs of your drives. If you disk can sustain a rate that
is larger than the speed that your FC *controller* can handle, then you're
going to be limited. Also, remember there is a non-trivial overhead
involved with doing the software stripe, doing the scsi protocol stuff,
and finally getting written out to the disk.

	-- Cheers
	-- James
