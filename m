Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBFIBqr17885
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 13:11:52 -0500
Received: from mr2.schneider.com (mr2.schneider.com [161.222.161.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBFIBkqa016233
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 13:11:46 -0500
Received: from mm2.schneider.com (mm2.schneider.com [161.222.1.66])
	by mr2.schneider.com (8.12.10+Sun/8.12.10) with ESMTP id iBFIBjn1014432
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 12:11:46 -0600 (CST)
Message-ID: <OF18FEB14B.36F3D16B-ON86256F6B.00629DBA-86256F6B.0063EE24@schneider.com>
From: AdabalaP@schneider.com
Date: Wed, 15 Dec 2004 12:11:30 -0600
MIME-Version: 1.0
Subject: [linux-lvm] How to increase/decrease space
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello all,
I am running FC3, with LVM2 installed. I have the following partition
table:

hda1        /boot             100 meg     10% used

LVM:

hda2        VolGrp00          4.6 gb

/           VolGrp00/LogVol00 450 meg     35% used
/usr        VolGrp00/LogVol04 1.9 gb            92% used
/usr/local  VolGrp00/LogVol05 128 meg     25% used
/home       VolGrp00/LogVol03 128 meg     60% used
/opt        VolGrp00/LogVol02 128 meg     35% used
/var        VolGrp00/LogVol07 450 meg     30 % used
swap        VolGrp00/LogVol01 64 meg


(1) Added more space (350 meg) to /usr using the command "lvresize -L+350".
When i display the volume group using "lvdisplay" it shows 2.3 gb, But when
i use "df -m" it is still at 1.9 gb and 92% used state.

(2) Initially i had swap space to be 385 meg, i reduced the volume group to
64 meg using the same command, Now i don't even see my swap space by using
"free" command.

How do get my desired results ? I also want to reduce the "/" volume by
50%, How do i do it ?

Thanks.
