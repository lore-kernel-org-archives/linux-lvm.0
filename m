Date: Thu, 30 Sep 1999 16:24:05 +0200
From: Harald Milz <hm@suse.de>
Subject: [linux-lvm] RFC: LVM and fast HA failovers
Message-ID: <19990930162405.C3709@suse.de>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: High Availability TSG <HA_TSG@suse.de>, linux-lvm@msede.com

Hi,

when using LVM on my machines and thinking about High Availability an idea
came to my mind how to speed up failovers and minimize downtimes.

Background: IBM's AIX LVM was enhanced with AIX 4.2.something to allow
so-called lazy updates with HACMP. In a HACMP cluster with a
multihost-attached external storage, (unaware) customers often ran into
problems when modifying the LV structure on one host without manually
exporting and re-importing a VG on the other node(s). The solution:
when activating a VG, HACMP first compares the VGDAs' timestamps (here:
vg_mtime) to the locally stored VGDA's timestamps in the ODM. If the
timestamps are identical, fine, if not, automatically export/re-import the
respective VG. This can be scripted in a HA failover script and requires
no specific LVM modification except that in our case vgscan should work
as follows. Alternatively, a wrapper to vgscan could do the job. 

1. vgscan looks in /etc/lvmconf/*.conf to 
  - read the timestamps
  - read which VGs are known on the machine
  - read related PV assignment information
2. then instead of scanning all physical devices which takes a lot of time
  - re-read the timestamps from the "physical" VGDAs on disk, i.a.w. the
    knowledge gained in step 1. 
3. compare the timestamps and 
  - return a specific exit code if nothing has changed (allowing a
    failover script to immediately run "vgchange -ay")
  - return another exit code (and more information on stdout) if a
    VG has changed, and allow a failover script to vgexport/vgimport
    a VG i.a.w. the information spit out on stdout before (VG/disk
    assignment). This would be _much_ faster than running vgscan on
    all devices!

This does not solve the problem of newly generated VGs on another HA
node (customers do strange things sometimes, don't they?) - this would
still require manual intervention except if there were a "master"
timestamp somewhere (maybe in a new struct field on all VGDAs), and
react accordingly.

Does that make sense? Any takers?

Any plans to go the MD way (a.k.a. autoraid), to automatically activate
LVM on 0xfe partitions?

Ciao,
hm


-- 
Harald Milz                            phone      +49 (0) 89 42769-0
SuSE Muenchen GmbH                     fax      +49 (0) 89 4201-7701
Stahlgruberring 28, D-81829 Muenchen   email              hm@suse.de
http://www.suse.de  (Deutsch)          http://www.suse.com (English)
