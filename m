Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0Q99gLD008832
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 04:09:43 -0500
Received: from bonito.ulb.ac.be (bonito.ulb.ac.be [164.15.59.220])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0Q99eG3011037
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 04:09:41 -0500
Received: from [10.0.0.5] (bebif01.ulb.ac.be [164.15.125.4])
	by bonito.ulb.ac.be (Postfix) with ESMTP id E4C2E48E
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 10:09:34 +0100 (CET)
Message-ID: <45B9C8BF.3080101@ulb.ac.be>
Date: Fri, 26 Jan 2007 10:24:15 +0100
From: Julien Cigar <jcigar@ulb.ac.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] partition resizing
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I have to resize two partitions of one of our servers. As I've always 
used LVM for personal usage until now, I want to be sure that I will not 
make any mistakes.

We have an hardware RAID 5 array with LVM2 on top. The OS is Linux of 
course (Debian) with a 2.6.15 kernel.

Here is the current situation :

/dev/mapper/vg0-home on /home type ext3 (rw)
/dev/mapper/vg0-srv on /srv type ext3 (rw)
/dev/mapper/vg0-tmp on /tmp type ext3 (rw,nosuid,nodev)
/dev/mapper/vg0-var on /var type ext3 (rw)

What I want to do is to reduce /home from 50G and extend /srv of 50G.
Are the following operations safe for this ? :

#> umount /srv
#> umount /home
#> resize2fs /dev/mapper/vg0-home 50G
#> lvreduce -L-50G /dev/mapper/vg0-home
#> lvextend -L+50G /dev/mapper/vg0-srv
#> resize2fs /dev/mapper/vg0-srv
#> mount /home
#> mount /srv

Another question I wondered is : what's the difference between 
lvreduce/lvextend and lvresize ?

In advance thanks,
Julien

-- 
Julien Cigar
Belgian Biodiversity Platform
http://www.biodiversity.be
Universit� Libre de Bruxelles
Campus de la Plaine CP 257
B�timent NO, Bureau 4 N4 115C (Niveau 4)
Boulevard du Triomphe, entr�e ULB 2
B-1050 Bruxelles
office: jcigar@ulb.ac.be
