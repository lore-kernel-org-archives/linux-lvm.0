Message-ID: <3BCE0D78.6D494F80@namesys.com>
Date: Thu, 18 Oct 2001 03:00:08 +0400
From: Hans Reiser <reiser@namesys.com>
MIME-Version: 1.0
References: <20011018000006.A22777@jensbenecke.de>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: [reiserfs-list] Horrid performance with 2.4.{9,10,12} + LVM +
 ReiserFS
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
Content-Type: text/plain; charset="utf-8"
To: Jens Benecke <jens@jensbenecke.de>
Cc: ReiserFS Mailingliste <reiserfs-list@namesys.com>, LVM List <linux-lvm@sistina.com>

All filesystems perform better if kept at 85% of disk capacity or less.

(maybe v4 will improve this by use of a repacker to aggregate the free space
away from stable data, maybe not, we shall see)

ReiserFS will give you about 6-8% more disk space for the same amount of data
for average usage patterns (I don't remember these numbers clearly, don't trust
me on them).

Hans

Jens Benecke wrote:
> 
> Hello,
> 
> this is CC'ed to LVM user list and ReiserFS because I don't know who to
> blame currently. ;)
> 
> I have severe performance problems with a 210G ReiserFS volume sitting on a
> LVM (1.0.1rc4) spread over three disks (Maxtor 60, 80, 80GB IDE). The
> system is a Duron 650MHz with via686b chipset and UDMA-100 capable IDE.
> /proc/cpuinfo, /proc/ide/via output see below. The hardware seems
> performant enough to me.
> 
> The LVM volume is about 97% full (7.5GB free). In ext2 the rule was not to
> use the last 5% of a disk because it would be too slow. But I think this
> should not be a problem for ReiserFS, at least not with such big disks (?).
> If it is, this would waste over 10GB disk space which I don't think is
> acceptable.
> 
> The ReiserFS volume has withstood some difficulties in the past (a LOT of
> crashes due to power outages - the reason for me using ReiserFS in the
> first place), a conversion from 3.5, LVM issues (were fixed though), a data
> loss problem (see list archive) fixed by the pre-reiserfsck - the old one
> segfaulted - and it's under constant attack by FTP, NFS and Samba.
> 
> When I copy a file within the LVM volume, I get 212MB (106 read, 106
> written) in 1:20:
> 
> -rw-rw-r--    1 jens     public   106377216 16. Okt 00:06 www2.avi
> server: /dat# nice -n -19 time cp www2.avi www2.avi_
> 0.04user 2.82system 1:17.39elapsed 3%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (135major+16minor)pagefaults 0swaps
> 
> Strangely, on a 'real' partition this is much faster (this was formatted
> recently and with 3.6 format, though):
> 
> server: /home# nice -n -19 time cp www2.avi www2.avi_
> 0.01user 2.41system 0:27.92elapsed 8%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (135major+16minor)pagefaults 0swaps
> 
> which isn't really _fast_ (28sec for 106MB means 5MB/sec) but it's reading
> and writing to the same disk so it's 10MB/sec.
> 
> during which the harddisk LED is on all the time.
> 
> Currently I'm thinking of backing up the whole volume and reformatting, but
> I wanted to ask what might cause this first because this would be a major
> PITA for many users here.
> 
> ---------------------------------------------------------------------------
> hdparm output for the three disks:
> 
> server: /home# hdparm -tT /dev/hd[abcd]
> /dev/hda:
>  Timing buffer-cache reads:   128 MB in  0.86 seconds =148.84 MB/sec
>  Timing buffered disk reads:  64 MB in  2.12 seconds = 30.19 MB/sec
> /dev/hdc:
>  Timing buffer-cache reads:   128 MB in  0.84 seconds =152.38 MB/sec
>  Timing buffered disk reads:  64 MB in  2.28 seconds = 28.07 MB/sec
> /dev/hdd:
>  Timing buffer-cache reads:   128 MB in  0.86 seconds =148.84 MB/sec
>  Timing buffered disk reads:  64 MB in  2.36 seconds = 27.12 MB/sec
> 
> bonnie++ output for the LVM volume: ---------------------------------------
> Version 1.01d       ------Sequential Output------ --Sequential Input- --Random-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
> server         256M  5596  97 24539  34  6926   7  5194  87 24662  17 115.1 1
>                     ------Sequential Create------ --------Random Create--------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
>                  16  7965  99 +++++ +++ 10546  99  5458  92 +++++ +++  8214 90
> server,256M,5596,97,24539,34,6926,7,5194,87,24662,17,115.1,1,16,7965,99,+++++,++
> ---------------------------------------------------------------------------
> 
> --
> Jens Benecke �������� http://www.hitchhikers.de/ - Europas Mitfahrzentrale
> 
> Crypto regulations will only hinder criminals who obey the law.
