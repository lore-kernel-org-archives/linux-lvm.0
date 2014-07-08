Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s689uWls005449
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2014 05:56:32 -0400
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s689uUcC024116
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2014 05:56:31 -0400
Received: by mail-la0-f41.google.com with SMTP id hz20so3789673lab.14
	for <linux-lvm@redhat.com>; Tue, 08 Jul 2014 02:56:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 8 Jul 2014 19:56:30 +1000
Message-ID: <CAAWpFTHEnzeC_K5WGwbUjaw8JE54AF8NAbfnQkHF0k=PysS=rw@mail.gmail.com>
From: Alfredo De Luca <alfredo.deluca@gmail.com>
Subject: [linux-lvm] lvm2 conf on boot disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

Hi all.
I have red hat 5.7 with no lvm2 installed. Now I want to configure
lvm2 on the root and swap partition then later on adding a couple of
LUNs to create a VG
What's the best practice/procedure to install lvm2 on the boot disk?
Is it possible? I guess I have to run Linux CD in rescue mode

Regards


-- 
Alfredo
