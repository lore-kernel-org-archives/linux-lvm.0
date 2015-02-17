Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1HKxsPg004227
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 15:59:54 -0500
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1HKxpYI027073
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 15:59:52 -0500
Received: by mail-wg0-f45.google.com with SMTP id k14so35529068wgh.4
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 12:59:51 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Feb 2015 21:59:50 +0100
Message-ID: <CADoUXWt9nPP6QfBCbK2o5JvXrJVZtYNR8O=PUf=fYxD_3fduZw@mail.gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvscan returns - WARNING: Unrecognised segment type
	thick
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hello to all the list' members

I'm here writing because I've already seen the warning in subject, but
with last word "thin",

many LVs were inactive, no problem, in that case, installing the
needed thin provisioning module, was fixing the issue, and the needed
LVs got activated.

But here I have a never seen before last word "thick", so
WARNING: Unrecognized segment type thick
so no way to activate an inactive LV. At the begin lvscan was
returning both the warnings
WARNING: Unrecognized segment type thin
WARNING: Unrecognized segment type thick

I've installed as usual the thin provisioning module and all but one
the LVs got active... except but one ( needed one , obviously :-) ).

So the situation is
#lvscan
WARNING: Unrecognized segment type thick

and only one LV inactive, need to activate it

So... what to do?

Do you know about this?=E2=80=8E Looks like that logical volume can't be
activated because of that thick warning.

Also they are totally missing some VGs and LVs on this storage and so,
thank you if you can link a safe procedure to try to restore a
slightly corrupted LVM2. Is there any sort of fsck like procedure that
could scan LVM2 metadata and try to pull out/restore as many VGs and
LVs as possible?
Thank you for any appreciated link

Thank you in advance for any hint

Cor
