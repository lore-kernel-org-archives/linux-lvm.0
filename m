Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8CIpn0U022167
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 14:51:49 -0400
Received: from rn-out-0910.google.com (rn-out-0910.google.com [64.233.170.189])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8CIpA1I026512
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 14:51:36 -0400
Received: by rn-out-0910.google.com with SMTP id k32so777069rnd.7
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 11:51:10 -0700 (PDT)
Message-ID: <3d847d110809121151r611783cet8d9b24f6534aaeff@mail.gmail.com>
Date: Fri, 12 Sep 2008 20:51:10 +0200
From: hanocri <hanocri@gmail.com>
Subject: Re: [linux-lvm] Recovering LVM partition after OS reinstallation
In-Reply-To: <48CA9D5F.8090502@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <3d847d110809120248r796de032u29b08d41278c6299@mail.gmail.com>
	<48CA9D5F.8090502@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2008/9/12 Jaroslav Stava <jstava@redhat.com>:
>
> Check dmraid. Twice.
>
> If *scan can't find a lvm pv, than there is something wrong.
> (unless you are filtering out /dev/dm* - check filter= in lvm.conf)
>
> Did you (or the Debian installation) change the partition layout?
> Where did you install the system to? I assume not to the old
> "lvroot" logical volume.
>
> Partition type (fdisk) means quite nothing.
> If the device/partition is a lvm PV, then there should be an lvm
> label at the beginning. That's what vgscan is looking for (see -vvv).
> If there is no label at the beginning, then:
> - we are looking at the wrong place - partition layout changed or
>  perhaps dmraid changed it's mapping
> - we are looking at the correct place, but the label is not there
>
> You could try looking for the label at other places - man pvck.
>
> Either way provide some info:
> "lvmdump -m -a" can automate that
> or at least post dmsetup table, vgscan -vvv
> dmraid information
>
> Regards,
> Jaroslav Stava
>

Sorry, I made a terrible mistake!
After your suggestions I've dumped (using dd) some first sectors of
/dev/dm-6 to check what is in header and I noticed LUKS label.
I totally forgot that whole partition was encrypted (it used to be
unlocked by external keyfile). So I unlocked partition first and after
that activated LVM.
All volumes are here, healthy and intact.

About "lvroot" volume - it was never in use. I planned to install
other distribution here, but I never did.
Root filesystem is on non-lvm partition.

Again sorry for this stupid mistake and thank you for your help.

-- 
Regards, Grzegorz R.
