Message-ID: <3FC47B24.DBE8143@groupe-ips.com>
From: Jean Marie =?iso-8859-1?Q?Ari=E8s?= <jeanmarie.aries@groupe-ips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Newbie to LVM
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
Date: Wed Nov 26 08:57:17 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi,

LVM seems to be a good choice for split a linux box hdd. I would like to
use this for a database/file server (samba), running under SuSE Linux
8.0 PRO.
I have 2 disks of 73 Go, in RAID 1.

Here is the LVM partition I've created :

linux:/ # lvscan
lvscan -- ACTIVE            "/dev/vg/mysql" [10 GB]
lvscan -- ACTIVE            "/dev/vg/index" [4 GB]
lvscan -- ACTIVE            "/dev/vg/data" [15 GB]
lvscan -- ACTIVE            "/dev/vg/share" [29.35 GB]
lvscan -- 4 logical volumes with 58.35 GB total in 1 volume group
lvscan -- 4 active logical volumes

LV are mounted with ReiserFS :

/dev/vg/mysql --> /mysql
/dev/vg/index --> /index
/dev/vg/data --> /data
/dev/vg/share --> /share

All of the LV are shared with samba.


I have some questions :

1. I can write 4.3 GB of data for my XP station to the /index share. The
LV is 4 GB ?????

2. What is exactly the extent value ? (default 4MB).

3. What is the best value of this parameter for database ? and a file
server ?


Thanks in advance for your response.


--
Sinc�rement,

Jean Marie Ari�s
