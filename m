Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2CD6091D
	for <linux-lvm@redhat.com>; Thu, 17 May 2018 00:08:33 +0000 (UTC)
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48EC735C83B
	for <linux-lvm@redhat.com>; Thu, 17 May 2018 00:08:22 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id j186-v6so6665068ita.5
	for <linux-lvm@redhat.com>; Wed, 16 May 2018 17:08:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+2BD2dXAMqgt3agf6FVhuqMMXDCfC+ALy2sHezP=1h-f52Spw@mail.gmail.com>
References: <CA+2BD2e3HVBo_7TuS9dY7TUpuNn=uf_YAnJF_dBKGr2M0n6rWg@mail.gmail.com>
	<CA+2BD2dXAMqgt3agf6FVhuqMMXDCfC+ALy2sHezP=1h-f52Spw@mail.gmail.com>
From: Patrick Mitchell <patricklmitchell9@gmail.com>
Date: Wed, 16 May 2018 20:08:20 -0400
Message-ID: <CA+2BD2eiEx35ZzZpE-ZBnCEb0NYc7ymMQUbCc8ECexovTa06Og@mail.gmail.com>
Subject: Re: [linux-lvm] pvscan takes 45-90 minutes booting off ISO with
	thin pools
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

On Wed, May 16, 2018 at 8:03 PM, Patrick Mitchell
<patricklmitchell9@gmail.com> wrote:
> Changing the ISO's lvm.conf, setting "activation = 0" in global makes
> it boot very quickly.  I can then manually run a single "pvscan
> --cache --activate ay" to activat everything, and it just takes a few
> seconds.  So, I'm thinking this has to be a locking problem with
> trying to activate so many logical volumes and thin pools
> simultaneously.

(Manually running pvscan after modifying lvm.conf to set activation back to 1.)
