Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2NH2hpx002880
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 13:02:44 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.168])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2NH2ar6026096
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 13:02:37 -0400
Received: by ug-out-1314.google.com with SMTP id x30so1073526ugc
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 10:02:36 -0700 (PDT)
Message-ID: <8466e51e0703231002l7af8b064mcfeac23e2d1b6535@mail.gmail.com>
Date: Fri, 23 Mar 2007 18:02:34 +0100
From: "termeau sebastien" <termeau@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_229998_29271394.1174669354874"
Subject: [linux-lvm] extracting EXT3 from VG
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
To: linux-lvm@redhat.com

------=_Part_229998_29271394.1174669354874
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have an hard drive image in a file.
If I try to mount it directly using "mount -o loop my_file.img /mnt/my_dd",
fdisk reports
  mount: unknown filesystem type 'LVM2_member'
This image contains a volume group that itself contains 4 logical vol group.
lvscan reports:
  LogVol00  2.94GB
  LogVol03  64MB
  LogVol02  256MB
  LogVol01  2.31GB

I want to extract the ext3 filesystem included in LogVol00 to a file using
something like:
  dd if=my_file.img bs=512 skip=??? count=??? of=my_ext3.img

How can I determine the skip and count parameter to only extract the ext3
filesystem?

Thanks


-- 
Virtue is its own punishment.
  - Aneurin Bevan

------=_Part_229998_29271394.1174669354874
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,<br><br>I have an hard drive image in a file.<br>If I try to mount it directly using &quot;mount -o loop my_file.img /mnt/my_dd&quot;, fdisk reports <br>&nbsp; mount: unknown filesystem type &#39;LVM2_member&#39;<br>This image contains a volume group that itself contains 4 logical vol group.
<br>lvscan reports:<br>&nbsp; LogVol00&nbsp; 2.94GB<br>&nbsp; LogVol03&nbsp; 64MB<br>&nbsp; LogVol02&nbsp; 256MB<br>&nbsp; LogVol01&nbsp; 2.31GB<br clear="all"><br>I want to extract the ext3 filesystem included in LogVol00 to a file using something like:<br>&nbsp; dd if=my_file.img bs=512 skip=??? count=??? of=my_ext3.img
<br><br>How can I determine the skip and count parameter to only extract the ext3 filesystem?<br><br>Thanks<br><br><br>-- <br>Virtue is its own punishment.<br>&nbsp;&nbsp;- Aneurin Bevan

------=_Part_229998_29271394.1174669354874--
