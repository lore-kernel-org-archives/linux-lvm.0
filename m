Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JHABwf029900
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:10:11 -0400
Received: from mail-gx0-f216.google.com (mail-gx0-f216.google.com
	[209.85.217.216])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JH9xFd025137
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:10:00 -0400
Received: by gxk8 with SMTP id 8so4207959gxk.9
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 10:09:56 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<20100519162601.GA18162@us.ibm.com>	<05c901caf771$a3161920$e9424b60$@com>
	<Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
	<4BF41884.4080000@alteeve.com>
In-Reply-To: <4BF41884.4080000@alteeve.com>
Date: Wed, 19 May 2010 13:09:48 -0400
Message-ID: <05d201caf776$17abb110$47031330$@com>
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

One last thing I want to confirm is the lvextend command to 'grow' the
logical volume :


lvextend -L+144G /dev/VolGroup00/my_volume 

After all said steps in previous messages on this thread are complete, is
the above command correct for my particular scenario? Do I want to 'extend'
the volume size or 'grow' it?

Not sure what the difference is.


~k
