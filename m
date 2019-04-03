Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A772600D4
	for <linux-lvm@redhat.com>; Wed,  3 Apr 2019 01:40:42 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2E3C308FBA0
	for <linux-lvm@redhat.com>; Wed,  3 Apr 2019 01:40:40 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id A33B720702
	for <linux-lvm@redhat.com>; Tue,  2 Apr 2019 21:40:39 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <23716.3863.42782.886096@quad.stoffel.home>
Date: Tue, 2 Apr 2019 21:40:39 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <819376bf-9ee7-b700-6057-6e8035c0e0e8@gmail.com>
References: <819376bf-9ee7-b700-6057-6e8035c0e0e8@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM RAID10 busy 100%
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


Viacheslav> I made LVM RAID10 from 8 HDDs with size 8T on CentOS 7 server.

Viacheslav> # lvs -a -o name,segtype,devices
Viacheslav>  � LV��������������������� Type Devices
Viacheslav>  � data������������������� raid10 
Viacheslav> data_rimage_0(0),data_rimage_1(0),data_rimage_2(0),data_rimage_3(0),data_rimage_4(0),data_rimage_5(0),data_rimage_6(0),data_rimage_7(0)
Viacheslav>  � [data_rimage_0]�������� linear /dev/sda(1)
Viacheslav>  � [data_rimage_1]�������� linear /dev/sdb(1)
Viacheslav>  � [data_rimage_2]�������� linear /dev/sdc(1)
Viacheslav>  � [data_rimage_3]�������� linear /dev/sde(1)
Viacheslav>  � [data_rimage_4]�������� linear /dev/sdf(1)
Viacheslav>  � [data_rimage_5]�������� linear /dev/sdg(1)
Viacheslav>  � [data_rimage_6]�������� linear /dev/sdk(1)
Viacheslav>  � [data_rimage_7]�������� linear /dev/sdl(1)
Viacheslav>  � [data_rmeta_0]��������� linear /dev/sda(0)
Viacheslav>  � [data_rmeta_1]��������� linear /dev/sdb(0)
Viacheslav>  � [data_rmeta_2]��������� linear /dev/sdc(0)
Viacheslav>  � [data_rmeta_3]��������� linear /dev/sde(0)
Viacheslav>  � [data_rmeta_4]��������� linear /dev/sdf(0)
Viacheslav>  � [data_rmeta_5]��������� linear /dev/sdg(0)
Viacheslav>  � [data_rmeta_6]��������� linear /dev/sdk(0)
Viacheslav>  � [data_rmeta_7]��������� linear /dev/sdl(0)

Viacheslav> # rpm -qa | grep lvm2
Viacheslav> lvm2-2.02.180-10.el7_6.3.x86_64
Viacheslav> lvm2-libs-2.02.180-10.el7_6.3.x86_64

Viacheslav> Use XFS with external logdev.

Viacheslav> # xfs_info /data
Viacheslav> meta-data=/dev/mapper/vg_data-data isize=512��� agcount=32, 
Viacheslav> agsize=219769456 blks
Viacheslav>  � � � �� ����� =���������������������� sectsz=4096� attr=2, projid32bit=1
Viacheslav>  �� � � � �� �� =���������������������� crc=1������� finobt=0 spinodes=0
Viacheslav> data��� � � =���������������������� bsize=4096 blocks=7032622592, imaxpct=5
Viacheslav>  � � ������ � � =���������������������� sunit=16���� swidth=128 blks
Viacheslav> naming�� =version 2������������� bsize=4096�� ascii-ci=0 ftype=1
Viacheslav> log���� � �� =external�������������� bsize=4096�� blocks=262144, version=2
Viacheslav>  �� �� ��� � �� =���������������������� sectsz=512�� sunit=0 blks, 
Viacheslav> lazy-count=1
Viacheslav> realtime =none������������������ extsz=4096�� blocks=0, rtextents=0

Viacheslav> But when I try to write ~100Mbit data (video files) to this LV, I see in 
Viacheslav> iostat 100% busy for LV, but HDDs not. It confuses me. This is normal? 
Viacheslav> Or is there really a problem?

Viacheslav> # iostat -xk 5 /dev/vg_data/data /dev/sd{a,b,c,e,f,g,k,l}
Viacheslav> Linux 3.10.0-957.5.1.el7.x86_64 (streamer)������ 02.04.2019 
Viacheslav> _x86_64_������� (32 CPU)

Viacheslav> avg-cpu:� %user�� %nice %system %iowait� %steal�� %idle
Viacheslav>  ���������� 1,40��� 0,00��� 0,81��� 4,20��� 0,00�� 93,59

Viacheslav> Device:�������� rrqm/s�� wrqm/s���� r/s���� w/s��� rkB/s��� wkB/s 
Viacheslav> avgrq-sz avgqu-sz�� await r_await w_await� svctm� %util
Viacheslav> sda������������� 46,43��� 49,70�� 75,98�� 28,03� 7810,41 4156,71�� 
Viacheslav> 230,12���� 1,12�� 10,73��� 9,28�� 14,65�� 2,83� 29,48
Viacheslav> sdc������������� 45,32��� 49,60�� 75,75�� 28,49� 7726,38 4158,48�� 
Viacheslav> 228,03���� 0,77��� 7,40��� 9,32��� 2,28�� 2,77� 28,86
Viacheslav> sdb������������� 77,96�� 112,76�� 41,87�� 48,58� 7651,46 9504,77�� 
Viacheslav> 379,35���� 2,66�� 29,40�� 96,08�� 63,75�� 4,98� 45,05
Viacheslav> sdg������������� 69,15�� 112,11�� 49,06�� 49,32� 7549,31 9506,47�� 
Viacheslav> 346,72���� 2,12�� 21,60�� 78,58�� 55,36�� 4,48� 44,07
Viacheslav> sdl������������� 69,30��� 99,51�� 52,89�� 46,86� 7799,80 8549,16�� 
Viacheslav> 327,79���� 1,53�� 15,35�� 64,68�� 54,86�� 4,29� 42,83
Viacheslav> sdf������������� 42,19��� 49,96�� 75,11�� 27,89� 7488,68 4157,53�� 
Viacheslav> 226,13���� 1,47�� 14,28��� 9,55�� 27,01�� 2,87� 29,61
Viacheslav> sde������������� 81,86�� 112,55�� 38,41�� 48,27� 7679,43 9452,76�� 
Viacheslav> 395,29���� 2,94�� 33,96� 106,24�� 68,86�� 5,23� 45,30
Viacheslav> sdk������������� 50,95��� 49,86�� 70,30�� 27,96� 7738,02 4157,36�� 
Viacheslav> 242,12���� 1,32�� 13,47�� 11,77�� 17,75�� 3,03� 29,81
Viacheslav> dm-16������������ 0,00���� 0,00��� 3,54� 187,67�� 153,35 11187,18�� 
Viacheslav> 118,62���� 0,72��� 3,60�� 91,29��� 1,94�� 2,20� 42,03

Viacheslav> avg-cpu:� %user�� %nice %system %iowait� %steal�� %idle
Viacheslav>  ���������� 2,11��� 0,00��� 0,77��� 5,36��� 0,00�� 91,76

Viacheslav> Device:�������� rrqm/s�� wrqm/s���� r/s���� w/s��� rkB/s��� wkB/s 
Viacheslav> avgrq-sz avgqu-sz�� await r_await w_await� svctm� %util
Viacheslav> sda�������������� 3,40��� 31,20��� 1,80�� 29,80�� 306,40 2405,60�� 
Viacheslav> 171,65���� 2,63�� 83,38��� 2,00�� 88,30� 12,80� 40,46
Viacheslav> sdc�������������� 2,80��� 32,20��� 1,40�� 30,80�� 256,00 2425,60�� 
Viacheslav> 166,56���� 4,37� 135,65�� 69,71� 138,65� 13,55� 43,62
Viacheslav> sdb�������������� 0,80��� 31,20��� 0,40�� 31,40��� 50,40 2408,80�� 
Viacheslav> 154,67���� 4,90� 193,65� 109,50� 194,72� 17,18� 54,62
Viacheslav> sdg�������������� 1,20��� 31,60��� 0,40�� 23,80�� 102,40 2424,00�� 
Viacheslav> 208,79���� 1,62�� 46,68�� 30,00�� 46,96� 11,68� 28,26
Viacheslav> sdl�������������� 2,00��� 31,60��� 1,00�� 31,60�� 152,80 2424,00�� 
Viacheslav> 158,09���� 2,57� 117,57�� 41,40� 119,98� 11,43� 37,26
Viacheslav> sdf�������������� 2,20��� 31,60��� 2,00�� 28,20�� 255,20 2432,80�� 
Viacheslav> 178,01���� 1,88�� 62,09�� 26,90�� 64,59� 10,46� 31,60
Viacheslav> sde�������������� 0,80��� 32,00��� 1,00�� 26,60�� 101,60 2416,80�� 
Viacheslav> 182,49���� 2,19�� 61,46�� 80,40�� 60,74� 15,02� 41,46
Viacheslav> sdk�������������� 2,60��� 31,60��� 1,20�� 30,00�� 204,00 2420,80�� 
Viacheslav> 168,26���� 1,37�� 43,83� 114,00�� 41,03�� 9,95� 31,04
Viacheslav> dm-16������������ 0,00���� 0,00�� 25,00� 165,00� 1428,80 8962,40�� 
Viacheslav> 109,38�� 281,67 1771,52�� 56,13 2031,43�� 5,26 100,00

Viacheslav> avg-cpu:� %user�� %nice %system %iowait� %steal�� %idle
Viacheslav>  ���������� 2,22��� 0,00��� 0,75��� 2,73��� 0,00�� 94,30

Viacheslav> Device:�������� rrqm/s�� wrqm/s���� r/s���� w/s��� rkB/s��� wkB/s 
Viacheslav> avgrq-sz avgqu-sz�� await r_await w_await� svctm� %util
Viacheslav> sda�������������� 2,60��� 30,20��� 1,20�� 22,00�� 206,40 2272,80�� 
Viacheslav> 213,72���� 1,33�� 57,37�� 13,33�� 59,77� 16,97� 39,38
Viacheslav> sdc�������������� 2,40��� 29,80��� 0,80�� 18,80�� 204,80 2248,80�� 
Viacheslav> 250,37���� 1,39�� 71,09�� 22,00�� 73,18� 24,79� 48,58
Viacheslav> sdb�������������� 0,00��� 30,20��� 0,00�� 26,40���� 0,00 2281,60�� 
Viacheslav> 172,85���� 2,22� 102,58��� 0,00� 102,58� 14,18� 37,44
Viacheslav> sdg�������������� 0,00��� 29,80��� 0,00�� 25,80���� 0,00 2261,60�� 
Viacheslav> 175,32���� 1,92�� 88,72��� 0,00�� 88,72� 16,98� 43,80
Viacheslav> sdl�������������� 0,00��� 29,80��� 0,00�� 27,40���� 0,00 2270,40�� 
Viacheslav> 165,72���� 1,61�� 76,81��� 0,00�� 76,81� 18,00� 49,32
Viacheslav> sdf�������������� 2,60��� 29,80��� 1,20�� 21,80�� 205,60 2253,60�� 
Viacheslav> 213,84���� 0,89�� 38,50��� 7,50�� 40,20� 13,70� 31,52
Viacheslav> sde�������������� 0,00��� 29,80��� 0,00�� 23,20���� 0,00 2257,60�� 
Viacheslav> 194,62���� 2,59� 132,94��� 0,00� 132,94� 18,57� 43,08
Viacheslav> sdk�������������� 2,60��� 29,80��� 1,00�� 23,00�� 204,00 2261,60�� 
Viacheslav> 205,47���� 1,08�� 44,94��� 5,20�� 46,67� 15,70� 37,68
Viacheslav> dm-16������������ 0,00���� 0,00�� 14,40� 115,80�� 820,80 6167,20�� 
Viacheslav> 107,34�� 114,27 1256,38�� 11,31 1411,21�� 7,68 100,02

Viacheslav> avg-cpu:� %user�� %nice %system %iowait� %steal�� %idle
Viacheslav>  ���������� 2,04��� 0,00��� 0,85��� 4,41��� 0,00�� 92,70

Viacheslav> Device:�������� rrqm/s�� wrqm/s���� r/s���� w/s��� rkB/s��� wkB/s 
Viacheslav> avgrq-sz avgqu-sz�� await r_await w_await� svctm� %util
Viacheslav> sda�������������� 3,60��� 31,80��� 1,20�� 28,20�� 255,20 2404,80�� 
Viacheslav> 180,95���� 1,82�� 61,93� 167,33�� 57,45� 15,81� 46,48
Viacheslav> sdc�������������� 5,60��� 33,20��� 2,00�� 28,40�� 460,80 2415,20�� 
Viacheslav> 189,21���� 1,55�� 51,10�� 73,90�� 49,49� 14,06� 42,74
Viacheslav> sdb�������������� 3,00��� 31,60��� 1,40�� 28,40�� 256,00 2404,80�� 
Viacheslav> 178,58���� 3,35� 112,38� 119,00� 112,05� 17,01� 50,70
Viacheslav> sdg�������������� 3,00��� 32,00��� 1,20�� 31,20�� 255,20 2403,20�� 
Viacheslav> 164,10���� 2,15�� 70,27� 187,83�� 65,75� 12,09� 39,16
Viacheslav> sdl�������������� 1,00��� 32,20��� 0,60�� 28,80�� 101,60 2396,80�� 
Viacheslav> 169,96���� 2,30�� 78,39�� 12,33�� 79,76�� 9,52� 28,00
Viacheslav> sdf�������������� 3,00��� 32,00��� 1,40�� 30,80�� 262,40 2402,40�� 
Viacheslav> 165,52���� 2,92�� 90,71� 107,00�� 89,97� 15,53� 50,02
Viacheslav> sde�������������� 0,60��� 33,20��� 0,20�� 27,60��� 51,20 2413,60�� 
Viacheslav> 177,32���� 1,68�� 50,91�� 19,00�� 51,14� 13,02� 36,20
Viacheslav> sdk�������������� 5,20��� 32,20��� 2,00�� 28,80�� 411,20 2396,80�� 
Viacheslav> 182,34���� 2,04�� 66,21� 121,40�� 62,38� 13,56� 41,76
Viacheslav> dm-16������������ 0,00���� 0,00�� 35,00�� 72,20� 2053,60 3369,60�� 
Viacheslav> 101,18�� 124,74 1218,62� 119,80 1751,29�� 9,33 100,00


I suspect you're running into LVM being single threaded.  But it's
hard to tell how you built the device.  Can you please do:

  lvdisplay -a data/data

and also give us the exact command you used to build your LVM volume
and the xfs filesystem ontop of it.  Also, what is your CPU like and
your SATA controller?

I'd probably re-do the RAID using RAID4 (fixed parity disk) since
you're (probably) just doing a bunch of writing of video files, which
are large streaming writes, so you won't pay the penalty of the
Reade/Modify/Write cycle that RAID4/5 has with lots of small files
being writteing.  But I'd also be using MD under-neath LVM, with XFS on
top.  Something like this:

  1.   partition each disk with a single whole disk partition
  2.   mdadm --create /dev/md0 --level=raid4 --raid-devices=8 /dev/sd[a,b,c,e,f,g,k,l]1
  3.   pvcreate /dev/md0
  4.   vgcreate data /dev/md0
  5.   lvcreate -L +12T -n data data
  6.   mkfs.xfs /dev/mapper/data-data

And then see how the performance is then.

John
