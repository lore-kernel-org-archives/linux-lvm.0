From: "Jamey Kirby" <jkirby@storagecraft.com>
Subject: RE: [linux-lvm] Inactive snapshot?
Message-ID: <001d01c37c17$bc9e9f70$6502a8c0@jkirbydesk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Sea2-F42hvqgStMVhEU00001df3@hotmail.com>
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
Date: Tue Sep 16 01:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Chuckle, chuckle, chuckle...

Jamey Kirby, Windows DDK MVP
StorageCraft Inc.
jkirby@storagecraft.com
http://www.storagecraft.com



=20

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] =
On
Behalf Of tester7 A.
Sent: Monday, September 15, 2003 10:42 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] Inactive snapshot?


A few questions and sugesstions regarding LVM2 snapshots.

1. Force active snapshot to be inactive and make it accessable.
It seems like inactive snapshot are not accesable at all. Inactive =
snapshots

does not update the changes, but it holds the changes while it was =
active,=20
so old data might be usefull.

Since, the LVM snapshots are not meant to stay long in the system and=20
delegrate the performance dramatically(according to my own BMT), I would =

like to make the snapshot inactive at the some moment so that it does =
not=20
affect the I/O performacne, and also I would like to access the old =
data.

3. LVM2 snapshots are async?

Thanks in advance.

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*.=20
http://join.msn.com/?page=3Dfeatures/virus


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
