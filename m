Message-Id: <199907181949.AA29540@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: [linux-lvm] *** Anouncement: LVM 0.7 ***
Date: Sun, 18 Jul 1999 21:48:20 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com, linux-kernel@vger.rutgers.edu
Cc: mge@ts1.ez-darmstadt.telekom.de


I'm happy to announce that

Logical Volume Manager 0.7 is available

at <http://linux.msede.com/lvm>.


New features include:

   - loop devices can be used as physical volumes for
     testing or evaluation purposes

   - correction of block device major in case of existing VGs with
     pre official one

   - support to create an initial ramdisk to have the root filesystem
     in a logical volume

   - support for volume group and logical volume names containing '.'

   - /proc/partitions support regardless of Linux version

   - larger stripe sizes up to 512k 

Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS/TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
