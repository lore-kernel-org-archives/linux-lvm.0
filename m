From: "Jorge Melhado" <jrgmelhado@hotmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C23E05.3706B420"
Message-ID: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com>
Subject: [linux-lvm] kernel panic - converting root fs to lvm
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
Date: Wed Aug  7 09:27:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0009_01C23E05.3706B420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

Please, help me.

I installed RedHat 7.3 (kernel 2.4.18-3) and I=B4m trying to convert my =
root filesystem to LVM (lvm-1.0.3-4).=20
My filesystems were:
    $ df -k
    Filesystem           1k-blocks      Used Available Use% Mounted on
    /dev/sda2              2063316    400240   1558264  21%   /
    /dev/sda1                  30985       5915       23470  21%  /boot
    none                       257180            0      257180   0%  =
/dev/shm

/boot is ext2.
/ is ext3
swap is on /dev/sda5

I created a new partition on /dev/sda6 and changed its type to "8e" =
(Linux LVM)

I followed whole the chapter 18 from LVM HOWTO, except I created one =
logical volume for /, /usr, /home, /var and /tmp and copied files with =
"find / -xdev | cpio -pvmd /mnt" replacing "/" and "/mnt" for each new =
logical volume created.

So, I have:
     $ df -k
     Filesystem           1k-blocks      Used      Available Use%   =
Mounted on
     /dev/sda2                  2063316    400240   1558264  21%    /
     /dev/sda1                     30985        5915      23470   21%   =
/boot
     none                          257180             0     257180   0%  =
  /dev/shm
     /dev/rootvg/root           198337       56448    131649  31%    =
/mnt
     /dev/rootvg/usr            806288      317880    447448  42%   =
/mnt/usr
     /dev/rootvg/home        198337          4133    183964   3%    =
/mnt/home
     /dev/rootvg/var            198337        13400     174697   8%   =
/mnt/var
     /dev/rootvg/tmp            99150          4128      89902   5%    =
/mnt/tmp


My /etc/fstab was:
   =20
LABEL=3D/             /                       ext3      defaults         =
               1 1
LABEL=3D/boot       /boot                 ext2     defaults              =
          1 2
none                   /dev/pts             devpts   gid=3D5,mode=3D620  =
         0 0
none                   /proc                 proc      defaults          =
              0 0
none                   /dev/shm           tmpfs     defaults             =
           0 0
/dev/sda5            swap                 swap     defaults              =
          0 0
/dev/cdrom          /mnt/cdrom        iso9660  noauto,owner,kudzu,ro  0 =
0
/dev/fd0               /mnt/floppy        auto       noauto,owner,kudzu  =
    0 0


I changed /mnt/etc/fstab to:

LABEL=3D/dev/rootvg/root  /                           ext3      defaults =
                       1 1
LABEL=3D/boot                /boot                     ext2      =
defaults                         1 2
none                            /dev/pts                 devpts    =
gid=3D5,mode=3D620            0 0
none                            /proc                      proc      =
defaults                         0 0
none                            /dev/shm                 tmpfs    =
defaults                         0 0
/dev/sda5                     swap                      swap     =
defaults                         0 0
/dev/cdrom                   /mnt/cdrom              iso9660 =
noauto,owner,kudzu,ro   0 0
/dev/fd0                        /mnt/floppy              auto      =
noauto,owner,kudzu       0 0


And I changed my /etc/lilo.conf including the last image:

    prompt
    timeout=3D50
    default=3Dlinux
    boot=3D/dev/sda
    map=3D/boot/map
    install=3D/boot/boot.b
    message=3D/boot/message
    linear

    image=3D/boot/vmlinuz-2.4.18-3
            label=3Dlinux
            initrd=3D/boot/initrd-2.4.18-3.img
            read-only
            root=3D/dev/sda2

    image=3D/boot/vmlinuz-2.4.18-3
            label=3Dlvm
            initrd=3D/boot/initrd-lvm-2.4.18-3.gz
            read-only
            root=3D/dev/rootvg/root
            append=3D"ramdisk_size=3D8192


I reran lilo and when I reboot I got these messages:
   =20
    kmod: failed to exec /sbin/mdprobe -s -k block-major-114, errno=3D2
   =20
    vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
    vgscan -- WARNING: This program does not do a VGDA backup of your =
volume group

    vgchange -- no volume groups found

    VFS: Cannot open root devide "3a00" or 3a:00
    Please append a correct "root=3D" boot option
    kernel panic: VFS: Unable to mount root fs on 3a:00

------=_NextPart_000_0009_01C23E05.3706B420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please, help me.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I installed RedHat 7.3 (kernel =
2.4.18-3) and I=B4m=20
trying to convert my root filesystem to LVM (lvm-1.0.3-4). </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>My filesystems were:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; $ df -k</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1k-blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Used Available Use% Mounted=20
on<BR>&nbsp;&nbsp;&nbsp;=20
/dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
2063316&nbsp;&nbsp;&nbsp; 400240&nbsp;&nbsp; 1558264&nbsp; =
21%&nbsp;&nbsp;=20
/<BR>&nbsp;&nbsp;&nbsp;=20
/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
30985&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5915&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
23470&nbsp; 21%&nbsp; /boot<BR>&nbsp;&nbsp;&nbsp;=20
none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2571=
80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 257180&nbsp;&nbsp; 0%&nbsp;=20
/dev/shm</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/boot is ext2.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/ is ext3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>swap is on /dev/sda5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I created a new partition on /dev/sda6 =
and changed=20
its type to "8e" (Linux LVM)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I followed whole the chapter 18 from =
LVM HOWTO,=20
except I created one logical volume for /, /usr, /home, /var and /tmp =
and copied=20
files with "find / -xdev | cpio -pvmd /mnt" replacing "/" and "/mnt" for =
each=20
new logical volume created.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So, I have:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; $ df =
-k</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;=20
Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1k-blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Used&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Available Use%&nbsp;&nbsp;&nbsp;Mounted on<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;2063316&nbsp;&nbsp;&nbsp; 400240&nbsp;&nbsp; 1558264&nbsp;=20
21%&nbsp;&nbsp;&nbsp; /<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;30985&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
5915&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;23470&nbsp; =
&nbsp;21%&nbsp;&nbsp;&nbsp;/boot<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
257180&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp; &nbsp;257180&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;=20
/dev/shm<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/rootvg/root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;198337&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;56448&nbsp;&nbsp=
;&nbsp;=20
131649&nbsp; 31%&nbsp;&nbsp;&nbsp; /mnt<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/rootvg/usr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
806288&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 317880&nbsp;&nbsp;&nbsp; =
447448&nbsp;=20
42%&nbsp;&nbsp;&nbsp;/mnt/usr<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/dev/rootv=
g/home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
198337&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; =
4133&nbsp;&nbsp;&nbsp;=20
183964&nbsp;&nbsp; 3%&nbsp;&nbsp;&nbsp; =
/mnt/home<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/rootvg/var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;=20
198337&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13400&nbsp;&nbsp; =
&nbsp;=20
174697&nbsp;&nbsp; 8%&nbsp;&nbsp; /mnt/var<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/rootvg/tmp&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
99150&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4128&nbsp;=20
&nbsp;&nbsp;&nbsp; 89902&nbsp;&nbsp; 5%&nbsp;&nbsp;&nbsp; =
/mnt/tmp</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My /etc/fstab was:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>LABEL=3D/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=20
ext3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
1=20
1<BR>LABEL=3D/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/boot&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ext2&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;1=20
2<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/dev/pts&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;devpts&nbs=
p;&nbsp;=20
gid=3D5,mode=3D620&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
0<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/proc&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
0=20
0<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/dev/shm&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tmpfs&nbsp;&nbsp;&nbsp=
;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
0=20
0<BR>/dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;swap&nbsp;&nbsp;&nbsp;&nbsp=
;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
0=20
0<BR>/dev/cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;/mnt/cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iso9660&nbsp;=
=20
noauto,owner,kudzu,ro&nbsp; 0=20
0<BR>/dev/fd0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/mnt/floppy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;auto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
noauto,owner,kudzu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I changed /mnt/etc/fstab =
to:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>LABEL=3D/dev/rootvg/root&nbsp;=20
/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
ext3&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
1=20
1<BR>LABEL=3D/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;ext2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
1=20
2<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
&nbsp; devpts&nbsp;&nbsp;&nbsp;=20
gid=3D5,mode=3D620&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
0=20
0<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
/proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp; proc&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
0=20
0<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
&nbsp;0=20
0<BR>/dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
&nbsp; &nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
0=20
0<BR>/dev/cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/mnt/cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
iso9660 noauto,owner,kudzu,ro&nbsp;&nbsp; 0=20
0<BR>/dev/fd0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
/mnt/floppy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
auto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
noauto,owner,kudzu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And I changed my /etc/lilo.conf =
including the last=20
image:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
prompt<BR>&nbsp;&nbsp;&nbsp;=20
timeout=3D50<BR>&nbsp;&nbsp;&nbsp; default=3Dlinux<BR>&nbsp;&nbsp;&nbsp; =

boot=3D/dev/sda<BR>&nbsp;&nbsp;&nbsp; =
map=3D/boot/map<BR>&nbsp;&nbsp;&nbsp;=20
install=3D/boot/boot.b<BR>&nbsp;&nbsp;&nbsp;=20
message=3D/boot/message<BR>&nbsp;&nbsp;&nbsp; linear</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
image=3D/boot/vmlinuz-2.4.18-3<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
label=3Dlinux<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
initrd=3D/boot/initrd-2.4.18-3.img<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read-only<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root=3D/dev/sda2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
image=3D/boot/vmlinuz-2.4.18-3<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
label=3Dlvm<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
initrd=3D/boot/initrd-lvm-2.4.18-3.gz<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read-only<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
root=3D/dev/rootvg/root<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
append=3D"ramdisk_size=3D8192</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I reran lilo and when I reboot I got =
these=20
messages:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; kmod: failed to exec =

/sbin/mdprobe -s -k block-major-114, errno=3D2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; vgscan -- =
"/etc/lvmtab" and=20
"/etc/lvmtab.d" successfully created</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; vgscan -- WARNING: =
This program=20
does not do a VGDA backup of your volume group</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; vgchange -- no =
volume groups=20
found</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; VFS: Cannot open =
root devide=20
"3a00" or 3a:00</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Please append a =
correct "root=3D"=20
boot option</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; kernel panic: VFS: =
Unable to=20
mount root fs on 3a:00</FONT></DIV></BODY></HTML>

------=_NextPart_000_0009_01C23E05.3706B420--
