Message-ID: <1034915787.3daf8fcb66a42@mail.dornquast.com>
From: Nathan Dornquast <Nathan@Aberon.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
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
Date: Thu Oct 17 23:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thx, Goetz.

Very good suggestions.  They mostly point out what I suspected, that I will not 
have much luck getting the built in Promise RAID chips to work with LVM.

I am actually running without the PROMISE PDC202{46|62|65|67|68|69|70} 
support.  Some of the How-to's I've come accross say to include it, but when I 
do, I can not boot off the ATA-Raid.

I spent some time with the Promise drivers... they are released for RH 7.2/3, I 
haven't been successful at getting them to install on my Debian 3.0 box.  

I have tried other Promise Controllers (Fasttrak 100 & TX200) - but cannot get 
them to post - disabling built in Promise PDC202675 RAID or switching it to 
UDMA doesn't help.

Tried the Highpoint 404 raid card - not impressed.  Plus, they do not have 
RAID1 support in the kernel - 2.4.19 - only 0.

3ware 7500-4 is on order. ;)  Sadly it adds $260 to box.  

Goetz, I am interested to hear your MD RAID 1/5 - particularly how it handles 
powering off a drive while operating.  Does your box spit, sputter and puke, or 
can you hotswap?  How about with the 3ware card?  Which 3ware card are you 
working with?

I know this RAID info is off-topic.  Feel free to email me directly @ 
nathan@aberon.net.  

Many thanks,

-Nate

..........
Nathan Dornquast
Aberon Technologies, Inc.
2205 California St NE - Suite 003
Minneapolis, MN 55418
w.612.789.9446
c.612.386.6519
..........
