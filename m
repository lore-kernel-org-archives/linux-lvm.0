content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] partition representation
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC1A1E83@blr-m3-msg.wipro.com>
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
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
Date: Fri Apr 11 08:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

	I have applied the patches required for device mapper from
device-mapper-latest.tgz, and then went on to use to ioctl interface ( I
ran devmap_mknod.sh script) ...

I could not make out as to what the difference will be if I use the
devfs ...

But the change I can see if this :

Earlier my partitions were being represented as /dev/hda1, /dev/hda2 ...
and /dev/hdb1, /dev/hdb2 ....

The current representation is like this :

[root@volts root]# /dev/discs/disc
disc0  disc1
[root@volts root]# ls /dev/discs/disc0/
disc  part1  part2  part3  part4  part5  part6  part7
[root@volts root]# ls /dev/discs/disc1/
disc   part1  part2  part5  part6  part7  part8
[root@volts root]# ls /dev/discs/disc1/
disc  part1  part2  part5  part6  part7  part8
[root@volts root]#

and there is no entry for /dev/hda or /dev/hdb ... as is evident in the
following lines :

[root@volts root]# fdisk /dev/hda

Unable to open /dev/hda
[root@volts root]# fdisk /dev/hdb

Unable to open /dev/hdb

[root@volts root]# cat /proc/partitions
major minor  #blocks  name

   3     0    4226040 ide/host0/bus0/target0/lun0/disc
   3     1    2048256 ide/host0/bus0/target0/lun0/part1
   3     2     819315 ide/host0/bus0/target0/lun0/part2
   3     3     265072 ide/host0/bus0/target0/lun0/part3
   3     4          1 ide/host0/bus0/target0/lun0/part4
   3     5     208813 ide/host0/bus0/target0/lun0/part5
   3     6     208813 ide/host0/bus0/target0/lun0/part6
   3     7     208813 ide/host0/bus0/target0/lun0/part7
   3    64   10002825 ide/host0/bus0/target1/lun0/disc
   3    65     208813 ide/host0/bus0/target1/lun0/part1
   3    66          1 ide/host0/bus0/target1/lun0/part2
   3    69     208813 ide/host0/bus0/target1/lun0/part5
   3    70     514048 ide/host0/bus0/target1/lun0/part6
   3    71     514048 ide/host0/bus0/target1/lun0/part7
   3    72     514048 ide/host0/bus0/target1/lun0/part8


I cannot make out what exactly is happening, any suggestions or=20
can someone please point me to the right place to look for.

Thanks for the help,
Sharad.
