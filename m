Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r71As2IH025174
	for <linux-lvm@redhat.com>; Thu, 1 Aug 2013 06:54:02 -0400
Received: from arafel.iwakd.de (arafel.iwakd.de [78.46.72.57])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r71As0LU003939
	for <linux-lvm@redhat.com>; Thu, 1 Aug 2013 06:54:01 -0400
Received: from webmail.iwakd.de (localhost [127.0.0.1])
	by arafel.iwakd.de (Postfix) with ESMTP id CE4A540024
	for <linux-lvm@redhat.com>; Thu,  1 Aug 2013 12:53:59 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Aug 2013 11:53:59 +0100
From: Christian Seiler <christian@iwakd.de>
In-Reply-To: <51FA3587.3000801@redhat.com>
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
	<573874159e2a0196c68f44d6b5dc334a@iwakd.de>
	<51F8FEB7.9050004@redhat.com> <51F94911.8080405@iwakd.de>
	<3b25d3821598bb4484b1eb9dde67b3e6@iwakd.de>
	<51FA3587.3000801@redhat.com>
Message-ID: <134aa65ee65a9a90df7d27a04324d61d@iwakd.de>
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hi there,

>> Nevertheless, I think it might be a good idea to still apply my=20
>> patch
>
> Nope. They would mask problems - the code should already handle your
> case at different level.

I would like to submit to you that even though lvremove itself might
not trigger the udev rules that conflict with it, some other program
might by accident at the same, which could still cause problems.

Or, to turn your argument around: if you really think that performing a
retry on the -real device when deactivating is not a good idea, then
conversely one should probably remove the retry logic also from the
main device. (Which btw. appears to work, I couldn't reproduce a
failure if I comment out the same lines in the 'case DEACTIVATE' that
are already there in the current git.)

That said, personally I believe that increasing the robustness of a
piece of software is generally a good thing; not failing unless
absolutely necessary seems to be a sound general policy to me. As for
masking the problem: simply printing a warning message in case of the
retry would be sufficient in my eyes to still notice if the
synchronization logic fails.

On the other hand, my main interest is that it works, which appears to
be the case with current git, so take my 2=C2=A2 or leave them at your
discretion; I'll now start pestering the Debian bugtracker to get the
issue fixed there.

> Anyway - before reporting any udev synchronization problem - always
> check with upstream git and udev rules first - since the Debian
> version is usually significantly changed in this area....

I didn't know that the Debian patches were that invasive, sorry.

Thanks,
Christian
