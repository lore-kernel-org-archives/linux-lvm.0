Return-Path: <james@fr.clara.net>
Date: Mon, 5 Feb 2001 12:16:51 +0100 (CET)
From: James <james@fr.clara.net>
Message-ID: <Pine.LNX.4.21.0102051213590.432-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Subject: [linux-lvm] lv extend
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

Hello

Is it normal after growing an LV not to see the change with df -h ? But it
can be seen with vgdisplay -v ?

james@munster:~$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             4.6G  1.5G  2.9G  33% /
/dev/lvdev/home       984M  322M  613M  35% /home
/dev/lvdev/var        984M   91M  843M  10% /var
/dev/lvdev/usr        984M  485M  450M  52% /usr


I added half a gig to /usr ??

--- Logical volume ---
LV Name                /dev/lvdev/usr
VG Name                lvdev
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                1.46 GB
Current LE             375
Allocated LE           375
Allocation             next free
Read ahead sectors     120
Block device           58:1

Thanks
