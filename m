From: grobe@gmx.net
MIME-Version: 1.0
References: <3E52AF97.9060807@motorola.com>
Subject: Re: [linux-lvm] Re: Re: Sharing LVM's via NFS on Redhat 8.0 Part2 - SAMBA?
Message-ID: <11747.1045606918@www67.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Feb 18 16:22:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!

> I have some data on logical volumes that are shared via NFS and I=20
> haven't seen any problems, but now that you have asked the question I'm=20
> starting to wonder if I'm putting that data at risk without even being=20
> aware of it....

nfs exports FILESYSTEMS, not partitions, logical volumes or anything else
;-) There have been problems with some filesystems exported by nfs (e.g. ol=
der
releases of nfs and reiserfs), but these problems are not discussed here. n=
fs
shouldn't worry wether the filesystem to be exported is on a logical volume,
a partition of your harddisk or anywhere else.

CU, Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
