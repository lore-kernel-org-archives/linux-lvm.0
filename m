Return-Path: <gene_yee@hotmail.com>
From: "hail narcissus" <gene_yee@hotmail.com>
Date: Mon, 16 Apr 2001 14:50:07 -0700
Mime-Version: 1.0
Message-ID: <F29e4wk2UfxhUIBSIeS000025b8@hotmail.com>
Subject: [linux-lvm] Removal of PV
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I know this has been asked before and I browsed the archives for the info.  
But I want to be sure since I am dealing with 500+GB of data.

Here is my configuration:
hda-h (80Gig IDE's)
sda-n (9Gig SCSI's)
652.81 GB VG
505GB Used 140GB Free

I want to remove the SCSI drives since I am having some SCSI bus problems 
and they are just old and I am not feeling comfortable with it's 
reliability.

I believe this would be the proper steps:

resize2fs /dev/lv/vg 520G  <-- Is 520G correct, particularly the G.
pvmove /dev/sda /dev/hdh   <-- Assuming /dev/hdh has free space
pvmove /dev/sdb /dev/hdh
pvmove /dev/sdc /dev/hdh
...
lvreduce -L 520G /dev/lv/vg
vgreduce vg /dev/sda
vgreduce vg /dev/sdb
vgreduce vg /dev/sdc

I saw in the mailing list where someone suggested:

ext2resize/resize2fs
lvreduce
pvmove
vgreduce

But I would think you would want to do pvmove before the lvreduce.  
Otherwise you might truncate data?

Thanks for any help!!
_________________________________________________________________
Get your FREE download of MSN Explorer@http://explorer.msn.com
