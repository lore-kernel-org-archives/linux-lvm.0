Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9A8U2f4029499
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 04:30:02 -0400
Received: from web92206.mail.cnh.yahoo.com (web92206.mail.cnh.yahoo.com
	[203.209.250.119])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m9A8Tkfs030664
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 04:29:48 -0400
Date: Fri, 10 Oct 2008 16:29:45 +0800 (CST)
From: Ben Huang <ben_devel@yahoo.cn>
Subject: =?gb2312?q?=BB=D8=B8=B4=A3=BA=20Re:=20[linux-lvm]=20device-mapper=20may?=
	=?gb2312?q?=20have=20read=20performance=20issue?=
In-Reply-To: <alpine.LNX.1.10.0810091047140.19362@bernoulli.globalphasing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <701452.25518.qm@web92206.mail.cnh.yahoo.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

--- Peter Keller <pkeller@globalphasing.com>д��:

> Hi all,
> 
> On Wed, 8 Oct 2008, thomas62186218@aol.com wrote:
> 
> > Ben,
> >
> > I have seen this same issue as well. I have
> created an md device capable of 
> > 425MB/sec using the hdparm -t command, yet an LVM
> volume fully comprising 
> > this md device only got about 150MB/sec. I am not
> sure what the issue is. I 
> > am running Ubuntu Hardy 804 server edition,
> 64-bit.
> >
> > -Thomas
> 
> I have fixed this kind of problem by tweaking the
> readahead of the LVM 
> volume using 'blockdev --setra' and/or 'blockdev
> --setfra'.

It make effect


blockdev --setra 65536 /dev/md0
blockdev --setra 65536 /dev/mapper/DG5-lv1

dd if=/dev/md0 of=/dev/null bs=1M
353185562624 bytes (353 GB) copied, 420.033 s, 841
MB/s

dd if=/dev/mapper/DG5-lv1 of=/dev/null bs=1M
155551006720 bytes (156 GB) copied, 216.576 s, 718
MB/s

Warm regards,
-Ben


      ___________________________________________________________ 
 �Ż����䣬�����������䣡 
http://cn.mail.yahoo.com/
