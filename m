From: Robert Macaulay <robert_macaulay@dell.com>
Message-ID: <Pine.LNX.4.33.0110252342580.23688-100000@ping.us.dell.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM read performance bad
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
Date: Thu Oct 25 23:49:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have been running some tests on LVM on 2.4.9-6 kernel from redhat, 
1.0.1rc4. I have created a test volume, 64k stripe size, 26 stripes, 9Gig 
size, 8Gig RAM.

Here is the odd part. I am using iozone to benchmark the disks. I start a 
9Gig file test. The write gets about 56MB/sec, the re-write gets 68MB/sec, 
and the read get a whopping 13MB/sec. 

This seems completely backward to me. I'm not subscribed to lvm-devel, but 
a similar question has come up there under the topic, [lvm-devel] stripe 
performance (read_ahead vs. max_readahead) omn the 15th of October.

Can anyone shed any light on this? The PV's are mirrored Fiber Channel 
disks. All separate disks. I've tried different FC drivers with the same 
results. We're about to run some Oracle tests, I was just checking the 
relative speeds.

Is there any more information I can provide to help speed this up? 

Thanks
Robert
