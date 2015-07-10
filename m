Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6AJKfOd015304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 15:20:41 -0400
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mx1.redhat.com (Postfix) with ESMTPS id 2CCAB2E6DAA
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 19:20:40 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so23239562wid.1
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 12:20:38 -0700 (PDT)
MIME-Version: 1.0
From: Dax Kelson <dkelson@gurulabs.com>
Date: Fri, 10 Jul 2015 13:20:19 -0600
Message-ID: <CAFDa5Q230vOkWMvDdtKDCJsrXrd8LGpq2oD5QZZg+6HsrbC_=w@mail.gmail.com>
Content-Type: multipart/alternative; boundary=f46d043c7e2662fe6f051a8a44a2
Subject: [linux-lvm] Can I use one CachePoolLV with multiple Origin LVs?
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
To: linux-lvm@redhat.com

--f46d043c7e2662fe6f051a8a44a2
Content-Type: text/plain; charset=UTF-8

Couple questions about LVM Caching

First question.

I have a couple SSDs in a hardware RAID 1 as /dev/sdb

I'd like to use them to speed up with write-back cache a couple LVs that
reside on /dev/sda.

Can I use one CachePoolLV with multiple Origin (slow) LVs?

Second question.

If I grow the size of sda can I run pvresize on it and and the add the
space to the slow LVs in an online fashion?

Thanks,
Dax kelson

--f46d043c7e2662fe6f051a8a44a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Couple questions about LVM Caching</div><div><br></di=
v><div>First question.</div><div><br></div>I have a couple SSDs in a hardwa=
re RAID 1 as /dev/sdb<div><br></div><div>I&#39;d like to use them to speed =
up with write-back cache a couple LVs that reside on /dev/sda.</div><div><b=
r></div><div>Can I use one CachePoolLV with multiple Origin (slow) LVs?</di=
v><div><br></div><div>Second question.</div><div><br></div><div>If I grow t=
he size of sda can I run pvresize on it and and the add the space to the sl=
ow LVs in an online fashion?</div><div><br></div><div>Thanks,</div><div>Dax=
 kelson</div></div>

--f46d043c7e2662fe6f051a8a44a2--
