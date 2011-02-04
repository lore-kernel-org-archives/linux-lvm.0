Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p14GLJrf023852
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2011 11:21:19 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p14GL8nZ005688
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2011 11:21:09 -0500
Received: by eye27 with SMTP id 27so1304570eye.33
	for <linux-lvm@redhat.com>; Fri, 04 Feb 2011 08:21:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110204155403.GD1535@redhat.com>
References: <4D4C0933.80107@redhat.com>
	<20110204155403.GD1535@redhat.com>
Date: Fri, 4 Feb 2011 23:21:08 +0700
Message-ID: <AANLkTin2vZFr1NMmKwjWV4Uf6T=edaxVeng8WXQaUsQ9@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm2: zeroing free space
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Feb 4, 2011 at 10:54 PM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Fri, Feb 04 2011 at =EF=BF=BD9:12am -0500,
> Bryn M. Reeves <bmr@redhat.com> wrote:
>> They wanted a method to write zeros to all the unallocated space in a VG=
 to
>> trigger a reclaim of unused regions in the VG's PVs.

Probably not directly relevant, but perhaps of interest to those who
haven't come across it before.

Zerofree is designed to do this for loopback filesystems; I came
across it in the context of union/aufs overlays, via Grml's changelog

http://intgat.tigress.co.uk/rmy/uml/sparsify.html
