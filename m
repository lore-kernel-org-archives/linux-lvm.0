Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k52I32M0001871
	for <linux-lvm@redhat.com>; Fri, 2 Jun 2006 19:03:02 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FmDzC-0000T9-81
	for linux-lvm@redhat.com; Fri, 02 Jun 2006 19:03:02 +0100
Date: Fri, 2 Jun 2006 19:03:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Bringing an existing filesystem under LVM2 control
Message-ID: <20060602180302.GU10603@agk.surrey.redhat.com>
References: <20060601134048.GJ10603@agk.surrey.redhat.com>
	<448078C7.5040702@conterra.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <448078C7.5040702@conterra.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 02, 2006 at 07:43:35PM +0200, Dieter St=EF=BF=BDken wrote:
> If the FS resides on the first partition it usually starts at some offset
> of 63 sectors. So, if you simply erase the partition table and use hda
> for the PV, you may use this space for LVM. Don't know, if this is big
> enough, as I normally see "pe_start =3D 384".

1 sector is all it needs.  The second sector is safe with ext2/ext3 unless
you placed a bootloader there.  Filesystem tools and utilities shouldn't
interfere.  I'm guessing other filesystems will behave similarly, but I
haven't checked.
=20
> Is there any brief description around about how a PV header is organized,
> or do I have to analyze the LVM source code for this?

Start at the 'Metadata' slide here:

  http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
  http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/text28.html
=20
Alasdair
--=20
agk@redhat.com
