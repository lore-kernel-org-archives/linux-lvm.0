Message-Id: <HRW44B$0EC94DDC1EFCAF257C8E27E5169AD487@libero.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: "fabio_s\@inwind\.it" <fabio_s@inwind.it>
Subject: [linux-lvm] mirror setup with LVM
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
Date: Thu Jan 22 07:04:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm <linux-lvm@sistina.com>

Hi all,

I have a redhat 9 linux already installed and I'd like to add =
a second disk to
be used as mirror.

I assume it's easy to do this dur=
ing linux installation.

Does someone know how to do that without destr=
ying data on the first disk?

Thank you!


Fabio


    Device Boo=
t    Start       End    Blocks   Id  System
/dev/hda1   *         1     =
   13    104391   83  Linux
/dev/hda2            14        78    522112+=
  82  Linux swap
/dev/hda3            79     24321 194731897+  8e  Linux=
 LVM
[root@host116 root]# df -k
Filesystem           1K-blocks      Use=
d Available Use% Mounted on
/dev/Volume00/root_vol
                    =
   2064208    159268   1800084   9% /
/dev/hda1               101089    =
  9581     86289  10% /boot
/dev/Volume00/home_vol
                    =
   1032088     32828    946832   4% /home
none                    123592=
         0    123592   0% /dev/shm
/dev/Volume00/usr_vol
              =
         1548144    838208    631296  58% /usr
/dev/Volume00/var_vol
  =
                     1032088    177472    802188  19% /var
/dev/Volume00=
/varlog_vol
                       2064208     33628   1925724   2% /var=
/log
[root@host116 root]#
