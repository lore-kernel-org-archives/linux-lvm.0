From: Petro <petro@auctionwatch.com>
Message-ID: <20030312195217.GC18876@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Problems and questions with LVM on a large raid system.
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
Date: Wed Mar 12 13:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've got a couple of brand new boxes I'm trying to get LVM set up
properly on. 

These machines have 6 200GiB drives attached to a 3ware controller card,
for a total of 1,200,000,000,000 bytes of storage. 

I'm running kernel 2.4.18, with LVM version 1.0.3, and the lvmtools
version 1.0.1rc3-1 (long story, but upgrading is a path-of-last-resort).

Initially I had the drives set up as a single raid0 device, but doing a
pvcreate on it failed with a message that said something about "can't
get size". 

So I set up 2 3 disk RAID0 devices, and did a vgcreate /dev/sda /dev/sdb.

Now, one question I have is: 

    Does this concatenate the devices, or does it interleave the
    devices? IE do I have a stripe of stripes, or two stripes? 

Since I need the disk write rate of all 6 drives, I'm *REALLY* hoping
that it's interleaved. 



-- 
"On two occasions, I have been asked [by members of Parliament], 'Pray, 
Mr. Babbage, if you put into the machine wrong figures, will the right 
answers come out?' I am not able to rightly apprehend the kind of confusion 
of ideas that could provoke such a question." -- Charles Babbage 
