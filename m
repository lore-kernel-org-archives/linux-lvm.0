From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004032324.BAA17347@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: snapshot problem
In-Reply-To: <38E904BE.E6009DB4@yahoo.com> from root at "Apr 3, 2000  2:53:18 pm"
Date: Tue, 4 Apr 2000 01:24:20 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: root <jeff_mast@yahoo.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Hi,
> 
> I am having trouble mounting a snapshot after rebooting.
> 
> I have no problem taking a snapshot and then mounting
> it. That seems to work ok. However, when I reboot the
> machine, the snapshot will no longer mount. I get the
> following message:
> 
>     # mount /dev/vg0/snap1 /snap1
>     mount: block device /dev/vg0/snap1 is write-protected, mounting
> read-only
>     mount: you must specify the filesystem type
> 
> Is this a bug or am I missing something?

Sorry, at this point in time snapshots are not persistent.
IOW: they don't survive reboots or VG deactivation/activation cycles.

Persistency will be implemented in one of the next releases.

> 
> Also, I have had the system lockup during a copy of the snapshot
> files. This has happened to me several times; however, I don't
> know how to report any other diagnostic info. Basically though
> I delete the original files and then try to restore them from the
> snapshot. It crashed twice and worked once. I don't know how
> to replicate the problem.
> 

Actually there is some trouble caused by changes in rawio in recent kernels.

Hope, that we can soon fix them.

Heinz

> Thanks!
> 
> Jeff
> 
> My sys info is:
> 
> Linux jmast 2.3.99-pre3 #10 Mon Apr 3 14:11:10 MDT 2000 i686 unknown
> * lvm pre1 patch installed
> * reiserfs pre3 patch installed
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "vg0" [1.01 GB / 172 MB free]
> pvscan -- ACTIVE   PV "/dev/sdb2" of VG "vg1" [1 GB / 564 MB free]
> pvscan -- ACTIVE   PV "/dev/sdc1" of VG "vg0" [1.01 GB / 672 MB free]
> pvscan -- ACTIVE   PV "/dev/sdc2" of VG "vg1" [1 GB / 664 MB free]
> pvscan -- total: 4 [4.03 GB] / in use: 4 [4.03 GB] / in no VG: 0 [0]
> 
> --- Volume group ---
> VG Name               vg0
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                2
> Open LV               1
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               2.02 GB
> PE Size               4 MB
> Total PE              516
> Alloc PE / Size       305 / 1.19 GB
> Free  PE / Size       211 / 844 MB
> 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
