Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8OG5TQ3031953
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 12:05:29 -0400
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8OG5SxA004658
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 12:05:28 -0400
Received: by mail-yh0-f45.google.com with SMTP id i72so2020460yha.4
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 09:05:28 -0700 (PDT)
Message-ID: <5241B845.4060102@gmail.com>
Date: Tue, 24 Sep 2013 12:05:25 -0400
From: =?ISO-8859-2?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
	<alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
	<5241B520.6080408@gmail.com>
In-Reply-To: <5241B520.6080408@gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

On 09/24/2013 11:52 AM, Jorge F=EF=BF=BDbregas wrote:
>  I can't recreate the original problem when I opened the bug (fstrim repo=
rting
>  always 124 MiB).  I'm not sure if any update had to do anything with it.

Arrrgh.  Please discard my last email (with my sample run). I totaly
forgot that I had "discard" as a mount option in /etc/fstab (I did this
as fstrim wasn't properly working).  I'll remove the option now and will
perform the tests again.
