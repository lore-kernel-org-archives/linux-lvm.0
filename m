From: grobe@gmx.net
MIME-Version: 1.0
References: <20030218223007.HIJG12463.imf25bis.bellsouth.net@tiger2>
Subject: re: [linux-lvm] Sharing Logical Volumes via NFS on Redhat 8.0
Message-ID: <27823.1045607976@www67.gmx.net>
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
Date: Tue Feb 18 16:40:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!

> Truly sharing LVs requires a FileSystem that understands shared physical
> drives

OK, sharing volumes is possible, but not with nfs ;-) You need a shared scsi
device or fibrechannel, attach it to two machines, and lvm will find volumes
on both machines without problems. You should just avoid to change the lvm
metadata itself on one node while the other one is using it (e.g. resizing
volumes), as the other node will be informed on the changes not before the =
next
scan.

The problem is really to get a nice filesystem supporting that - without a
filesystem, your volumes will be quite useless. And yes, afaik GFS supports
lvm (we are currently trying to make something like this with fc).

I understood the question in a way that a filesystem lying on top of a
logical volume was to be exported with nfs.

CU, Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
