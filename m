Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Date: Sat, 26 May 2001 14:35:45 +0200
MIME-Version: 1.0
Message-Id: <01052614354500.00527@notch>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Test of LVM
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
To: linux-lvm@sistina.com

Hi,

I have two disks in one Logical Volume, and all "Partitions" in the LV are 
striped over the disks, the two disks are both:
Maxtor 5T0T2H2 with 20 GB a piece, when I do 
hdparm -t /dev/hda (or hdb) gives ~36MB/sec

Now I would like to know, how to test if my LVM is performing as it should, 
could you please tell me what to do, and how to interprete the nubers I get ?
I think it will not as simple as saying 36 + 36 = 72MB/sec, but it should be 
somewhere there, shouldn`t it ?

thanks in advance
pwk
