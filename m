Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1SHu2eG030742
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 12:56:02 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1SHu1VP007159
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 12:56:01 -0500
Received: by eekc41 with SMTP id c41so1286358eek.33
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 09:56:00 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 28 Feb 2012 11:56:00 -0600
Message-ID: <CANiW5cF9c1j+NWC7mwjcBBJEyg800a+wdTH05+Ufv94=W0A-4Q@mail.gmail.com>
From: John Anthony <chirayithaj@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd250729607c804ba09f00b
Subject: [linux-lvm] avgrq-sz maxes out at 1024 for lvm devices
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

--000e0cd250729607c804ba09f00b
Content-Type: text/plain; charset=ISO-8859-1

All:

Doing a test to identify the best stipe / block sizes for high end SAN
storage.

The test involves setting up LVM raw devices of stripe sizes 128K and
beyond - and using dd with block sizes of 128K and beyond.

Issue is :-
Beyond block sizes of 512 K (1024 sectos) - the avgrq-sz does not increase
as reported by iostat -x. As if there is a limit. Is this an LVM imposed
limit - dm imposed - or even more generic ?

leading upto 1024 sectors avgrq-sz - increases with block size as expected.

Where is the limit ? Is it configurable ?

-JAC

--000e0cd250729607c804ba09f00b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

All:<div><br></div><div>Doing a test to identify the best stipe / block siz=
es for high end SAN storage.</div><div><br></div><div>The test involves set=
ting up LVM raw devices of stripe sizes 128K and beyond - and using dd with=
 block sizes of 128K and beyond.</div>
<div><br></div><div>Issue is :-</div><div>Beyond block sizes of 512 K (1024=
 sectos) - the avgrq-sz does not increase as reported by iostat -x. As if t=
here is a limit. Is this an LVM imposed limit - dm imposed - or even more g=
eneric ?</div>
<div><br></div><div>leading upto 1024 sectors avgrq-sz - increases with blo=
ck size as expected.</div><div><br></div><div>Where is the limit ? Is it co=
nfigurable ?</div><div><br></div><div>-JAC</div>

--000e0cd250729607c804ba09f00b--
