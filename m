Message-ID: <3FBE18CE.1020508@icaro.com.br>
From: Hugo Kawamorita de Souza <hugo@icaro.com.br>
MIME-Version: 1.0
Subject: [linux-lvm] Rezising root ("/") partition
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
Date: Fri Nov 21 15:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Keywords to this subject: Linux LVM , root ( / ) partition / directory /=20
filesystem rezize , vgreduce problem , filesystem / superblock info size =
greater=20
than VG size , fsck ,  etc.


Hello guys,

I just would like write down the expirience I had yesterday, actually it =
spent=20
the whole night, trying to resize a main file server root partition.

Our server runs a RedHat Linux 9.
My main difficulty was to umount the / partition in order to resize its=20
filesystem. So I used the shell from the installation CD. I did the whole=
 steps=20
using that CD shell: create a new partition PV (I did not rebooted after =
this!=20
Maybe it was the great fault), extended the VG, exnteded the LV and resiz=
ed the=20
filesystem. Then, I mounted the / partiton, executed a "df" which showed =
the new=20
size of the / filesystem. So I rebooted the system, without the CD. And t=
he nthe=20
terrifying error: "the superblock says that the / filesystem has NEW_BIG_=
SIZE=20
blocks, but the it only has OLD_SMALL_SIZE physical blocks. The partition=
 table=20
or the superblock information is wrong. run fsck to correct the error...".
So I gave the root password and tried to see what's happened. After all I=
 found=20
out that the new PV was contained in the root VG, the root VG had the new=
 big=20
size, the filesystem also had the new size, but if I remembered it right,=
 the=20
root LV was with the old small size and also the "allocable(?, or somethi=
ng=20
like)" size of the root VG was the old small one. I could not resize the =
root=20
filesystem and the root LV again and I could not remove the new PV from t=
he root=20
VG either. I tried to do "pvmove", etc, I just could do anything, and eve=
ry scan=20
and display said the thaere was no inconsistency. I knew about vgcfgresto=
re, but=20
I was not able to make it work correctly.

Any way, let me try to try explain my solution too. 2 threads that helped=
 me to=20
figured out:

Fixing a VG with an empty borked PV
  http://lists.sistina.com/pipermail/lvm-devel/2003-March/001195.html

Help! unable to mount lv's - can't see why!
  http://lists.sistina.com/pipermail/linux-lvm/2002-September/012263.html

Using the rescue from the installtion CD, I had the thought to rollback w=
hat I=20
have done, but I just could not remove the dammed new PV from the root VG=
. After=20
a long time (I started all this at 7:00h PM of 2003-11-20, it was already=
 2:00 AM=20
of 2003-11-21 and just finished all this at 4:15 AM of 2003-11-21) and af=
ter I=20
did a backup of all our changed data on thsi server, I could try to do so=
me=20
operations not being so afraid. The root VG had already 2 partition PVs a=
nd I was=20
trying to add another one. At some time, I was able to go vgcfgrestore of=
 the=20
root VG from /etc/lvmconf to the first 2 PVs. This backup was done automa=
tically=20
at some time before where the new PV was not contained the root VG. After=
 the=20
restore the root VG information show that the new PV was not in the root =
VG and=20
the pvscan was saying that the new PV was in the root VG but it was INACT=
IVE:=20
that was a good news for me. At this time I decided to delete that PV par=
tition=20
with fdisk,  after thsi the root VG has gone in inconsistency, so I did t=
he=20
vgcfgrestore again to the first 2 PVs and the VG became consistent again,=
 GREAT!=20
After thsi I was able to do all the process again:

_ using the Rescue CD
_ create the new partition again using fdisk
_ pvcreate
_ vgextend
_ resize the LV and the filesystem with e2fsadm (without, ignoring fsck, =
which=20
reports some inconsistencies due the superblock stuff...)

After this I did a vgcfgbackup and copied it to my real /etc/lvmconf. I a=
lso=20
copied the file /etc/lvmtab.d/<ROOT_VG> to my rela /etc/lvmtab.d .

Here I leave a question: is this really necessary? It worked for me after=
 this,=20
but I do not know if the LVM information goes to the correct place, so th=
at after=20
booting without the Rescue CD it will be effective.

So, my last night and my sleeping hours were spent with this...

I hope this could help someone else.


Bye.


Hugo K.S.
LPI ID: LPI000032731

--=20
-------------------------------------------------------------------------=
----
Hugo K. de Souza                =CDcaro Technologies
Software Consultant             http://www.icaro.com.br
mailto:hugo@icaro.com.br        Av. Bar=E3o de Itapura, 950, 8o andar, Bo=
tafogo
Work: +55 19 3237-7878 Ext: 248 Campinas, SP, Brazil
Fax: +55 19 3237-7008           CEP: 13020-431
