From: grobe@gmx.net
MIME-Version: 1.0
References: <F66Jmn8eeGbdBmM9SJL000066dc@hotmail.com>
Subject: Re: [linux-lvm] Sharing LVM's via NFS on Redhat 8.0
Message-ID: <27438.1045848354@www69.gmx.net>
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
Date: Fri Feb 21 11:26:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!

> Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from
> another machine while already having a LV on the same machine. Is it ok or
> not ok? I was talking to a buddy and he doesn't think it's a problem or an
> issue but...
> the current documentation on Sistina's site states that sharing LV's is=20
> dangerous unless it's a SCSI or Fibre Storage Device?...and not only that=
=20
> ...adminisitration can only be done on one node? (is it really possible to
> create/resize lv's from one node/machine to another (that has an LV or was
> it meant to mean that it's only possible on cluster aware network storage=
=20
> devices)??? ....

One question: did you read the various messages following your first
question?

Please understand the differende between a LVM volume and a (exported or
local) filesystem.

How do you want to share a LV which is not on a scsi or fc device? Never
heard about shared ide...;-))) Do you want to share a device or the data on=
 the
device???

CU Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
