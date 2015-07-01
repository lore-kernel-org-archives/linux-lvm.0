Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t61BtYah032472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 1 Jul 2015 07:55:34 -0400
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mx1.redhat.com (Postfix) with ESMTPS id CE2F52CD854
	for <linux-lvm@redhat.com>; Wed,  1 Jul 2015 11:55:33 +0000 (UTC)
Received: by vnbf129 with SMTP id f129so6093063vnb.5
	for <linux-lvm@redhat.com>; Wed, 01 Jul 2015 04:55:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADxRZqz1ST+hKrYcB2L+pg4n14f0FD8NA8gZj9SUxMzjq1igng@mail.gmail.com>
References: <CAE8gLhnpcpOsoyiO5i6FSX7-5Lo+3fMciJgzrppScFDQAWNEQA@mail.gmail.com>
	<CADxRZqz1ST+hKrYcB2L+pg4n14f0FD8NA8gZj9SUxMzjq1igng@mail.gmail.com>
Date: Wed, 1 Jul 2015 13:55:33 +0200
Message-ID: <CAE8gLhkO84PXU59p9zSXROKS8s4132Qw8N4rqD0-c2HRzuOyjQ@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: Re: [linux-lvm] Difficulties with creating RAID1 LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for trying!

Yeah, I need to look into this... I haven't seen any other systems
where these commands failed, only my vmhost. I'll install another
Vivid on VM and try to reproduce the situation. If only I had time for
this... I can imagine that my snapshot LVs cause the problem again,
even though I find it unlikely.
