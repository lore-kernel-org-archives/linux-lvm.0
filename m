Date: Fri, 1 Sep 2000 13:47:08 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] Re: lvm.h kernel/userspace differences
Message-ID: <20000901134708.A6408@gondor.com>
References: <20000829203239.A1030@gondor.com> <200009010540.XAA04818@lynx.turbolabs.com> <20000901132936.A3526@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000901132936.A3526@gondor.com>; from jan@gondor.com on Fri, Sep 01, 2000 at 01:29:36PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

> - kernel's lv_v2_t has an additional field "uint8_t __unused;" _in the middle_
>   of the struct. Huh. What's that?

Additional information:

It's been included in linux-2.3.99-pre9 or -pre10. The patch was proposed by
Andrea Arcangeli in a mail to linux-kernel on Apr 5. He writes:

> o       inserts a pad in the lv_t structure to avoid breaking the
>         binary tools interface. I think everybody prefers to lose
>         32 bit per logical volume in the system than having to
>         change binary tools while switching between 2.2.x and 2.3.x
>         to make snapshotting to work :).
