Message-ID: <5E34D857F6BB704CA3369B7553233A81651A80@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] More LVM on RAID issues
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
Date: Thu Nov 15 16:09:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Dear All,

Could someone tell me why I don=B4t receive the mails from the mailing =
list?
Did I subsscribe wrongly? I just checked the internet and saw the =
answers
for my questions.

Anyway, I couldn=B4t complete the setup for LVM on top of RAID1. =
Though,
suddenly pvcreate statement worked after deleting the volume groups, =
and the
partitions, but now it creates physical volumes with wrong size. For =
example
there is a partition with 16GB(/dev/md0), but pvcreate use only 50M.=20

Just to make the configuration clear we have 4 drives(sda, sdb, sdc, =
sdd)
and we created primary partitions on sda for boot(50M), root(200M), and
swap(700M), and another one for the rest(tmp, opt, var home 16GB).=20

Then we created 4 RAID1 device on sdb to be mirrored on sdc using =
exactly
the same size as I wrote above. We followed the instruction of Software =
RAID
HowTO(raidtab file, and mkraid).=20

The problem came when we created the physical volumes on top of the =
RAID
devices as I mentioned already.

Where did we do make a mistate?

Actually, our final aim is to establish a mirrored system. Originally =
we
also wanted to move root, and boot into the mirror but we had so many
difficulties that we gave that idea. However, we would like to complete =
the
LVM on RAID1 installation somehow, please help.

Regards,
Ferenc
