Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGA4Yv012269
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:10:04 -0400
Received: from mail-qy0-f198.google.com (mail-qy0-f198.google.com
	[209.85.221.198])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JG9sU8013093
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:09:54 -0400
Received: by qyk36 with SMTP id 36so5016322qyk.19
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 09:09:53 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com>
In-Reply-To: <4BF40A8B.2000201@alteeve.com>
Date: Wed, 19 May 2010 12:09:46 -0400
Message-ID: <05bd01caf76d$b45892c0$1d09b840$@com>
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
To: 'Digimer' <linux@alteeve.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>


>The mkfs isn't supposed to be there, just set the new drive's partition 
>to type '8e' (Linux LVM).

Thanks for the quick response. So to recap, for a 144gb drive (/dev/sda1) :

1. fdisk /dev/sda1 type 8e

2. pvcreate /dev/sda1

3. vgextend existing_group_name /dev/sda1

4. lvextend -L+144G /dev/VolGroup00/existing_group_name



Does that look correct?


Thanks so much once again,


Kevin 
http://blog.stardothosting.com
