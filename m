Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAO21DuC013728
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 21:01:13 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAO21B95000734
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 21:01:12 -0500
Received: by ug-out-1314.google.com with SMTP id 30so588350ugs
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 18:01:11 -0800 (PST)
Message-ID: <5485940d0611231801o6391e2ccmcd827c7d2f44c5a5@mail.gmail.com>
Date: Fri, 24 Nov 2006 02:01:10 +0000
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] how to extend an lvm partition?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I just got curious, if I migrate the data from a lun to another one
which is bigger, with poor man's ghost such as 'dd if=sda of=sdb', how
am I going to be able to extend the lvm partition afterwards? is this
possible? I know I could add a new partition in the remaining space,
pvcreate/vgextend it into the existing VG, but are there other
alternatives?

Thanks
