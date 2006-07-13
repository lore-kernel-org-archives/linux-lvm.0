Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHJld3027219
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:19:47 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.170])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6DHJfbt032755
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:19:41 -0400
Received: by ug-out-1314.google.com with SMTP id h2so388428ugf
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 10:19:40 -0700 (PDT)
Message-ID: <ea6edd6d0607131019uba8823bg2fcff0520825a96@mail.gmail.com>
Date: Thu, 13 Jul 2006 14:19:40 -0300
From: "Leonardo Elias" <leo.elias@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_21034_19618824.1152811180611"
Subject: [linux-lvm] Growing a striped+concat vol
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

------=_Part_21034_19618824.1152811180611
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello there,
        i have a volume which was created as a stripe ( 4 columns ) + 6
concat and now i have to grow it with +8 new disks. The idea is to make 2
new 4 columns stripe and grow the concat... but somehow LVM2 only let me
grow the volume with 1 column concat.
        Is it a LVM limitation ? If yes, is there any workaround ?

Thanks,
Leo

------=_Part_21034_19618824.1152811180611
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello there,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i have a volume which was created as a stripe ( 4 columns ) + 6 concat and now i have to grow it with +8 new disks. The idea is to make 2 new 4 columns stripe and grow the concat... but somehow LVM2 only let me grow the volume with 1 column concat. 
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is it a LVM limitation ? If yes, is there any workaround ?<br><br>Thanks,<br>Leo<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>

------=_Part_21034_19618824.1152811180611--
