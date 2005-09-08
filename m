Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j88AVeV13188
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2005 06:31:40 -0400
Received: from xiii.metz (fbxmetz.linbox.com [81.56.128.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j88AVVgs011969
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2005 06:31:31 -0400
Received: from [192.168.0.4] (helo=[192.168.0.4] ident=ludo)
	by xiii.metz with esmtp (Exim 3.36 #1 (Debian)) id 1EDJgm-0005YC-00
	for <linux-lvm@redhat.com>; Thu, 08 Sep 2005 12:31:28 +0200
Message-ID: <432012FF.9080602@linbox.com>
Date: Thu, 08 Sep 2005 12:31:27 +0200
From: Ludovic Drolez <ldrolez@linbox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2/DM data corruption during write with 2.6.11.12
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi !

We are developing a (GPLed) disk cloning software similar to partimage: it's an
intelligent 'dd' which backups only used sectors. Project info and SVN available 
at http://lrs.linbox.org

Recently I added LVM1/2 support to it, and sometimes we saw LVM restorations
failing randomly (Disk images from RHES are not corrupted, but the result of the
restoration can be lead to a corrupted filesystem). If a restoration fails, just
try another one and it will work...

How the restoration program works:
- I restore the LVM2 administrative data (384 sectors, most of the time),
- I 'vgscan', 'vgchange',
- open for writing the '/dev/dm-xxxx',
- read a compressed file over NFS,
- and put the sectors in place, so it's a succession of '_llseek()' and
'write()' to the DM device.

But, *sometimes*, for example, the current seek position is at 9GB, and some
data is written to sector 0 ! It happens randomly.

Here is a typical strace of a restoration:

write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
_llseek(5, 20963328, [37604032512], SEEK_CUR) = 0
_llseek(5, 0, [37604032512], SEEK_CUR)  = 0
_llseek(5, 2097152, [37606129664], SEEK_CUR) = 0
write(5, "\1\335E\0\f\0\1\2.\0\0\0\2\0\0\0\364\17\2\2..\0\0\0\0\0"..., 512) = 51
2
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
write(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512
_llseek(5, 88076288, [37694210048], SEEK_CUR) = 0
_llseek(5, 0, [37694210048], SEEK_CUR)  = 0
_llseek(5, 20971520, [37715181568], SEEK_CUR) = 0
write(5, "\377\377\377\377\377\377\377\377\377\377\377\377\377\377"..., 512) = 5
12
....
....

As you can see, there are no seeks to sector 0, but something randomly write
some data to sector 0 !
I could reproduce these random problems on different kind of PCs.

But, the strace above comes from an improved version, which aggregates
'_llseek's. A previous version, which did *many* 512 bytes seeks had much more
problems. Aggregating seeks made the corruption to appears very rarely... And I
more likely to happen, for a 40GB restoration than for a 10GB one.

So less system calls to the DM/LVM2 layer seems to give less corruption probability.


Any ideas ? Newer kernel releases could have fixed such a problem ?


-- 
Ludovic DROLEZ                              Linbox / Free&ALter Soft
www.linbox.com www.linbox.org
