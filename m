Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 Beta 6 available@
 www.sistina.com
In-reply-to: Your message of Tue, 13 Mar 2001 01:21:36 +0000.
             <20010313012136.A10157@sistina.com> 
Mime-Version: 1.0
Date: Fri, 16 Mar 2001 13:45:07 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14duXV-0006Vi-00@whittlesey.cl.cam.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Using devfs, I still get `part1' rather than ide/host0/bus0/target0/lun0/part1
With multiple disks, this is somewhat unhelpful.

[[Also, it's a shame that there are so many spaces, making lines > 80 chars]]

[ Is there a version for easy parsing by perl scripts ? ]

worsdell:~: cat /proc/lvm/global 
LVM driver version 0.9.1_beta6 (12/03/2001)

Total:  1 VG  2 PVs  3 LVs (3 LVs open 3 times)

Global: 7275 bytes malloced   IOP version: 10   0:03:02 active

VG:  vg01  [2 PV, 3 LV/3 open]  PE Size: 4096 KB
  Usage [KB/PE]: 1593344 /389 total  516096 /126 used  1077248 /263 free
  PVs: [AA] part1                  1044480 /255       516096 /126       528384 
/129
       [AA] part6                   548864 /134            0 /0         548864 
/134
    LVs: [AWDL  ] tmp                         106496 /26       1x open
         [AWDL  ] repl                        307200 /75       1x open
         [AWDL  ] scratch                     102400 /25       1x open
worsdell:~: 
