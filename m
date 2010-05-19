Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGcHJs020444
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:38:17 -0400
Received: from mail-yw0-f197.google.com (mail-yw0-f197.google.com
	[209.85.211.197])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGc7Zp018205
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:38:07 -0400
Received: by ywh35 with SMTP id 35so2722092ywh.24
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 09:38:06 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com> <20100519162601.GA18162@us.ibm.com>
In-Reply-To: <20100519162601.GA18162@us.ibm.com>
Date: Wed, 19 May 2010 12:37:54 -0400
Message-ID: <05c901caf771$a3161920$e9424b60$@com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>


>If I were you, I would not bother with partition(s). I will add the
>whole disk to LVM.


I intend for the entire disk to be used -- so I should just skip the fdisk
step?



Thanks,


Kevin
http://blog.stardothosting.com
