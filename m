Return-Path: <xiliu@ncsa.uiuc.edu>
Date: Tue, 21 Aug 2001 16:22:21 -0500 (CDT)
From: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>
In-Reply-To: <200108211204.f7LC4PE20043@ex1.ncsa.uiuc.edu>
Message-ID: <Pine.SOL.3.95.1010821133502.6920A-100000@pecos.ncsa.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] What's the correct way to do raw I/O on Linux?
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

Since my last post "Why can't I get more bandwidth by adding more disks?",
I have tried to work out some rawio benchmarking code. I am very
happy to see that the bottleneck is not LVM because I tried iozone on LVM
and the performance is good. But I must know about the low-level
performance so that I still need to face the raw I/O problem.

My steps for raw I/O are:
1. Bind /dev/raw/raw1 with one block device or one LV
2. Open the raw device by using open()
3. read or write the raw device by using read() or write()

At the beginning, I just used sequential I/O and got the problem described
in my previous post: I can't get more bandwidth even I build LV on 8 scsi
disks. Later based on James' suggestions, I tried random I/O on that
MTI RAID with 12 scsi disks but still got the same problem: 4.5MB/s for
one disk and 5.5MB/s for LV on 4 or more disks. I also tried to run 2
processes at the same time but the result was same. It sounds like the
pipe is full for some reasons but I can't figure it out.:(

So I just wonder maybe I didn't make raw I/O correctly. Should I use
open(), read() and write()? Or there are other low-level function calls?
I know some rawio benchmark tools such as iometer for NT and Greg's rawio
for FreeBSD but there is none for Linux. By using iometer I can get 75MB/s
for the same MTI RAID. 

Sorry for the long post and thanks for your patience to read it. I'll
appreciate it if you can give me any suggestions. 


Xiaoxiang  
