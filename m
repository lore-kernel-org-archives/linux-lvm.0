Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k893JvIY000528
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 23:19:57 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.239])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k893JmBd030700
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 23:19:49 -0400
Received: by wx-out-0506.google.com with SMTP id i30so1430352wxd
	for <linux-lvm@redhat.com>; Fri, 08 Sep 2006 20:19:48 -0700 (PDT)
Message-ID: <5b0681910609082019p4e0d9a36xf62f374eba4a201b@mail.gmail.com>
Date: Fri, 8 Sep 2006 23:19:48 -0400
From: "Pradeep Kilambi" <superprad@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_148286_21291366.1157771988423"
Subject: [linux-lvm] resize an lvm partition
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

------=_Part_148286_21291366.1157771988423
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK I have a FC5 install on a full primary lym( not extended partition). I
would ike to resize this(/dev/hda2) to shrink a little to install something
else. Whats the best way to resize an lvm partition. Also my filesystem says
unknow filesystem type. I tried using parted and GParted but none of these
worked.

partition filesystem size used unused flags
/dev/hda1 ext3 101.35MB 44.97MB 56.98MB boot
/dev/hda2 unknown 74.43GB --- --- lvm

any help appreciated.

Thanks.

------=_Part_148286_21291366.1157771988423
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK I have a FC5 install on a full primary lym( not extended partition). I would ike to resize this(/dev/hda2) to shrink a little to install something else. Whats the best way to resize an lvm partition. Also my filesystem says unknow filesystem type. I tried using parted and GParted but none of these worked.
<br><br>
partition filesystem size used unused flags<br>
/dev/hda1 ext3 101.35MB 44.97MB 56.98MB boot<br>
/dev/hda2 unknown 74.43GB --- --- lvm<br><br>any help appreciated.<br><br>Thanks.<br> 

------=_Part_148286_21291366.1157771988423--
