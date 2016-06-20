Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5KL3VWf012736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 17:03:31 -0400
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1445E85545
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 21:03:30 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id f75so3802702ywb.3
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 14:03:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5768578E.2010608@windriver.com>
References: <5768578E.2010608@windriver.com>
From: Ilya Boka <bokailya@gmail.com>
Date: Mon, 20 Jun 2016 23:03:29 +0200
Message-ID: <CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>
Subject: Re: [linux-lvm] what creates the symlinks in /dev/<volgroup> ?
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

Command vgmknodes

On Mon, Jun 20, 2016 at 10:52 PM, Chris Friesen
<chris.friesen@windriver.com> wrote:
> Hi,
>
> Can someone tell me what creates the /dev/<volgroup>/<volume symlinks?  Is
> this LVM or udev (and if udev, do you know which rule)?
>
> I'm seeing some interesting behaviour where if I create a thin pool it
> creates a symlink for the pool, but once I create a thin volume within the
> pool then the pool symlink disappears.
>
> Thanks,
> Chris
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
