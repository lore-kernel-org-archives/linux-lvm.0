Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6ILFMV18801
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 17:15:22 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.194])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6ILFLOO030993
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 17:15:21 -0400
Received: by wproxy.gmail.com with SMTP id i32so1077296wra
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 14:15:08 -0700 (PDT)
Message-ID: <e27bf7770507181413460f25a7@mail.gmail.com>
Date: Mon, 18 Jul 2005 14:13:58 -0700
From: "Gino LV. Ledesma" <gledesma@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2 on md raid
Reply-To: "Gino LV. Ledesma" <gledesma@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi, everyone

Has anyone else ran into a bug with LVM2 on md raid (snapshots causing
corruption to the source fs)? There's a bug report on redhat's site[1]
and I'd like to help look into it. I'm not sure if this is an LVM
issue or an md RAID issue but I'm stumped as to how to get started
with investigating. Neither the kernel nor the system as a whole spits
out odd messages on my part.

Appreciate any help.

- gino ledesma

[1] https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=152162
