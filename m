From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Message-ID: <Pine.LNX.4.44.0309181458190.31164-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] lvm config on disk?
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
Date: Thu Sep 18 15:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

Hi,

We have lvm-1.0.3-4 running on RH Linux 7.3 (2.4.20-20.7smp). Hardware 
is a Dell PE4600 with a PERC3 RAID controller. This is our department 
fileserver. We want to move to RH Enterprise ES Basic, but I have some 
questions first:

1) Which lvm is built into the Enterprise kernel? lvm1 or lvm2?

2) Does LVM config stay on disk? What I mean is this: we have just one LV 
on our RH 7.3 system. It is 500GB and on a RAID 5 array. That LV has an 
ext3 filesystem on it. If I blow away the 7.3 system, and install 
Enterprise onto that same partition, will Enterprise LVM be able to 
recognize the LV on the RAID 5 array? OR is that just not possible. I'm 
thinking that's not possible - that the system keeps functional info 
about the volume that is NOT on the disk. We have tape backup, but I'd 
rather not do a restore of 400GB if I don't have to. 

3) We want to keep LVM because we will need to expand that filesystem over 
another RAID 5 array in the future. Has anyone had any experience 
expanding an LV over two *hardware* RAID 5 arrays? It should work because 
the system has no idea the RAID even exists, but I'm just curious if 
anyone else has done it and knows it works well.

3) We've had great exp with LVM so far. We've had to lvextend twice, both 
times it worked flawlessly. The only drag is we have to umount the volume. 
Any chance that sistina will be able to extend lv's while the volume is 
mounted? All other major unix's have that (AIX, HP, IRIX, etc). It's about 
time Linux does that by default, and help out the 24-7-365 folks.

Any advice is greatly appreciated, and thanks in advance.

Alex
---                                                               ---
   Alex Lazarevich | Systems Administrator | Imaging Technology Group
            Beckman Institute - University of Illinois
       alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                               ---
