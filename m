Message-Id: <199908171637.AA10320@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] corrupted VG/LVs
Date: Tue, 17 Aug 1999 18:36:57 METDST
In-Reply-To: <19990817135731.A1109@redneck.sk.oracle.com>; from "Adrien Farkas" at Aug 17, 99 1:57 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: freddy@sk.oracle.com
Cc: linux-lvm@msede.com, mge@ts1.ez-darmstadt.telekom.de


Hi Freddy.

> 
> somehow I managed to get my volume group vg00 corrupted.

Can you recall how this tokk place?

I ask to get an idea if LVM has to be enahnced or fixed.


> I have 7 PVs, some of them are members of (not existing) vg00, some are not.
> Now my question is how I remove all the dependencies and/or PVs from VG to
> be able to create new PV/VG/LV? xxremove does not work.
> 


If you want to restore your volume group description to the disks:
------------------------------------------------------------------

   Please start by doing a backup of /etc/lvmconf/* because there are up
   to 10 backups in a history of your volume group configuration.

   for p in /dev/YourInvolvedDiskSpecials; do
      vgcfgrestore -n YourVolumeGroup -f PathToYourVolumeGroupBackup $p
   done


   PathToYourVolumeGroupBackup could be /etc/lvmconf/VourVolumeGroupName.conf

   - or -

   /etc/lvmconf/VourVolumeGroupName.[1-9].conf


   BTW: with "vgcfgrestore -n YourVolumeGroup -ll -f PathToYourVolumeGroupBackup
        you can look into the backup file and decide, if this is the one
        you want to be restored.


If you just want to initialize all involved and now useless PVs:
----------------------------------------------------------------

   pvcreate -ff /dev/YourPVX ... # insert all involved disk/partition specials


Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
