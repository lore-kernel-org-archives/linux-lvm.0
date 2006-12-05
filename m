Received: from [192.168.1.2] (vpn-68-7.surrey.redhat.com [10.32.68.7])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB5ASinc007955
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 10:28:44 GMT
Message-ID: <457549DB.2080700@redhat.com>
Date: Tue, 05 Dec 2006 10:28:43 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport/vgexport commands when logically moving
	disks	between systems
References: <690999.71486.qm@web51113.mail.yahoo.com>
In-Reply-To: <690999.71486.qm@web51113.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dave wrote:
> Hello,
> 
> I believe I might be misunderstanding whether vgimport and vgexport are needed in my
> particular situation.  It would be great to get some feedback for clarification.
> 
> THE SETUP:
> 
> LVM1 (1.0.8-14) on two RedHat AS3 systems (kernel: 2.4.21-47.ELsmp).
> I think the same concept applies for LVM2 as well though.
> Machine A is primary and Machine B is backup in a two-node Linux heartbeat cluster.
> Both machines are connected to the same SAN via fiber, and see the same disks, where
> the volume groups reside.
> 
> THE STRATEGY:
> 
> The idea is for A to have the LVM file systems mounted, and when a failure is
> detected, have the LVM file systems "moved" to (or seen by) system B.  The way this
> is currently accomplished is for A to do the following upon detection of a failure:
> 
> + unmount file systems
> + deactivate (vgchange -an $vg)
> + export (vgexport $vg)
> 
> then, on system B:
> 
> + import & activate (vgimport $vg $disks)
> + mount file systems
> 
> THE ISSUE:
> 
> The export works as expected on A, but upon import on B, a return code of 4 is
> returned meaning "volume group already exists".  The mounting works properly, but
> all the disks are shown like this:
> 
> "inactive PV /dev/sdx  is in EXPORTED VG $vg"  
> 
> when inspected with pvscan.
> 
> 
> Does a vgimport and/or vgexport mark the disks themselves, or simply update the
> system on which the commands are run???  I suppose that is essentially the heart of
> this issue.


Yes, vgimport/export marks the disks in the volume group. It's really for moving disks between systems where the target system might
have a volume group with the same name as the one to be imported.

> I'm starting to believe that for our strategy the vgexport and vgimport commands are
> not necessary, and are actually causing the problem.  (The HOWTO mentions these
> commands are used to move disks between systems, but perhaps that is meant to refer
> to disks that are only physically moved?)
> 
> Instead, the following strategy might be correct in case system A fails (Note: no
> vgimport or vgexport commands):
> 
> + unmount fs
> + vgchange -an $vg
> 
> then, on system B:
> 
> + vgchange -ay $vg
> + mount fs
> 
> 
> IS THIS CORRECT???
> 

Yes. IF YOU'RE VERY CAREFUL!
vgimport/vgexport are not the tools you want for this job.


-- 

patrick
