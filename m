Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3TD6D9m031656
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 09:06:13 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.29])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3TD615s021944
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 09:06:01 -0400
Received: by yw-out-2324.google.com with SMTP id 2so1181291ywt.81
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 06:05:47 -0700 (PDT)
Message-ID: <3120c9e30804290605w774b8bc4s68265a9cc74843e9@mail.gmail.com>
Date: Tue, 29 Apr 2008 18:35:47 +0530
From: "=?UTF-8?Q?=E0=A4=85=E0=A4=A8=E0=A5=81=E0=A4=9C_Anuj_Singh?="
	<anujhere@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_5626_30269540.1209474347675"
Subject: [linux-lvm] Linux LVM performance using multiple iSCSI targets
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

------=_Part_5626_30269540.1209474347675
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I have a LVM performance related question.
Issue:
We have multiple iscsi-target machines say iscsi-target1, iscsi-target2,
iscsi-target3, iscsi-target4,....iscsi-targetN imported on iSCSI-initiator
Machine (FileServer).


I used lvm and created a logical volume say MyBigStorage on FileServer using
/dev/sda1, /dev/sda2, /dev/sda3..../dev/sdaN as physical disks (these are
the raw disks exported from iscsi-target machines).

Question:
1. Is it going to take more time if a client machine looks for a file which
is on FileServer's LVM MyBigStorage, as my LVM is created using multiple raw
disks using iscsi-targets.

2. What would be impact over performance (file lookup) in case we increase
more iscsi-target machines, and expand our MyBigStorage lvm using newly
attached iscsi-target disks?

3. The file system we are going to use is GFS or ext3 and the overall data
is between 4TB to 8TB.

4. Any other issue which you can suggest with above approach?

Thanks and Regards
Anuj Singh.

------=_Part_5626_30269540.1209474347675
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br>I have a LVM performance related question.<br>Issue:<br>We have multiple iscsi-target machines say iscsi-target1, iscsi-target2, iscsi-target3, iscsi-target4,....iscsi-targetN imported on iSCSI-initiator Machine (FileServer).<br>
<br><br>I used lvm and created a logical volume say MyBigStorage on FileServer using /dev/sda1, /dev/sda2, /dev/sda3..../dev/sdaN as physical disks (these are the raw disks exported from iscsi-target machines). <br><br>Question:<br>
1. Is it going to take more time if a client machine looks for a file which is on FileServer&#39;s LVM MyBigStorage, as my LVM is created using multiple raw disks using iscsi-targets.<br><br>2. What would be impact over performance (file lookup) in case we increase more iscsi-target machines, and expand our MyBigStorage lvm using newly attached iscsi-target disks?<br>
<br>3. The file system we are going to use is GFS or ext3 and the overall data is between 4TB to 8TB. <br><br>4. Any other issue which you can suggest with above approach? <br><br>Thanks and Regards<br>Anuj Singh.<br>

------=_Part_5626_30269540.1209474347675--
