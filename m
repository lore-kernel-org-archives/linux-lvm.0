Date: Thu, 9 Mar 2000 21:35:28 +0200 (SAST)
From: Bruce Hewitson <hewitson@egs.uct.ac.za>
Subject: [linux-lvm] 12 disks -- new problems ....
Message-ID: <Pine.LNX.4.10.10003092129410.22470-100000@tie.egs.uct.ac.za>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Many thanks for the pointers to the major numbers -- I have modified
MAKEDEV and created/fdisk'ed the devices, and can make ext2 partitions all
the way to hdp.

However, I wonder if anybody else has used 12 disks -- now I find that
while I can make ext2 partitions up to /dev/hdp, neither pvcreate nor
hdparm will see anything beyond /dev/hdl, ie - I can't get lvm to
work with /dev/hd[m-p].

Is there a hard coded limit in both lvm and perhaps hdparm? 

Any help much appreciated

 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | Assoc. Prof. Bruce C. Hewitson                  Ph: +27 21 650 2878 |
 | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
 | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
 |      hewitson@egs.uct.ac.za       http://www.egs.uct.ac.za/csag     |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
