Message-ID: <3E3151C1.7070409@gallati.net>
From: Rene Gallati <lvm@gallati.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] disaster recovery
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
Date: Fri Jan 24 08:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hello List,

two days ago a harddisk died (IBM imfamous click of death - after 2=20
years of operation).

The harddisk was disk two (PV) of a two disk VG with several LV's inside.

The system continued to run fine, though I had to unmount some LVs. Some=20
where still mounted from this VG and they continued to work well (those=20
are probably on the remaining good disk)

Now I've ordered and recieved new disks promptly and since they are=20
quite larger than those in use, I could remove all active disks, ie the=20
damaged one AND the good one. I'm running with fresh disks now.

Still I'd like to get the valid data out of the good disk. Since it=20
remained running (/usr is among one of them - and the system continued=20
to execute programs underneath /usr) I am fairly sure that this data=20
should be recoverable.

I had several LVs in the VG, most where quite small, the last one was=20
large and spanned both disks but I'm quite sure it "began" on the good=20
one also. Now I've read a bit in the archive and searched for howto's -=20
but I've still got some questions on how to proceed.

Because I've needed to shut down the machine anyway, I just made a=20
complete software upgrade. Now I'm running a SuSE 8.1 - with all=20
relevant security patches applied.

I'm wondering if I have all the tools required to attemp to recover the=20
remaining data from the good drive?

I keep reading about a "LVM2" - can anyone shortly tell me what exactly=20
that is? Only new userspace utilities? complete new LVM subsystem?

Do I need LVM2 to recover my data or do I already have all I need?=20
(Version of vgdisplay for example is) :
vgdisplay: Logical Volume Manager 1.0.5(mp-v6)
Heinz Mauelshagen, Sistina Software  15/07/2002 (IOP 10)

Do I need to build my own kernel if I need LVM2? I'd like to skip that=20
at the moment. I always build my own kernel, that's not a problem per=20
se, but I am still rebuilding the machine and I'd like to do that only=20
once - at the end when everything is fine again.

Now once I have all the tools necessary, am I right that I basically=20
need to execute vgscan and vgchange and they should be able to activate=20
the VG even when one disk is missing, right? I tried that on the still=20
damaged system and I couldn't get vgchange to activate the VG - it just=20
didn't do it.

Also I ran vgcfgrestore once, but it segfaulted. pvdisplay though=20
reported good looking data from the good drive. That was on the old=20
system though (with old LVM tools, status at about SuSE 7.3 level=20
(although security upgrades where always applied)).

But before I really try to get the data out I just want to be sure I do=20
everything correct.

btw: Do I have a chance of getting part of the data from the LV out,=20
that was spanning the disks? The filesystem was reiser, I think it=20
should be able to handle that (and the beginning of the fs should be on=20
the good disk). Or is that just out of the window anyhow?

Thanks for all answers in advance.

CU

Ren=EF=BF=BD
