Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0SMxV0W021494
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 22:59:31 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cuf5P-0004Hy-3p
	for linux-lvm@redhat.com; Fri, 28 Jan 2005 22:59:31 +0000
Date: Fri, 28 Jan 2005 22:59:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgcfgrestore after broken disk.
Message-ID: <20050128225931.GK14093@agk.surrey.redhat.com>
References: <20050128221220.GA14972@angelica.rajraj.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050128221220.GA14972@angelica.rajraj.net>
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

On Fri, Jan 28, 2005 at 11:12:20PM +0100, David R=EF=BF=BDhr wrote:
> Can I reduce the "missing" disk and safe the data of the two disks
> remaining some how? I can live with loosing a couple of Gb of data, but
> not the entire 225Gb....
=20
Also consider 'man lvm' -P
lvcreate --type zero   (in a different VG)
'man vgreduce' --test --removemissing

Alasdair
--=20
agk@redhat.com
