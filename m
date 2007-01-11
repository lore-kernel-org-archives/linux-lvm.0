Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0BCn59Y013748
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 07:49:05 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.230])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BCn4nE016907
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 07:49:04 -0500
Received: by wr-out-0506.google.com with SMTP id 37so312499wra
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 04:49:04 -0800 (PST)
Message-ID: <ebe74ab10701110449k3b5ee6ccw3e41a85dfbdca4a0@mail.gmail.com>
Date: Thu, 11 Jan 2007 14:49:02 +0200
From: "Yalusa Jongihlati" <yjongihlati@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_23357_31132729.1168519742988"
Subject: [linux-lvm] A question about deleting partitions - LVM related
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

------=_Part_23357_31132729.1168519742988
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have a drive partitioned like this


   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1       30401   244196001    5  Extended
/dev/sda5   *           1        2611    20972794+  83  Linux
/dev/sda6            2612        5222    20972826   83  Linux
/dev/sda7            5223        7180    15727603+  83  Linux
/dev/sda8            7181        9138    15727603+  83  Linux
/dev/sda9            9139       11096    15727603+  83  Linux
/dev/sda10          11097       13054    15727603+  83  Linux
/dev/sda11          13055       16971    31463271    7  HPFS/NTFS
/dev/sda12          16972       22192    41937651   8e  Linux LVM
/dev/sda13          22193       26108    31455238+  8e  Linux LVM
/dev/sda14          26109       30401    34483491   8e  Linux LVM


I was quite ambitious at the time about how many distros I would load. I now
want to basically kill partitions sda6 to sda11 and repartition that space
differently. Instead of the 6 partitions I will have fewer.

My concern is that this will change the partition numbers of the partitions
currently 12, 13 and 14. As can be seen these currently form part of LVM
partitions. If the partition numbers change eg sda12 to sda10, my concern is
whether LVM will adjust accordingly? Or is there a command I will have to
run once I have re-partitioned? The LVM partitions are all reiserfs.

------=_Part_23357_31132729.1168519742988
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have a drive partitioned like this<br><br><br>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30401&nbsp;&nbsp; 244196001&nbsp;&nbsp;&nbsp; 5&nbsp; Extended<br>/dev/sda5&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2611&nbsp;&nbsp;&nbsp; 20972794+&nbsp; 83&nbsp; Linux
<br>/dev/sda6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2612&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5222&nbsp;&nbsp;&nbsp; 20972826&nbsp;&nbsp; 83&nbsp; Linux<br>/dev/sda7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5223&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7180&nbsp;&nbsp;&nbsp; 15727603+&nbsp; 83&nbsp; Linux<br>/dev/sda8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7181&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9138&nbsp;&nbsp;&nbsp; 15727603+&nbsp; 83&nbsp; Linux<br>/dev/sda9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9139&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11096&nbsp;&nbsp;&nbsp; 15727603+&nbsp; 83&nbsp; Linux
<br>/dev/sda10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11097&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13054&nbsp;&nbsp;&nbsp; 15727603+&nbsp; 83&nbsp; Linux<br>/dev/sda11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13055&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16971&nbsp;&nbsp;&nbsp; 31463271&nbsp;&nbsp;&nbsp; 7&nbsp; HPFS/NTFS<br>/dev/sda12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16972&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22192&nbsp;&nbsp;&nbsp; 41937651&nbsp;&nbsp; 8e&nbsp; Linux LVM<br>/dev/sda13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22193&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26108&nbsp;&nbsp;&nbsp; 31455238+&nbsp; 8e&nbsp; Linux LVM
<br>/dev/sda14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30401&nbsp;&nbsp;&nbsp; 34483491&nbsp;&nbsp; 8e&nbsp; Linux LVM<br><br><br>I was quite ambitious at the time about how many distros I would load. I now want to basically kill partitions sda6 to sda11 and repartition that space differently. Instead of the 6 partitions I will have fewer. 
<br><br>My concern is that this will change the partition numbers of the partitions currently 12, 13 and 14. As can be seen these currently form part of LVM partitions. If the partition numbers change eg sda12 to sda10, my concern is whether LVM will adjust accordingly? Or is there a command I will have to run once I have re-partitioned? The LVM partitions are all reiserfs.

------=_Part_23357_31132729.1168519742988--
