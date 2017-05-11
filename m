Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3264017B80
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:05:38 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C52080E7B
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:05:36 +0000 (UTC)
References: <23c510c6-8a15-7f7c-bcf5-1f72b5dca994@mglug.de>
	<6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
From: Oliver Rath <rath@mglug.de>
Message-ID: <4888d916-29b3-df5b-41ca-9a191dc39e22@mglug.de>
Date: Thu, 11 May 2017 12:05:34 +0200
MIME-Version: 1.0
In-Reply-To: <6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] configure fail with option --enable-notivy-dbus
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Marian,


On 11.05.2017 09:43, Marian Csontos wrote:
> On 05/11/2017 09:01 AM, Oliver Rath wrote:
[..]
> ################################################################################
> 
> AC_CHECK_LIB(m, log10,
>         [M_LIBS="-lm"], hard_bailout)
> 
> 
> 
> This is because of missing log10 function from m library (wherever that
> comes from) and has nothing to do with dbus. So enabling or disabling it
> should have absolutely no effect.

Ok, that helps. I figured out, that libm is part of libc6, libc6-dev is
installed and has a include file called tgmath.h

$ grep -iR "define log10" /usr/include/
/usr/include/tgmath.h:# define log10(Val) __TGMATH_UNARY_REAL_IMAG (Val,
log10, __clog10)
/usr/include/tgmath.h:# define log10(Val) __TGMATH_UNARY_REAL_ONLY (Val,
log10)
[..]

So it seems all needed files are installed. But the message still remains.

> 
> Were you configuring lvm2 on the same machine using the same environment?

Yes. At the moment. If you neede further information, just let me know!


Regards,
Oliver
