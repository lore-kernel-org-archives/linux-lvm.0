Message-ID: <A56BCCA3A5C2D411B18A00508BDE9C9B05A36133@bla.satyam.com>
From: Narasimha_Subban <Narasimha_Subban@Satyam.com>
MIME-Version: 1.0
Subject: [linux-lvm] Regarding the Linux installation
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
Date: Wed Jan 15 03:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

I have installed Linux 7.2 (Server Option) in my m/c with SCSI Adapter on
the mother board 
I dont have any scsi Disk on system. Only IDE disk is there.The installation
is through.

During the booting it is searching the SCSI disks in the system twice (from
0 to 15 LUNs ).
This is taking 20 minutes and then system will come up.
Pls tell me how to disable the SCSI device scanning.

Waiting for u r valuable suggestions.

Thanks and Rgds
Narasimha Subban K.V

> -----Original Message-----
> From:	linux-lvm-request@sistina.com [SMTP:linux-lvm-request@sistina.com]
> Sent:	Monday, January 13, 2003 10:37 PM
> To:	linux-lvm@sistina.com
> Subject:	linux-lvm digest, Vol 1 #756 - 14 msgs
> 
> Send linux-lvm mailing list submissions to
> 	linux-lvm@sistina.com
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	http://lists.sistina.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
> 	linux-lvm-request@sistina.com
> 
> You can reach the person managing the list at
> 	linux-lvm-admin@sistina.com
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
> 
> 
> Today's Topics:
> 
>    1. LVM2 and I2O block devices (tlove@serviceweb.net)
>    2. Re: LVM2 and I2O block devices (Alasdair G Kergon)
>    3. [Q] LVM snapshot volume extendable? (Sean Oh)
>    4. Re: [Q] LVM snapshot volume extendable? (Alasdair G Kergon)
>    5. Re: [Q] LVM snapshot volume extendable? (jon+lvm@silicide.dk)
>    6. Re: [Q] LVM snapshot volume extendable? (Sean Oh)
>    7. Re: [Q] LVM snapshot volume extendable? (jon+lvm@silicide.dk)
>    8. Re: Sample (big@boss.com)
>    9. Re: [Q] LVM snapshot volume extendable? (Sean Oh)
>   10. [Q] Possible lvmdiskscan bug? (Sean Oh)
>   11. Jon Bendtsen pdf compare (Miguel Parra =?ISO-8859-1?Q?Rodr=EDguez?=)
>   12. Best stripe size for ext2, ext3 and ResiserFS (Miguel Parra
> =?ISO-8859-1?Q?Rodr=EDguez?=)
>   13. Re: Two drives with the same UUID (Fabian Herschel)
>   14. Help: unused PV overwritten, recovery of vg possible? (Holger
> Steinhaus)
> 
> --__--__--
> 
> Message: 1
> Date: Sat, 11 Jan 2003 15:41:18 -0500
> From: tlove@serviceweb.net
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] LVM2 and I2O block devices
> Reply-To: linux-lvm@sistina.com
> 
> Hi all,
> I've been scouring the lists for information on getting LVM to recognize
> my 
> hardware RAID I2O black device.  I have the device working properly, and
> have 
> tested my installation of LVM2.  My device doesn't show up in the .cache
> file, 
> and I have tried monkeying with the filters in the .conf file.  Any 
> suggestions on how to proceed would be greatly appreciated!
> Thanks
> --Ted
> 
> 
> --__--__--
> 
> Message: 2
> Date: Sat, 11 Jan 2003 22:22:26 +0000
> From: Alasdair G Kergon <agk@uk.sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM2 and I2O block devices
> Reply-To: linux-lvm@sistina.com
> 
> On Sat, Jan 11, 2003 at 03:41:18PM -0500, tlove@serviceweb.net wrote:
> > I've been scouring the lists for information on getting LVM to recognize
> my 
> > hardware RAID I2O black device.  
> 
> > and I have tried monkeying with the filters in the .conf file.  Any 
> Try adding a "types = " line corresponding to what appears in
> /proc/devices 
> - see doc/example.conf & man 5 lvm.conf.
> 
> Alasdair
> -- 
> agk@uk.sistina.com
> 
> 
> --__--__--
> 
> Message: 3
> From: "Sean Oh" <oh@storageone.co.kr>
> To: <linux-lvm@sistina.com>
> Date: Sun, 12 Jan 2003 21:12:07 +0900
> Subject: [linux-lvm] [Q] LVM snapshot volume extendable?
> Reply-To: linux-lvm@sistina.com
> 
> Hi
> 
> I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).
> 
> My question is that is the snapshot volume extendable?
> 
> My environment is as follows:
> 
> /dev/vg01/lv01 ---> XFS, 2G
> /dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted under
> /snap with ro,nouuid,usrquota,grpquota,noatime
> 
> Now I have wrote a small shell scripts that if lv01_snap is more than 50%
> full, automatically increase the lv01_snap. But it seems to me that it
> does
> not work well..
> 
> What I did in the shell scripts are 'lvextend -L+256M /dev/vg01/lv01_snap'
> with/without 'xfs_growfs /snap'.
> 
> After umounting the /snap and trying to remount /snap, it complaints as
> below
> 
> XFS: recovery required required on read-only device
> XFS: write access unavailabe, cannot proceed
> XFS: log mount/recovery failed
> XFS: log mount failed
> mount: wrong fs type, bad option, bad superblock on /dev/vg01/lv01,
>        or too many mounted file systems
>        (aren't you trying to mount an extended partition,
>        instead of some logical partition inside?)
> 
> BTW, extending the original lv01 works fine with lvextend and xfs_growfs.
> 
> Could someone please help?
> 
> Thanks in advance
> 
> 
> 
> --__--__--
> 
> Message: 4
> Date: Sun, 12 Jan 2003 13:09:53 +0000
> From: Alasdair G Kergon <agk@uk.sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> Reply-To: linux-lvm@sistina.com
> 
> On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> > What I did in the shell scripts are 'lvextend -L+256M
> /dev/vg01/lv01_snap'
> > with/without 'xfs_growfs /snap'.
> The snapshot volume does not hold a filesystem - it is just a storage
> area for deltas that enable the system to reconstruct a filesystem. 
> So you don't need to run xfs utilities on it to make more space.  [But
> of course some people might want to run them on writeable snapshots 
> (needs kernel patch) for testing the effect of utilities.]
> 
> Alasdair
> -- 
> agk@uk.sistina.com
> 
> 
> --__--__--
> 
> Message: 5
> Date: Sun, 12 Jan 2003 14:09:43 +0100
> From: jon+lvm@silicide.dk
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> Reply-To: linux-lvm@sistina.com
> 
> On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> > Hi
> > 
> > I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).
> > 
> > My question is that is the snapshot volume extendable?
> 
> yes, just use lvextend.
> 
> 
> > My environment is as follows:
> > 
> > /dev/vg01/lv01 ---> XFS, 2G
> > /dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted under
> > /snap with ro,nouuid,usrquota,grpquota,noatime
> > 
> > Now I have wrote a small shell scripts that if lv01_snap is more than
> 50%
> > full, automatically increase the lv01_snap. But it seems to me that it
> does
> > not work well..
> 
> I wrote one too, but rather than 50% used, i used XX MB free space.
> 
>  
> > What I did in the shell scripts are 'lvextend -L+256M
> /dev/vg01/lv01_snap'
> > with/without 'xfs_growfs /snap'.
> 
> you dont need to grow the filesystem on the snapshot.
> 
>  
> > After umounting the /snap and trying to remount /snap, it complaints as
> > below
> 
> you dont need to unmount it
> 
> 
> 
> A LVM snapshot works by allocating a new "PE table". This means.
> (# is allocated, - is not, and | is the end)
> 
> LV: |-#################--##---#####-|
> snapshot: |---|
> 
> so, you change something in the LV
> 
> LV: |-#############+###--##---#####-|
> snapshot: |#--|
> 
> Only the block that is actualy changed is moved to the snapshot.
> If you need alot of changes your snapshot should be big, if you dont
> change alot, you can use a much smaller snapshot.
> 
> 
> 
> 
> 
> JonB
> 
> 
> --__--__--
> 
> Message: 6
> From: "Sean Oh" <oh@storageone.co.kr>
> To: <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> Date: Sun, 12 Jan 2003 22:29:54 +0900
> Reply-To: linux-lvm@sistina.com
> 
> Thanks for the replay.
> Well, just doing 'lvextend' does not work for me here.
> Is there any other thing that I need to look for?
> 
> This is what I do for testing the extending the snapshot volume
> 
> ------------------
> [root@storageone root]# df -k
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sda1              5903668   1476712   4426956  26% /
> /dev/vg01/lv01       567079312      2200 567077112   1% /vg01/lv01
> /dev/vg01/lv01_snap0112_2159
>                      567079312      2200 567077112   1%
> /snap/lv01_snap0112_2159
> 
> [root@storageone root]# lvdisplay /dev/vg01/lv01_snap0112_2159
> --- Logical volume ---
> LV Name                /dev/vg01/lv01_snap0112_2159
> VG Name                vg01
> LV Write Access        read only
> LV snapshot status     active destination for /dev/vg01/lv01
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                540.88 GB
> Current LE             8654
> Allocated LE           8654
> snapshot chunk size    64 KB
> Allocated to snapshot  0.00% [0/127.88 MB]
> Allocated to COW-table 128 KB
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:1
> 
> [root@storageone root]# dd if=/dev/zero of=/vg01/lv01/SOMEFILE bs=1024k
> count=64
> 64+0 records in
> 64+0 records out
> 
> [root@storageone root]# sync
> 
> [root@storageone root]# lvdisplay /dev/vg01/lv01_snap0112_2159
> --- Logical volume ---
> LV Name                /dev/vg01/lv01_snap0112_2159
> VG Name                vg01
> LV Write Access        read only
> LV snapshot status     active destination for /dev/vg01/lv01
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                540.88 GB
> Current LE             8654
> Allocated LE           8654
> snapshot chunk size    64 KB
> Allocated to snapshot  50.15% [64.12 MB/127.88 MB]
> Allocated to COW-table 128 KB
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:1
> 
> [root@storageone root]# lvextend -L+127M /dev/vg01/lv01_snap0112_2159
> lvextend -- rounding relative size up to physical extent boundary
> lvextend -- extending logical volume "/dev/vg01/lv01_snap0112_2159" to 256
> MB
> lvextend -- doing automatic backup of volume group "vg01"
> lvextend -- logical volume "/dev/vg01/lv01_snap0112_2159" successfully
> extended
> 
> [root@storageone root]# df -k
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sda1              5903668   1476624   4427044  26% /
> /dev/vg01/lv01       567079312     67736 567011576   1% /vg01/lv01
> /dev/vg01/lv01_snap0112_2159
>                      567079312      2200 567077112   1%
> /snap/lv01_snap0112_2159
> 
> [root@storageone root]# umount /snap/lv01_snap0112_2159/
> 
> [root@storageone root]# mount /snap/lv01_snap0112_2159/
> mount: wrong fs type, bad option, bad superblock on
> /dev/vg01/lv01_snap0112_2159,
>        or too many mounted file systems
> 
> [root@storageone root]# cat /etc/fstab
> /dev/sda1          /                        reiserfs defaults         0  0
> /dev/sda2          swap                     swap     defaults         0  0
> /dev/vg01/lv01     /vg01/lv01               xfs
> defaults,usrquota,grpquota,noatime 0  0
> /dev/vg01/lv01_snap0112_2159 /snap/lv01_snap0112_2159 xfs
> ro,nouuid,usrquota,grpquota,noatime 0  0
> none               /proc                    proc     defaults         0  0
> none               /dev/pts                 devpts   mode=622         0  0
> -------------
> 
> The reasone that I did 'unmount' is to simulate the 'rebooting'. Because
> after rebooting, I can not mount the extended snapshot anymore.
> 
> Thanks in advance
> 
> 
> 
> ----- Original Message -----
> From: <jon+lvm@silicide.dk>
> To: <linux-lvm@sistina.com>
> Sent: Sunday, January 12, 2003 10:09 PM
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> 
> 
> > On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> > > Hi
> > >
> > > I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).
> > >
> > > My question is that is the snapshot volume extendable?
> >
> > yes, just use lvextend.
> >
> >
> > > My environment is as follows:
> > >
> > > /dev/vg01/lv01 ---> XFS, 2G
> > > /dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted
> under
> > > /snap with ro,nouuid,usrquota,grpquota,noatime
> > >
> > > Now I have wrote a small shell scripts that if lv01_snap is more than
> 50%
> > > full, automatically increase the lv01_snap. But it seems to me that it
> does
> > > not work well..
> >
> > I wrote one too, but rather than 50% used, i used XX MB free space.
> >
> >
> > > What I did in the shell scripts are 'lvextend -L+256M
> /dev/vg01/lv01_snap'
> > > with/without 'xfs_growfs /snap'.
> >
> > you dont need to grow the filesystem on the snapshot.
> >
> >
> > > After umounting the /snap and trying to remount /snap, it complaints
> as
> > > below
> >
> > you dont need to unmount it
> >
> >
> >
> > A LVM snapshot works by allocating a new "PE table". This means.
> > (# is allocated, - is not, and | is the end)
> >
> > LV: |-#################--##---#####-|
> > snapshot: |---|
> >
> > so, you change something in the LV
> >
> > LV: |-#############+###--##---#####-|
> > snapshot: |#--|
> >
> > Only the block that is actualy changed is moved to the snapshot.
> > If you need alot of changes your snapshot should be big, if you dont
> > change alot, you can use a much smaller snapshot.
> >
> >
> >
> >
> >
> > JonB
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> 
> 
> --__--__--
> 
> Message: 7
> Date: Sun, 12 Jan 2003 18:16:34 +0100
> From: jon+lvm@silicide.dk
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> Reply-To: linux-lvm@sistina.com
> 
> On Sun, Jan 12, 2003 at 10:29:54PM +0900, Sean Oh wrote:
> 
> [cut]
> 
> Would you be so kind to reply inbetween the text, as i did, or below (if
> it's not that much text) 
> and while you are at it, cut the unneeeded lines out. You left all my
> text intact, which was 70 useless lines.
> 
> 
> 
> 
> JonB
> 
> 
> --__--__--
> 
> Message: 8
> From: <big@boss.com>
> To: <linux-lvm@sistina.com>
> Date: Mon, 13 Jan 2003 12:29:03 +0800
> Subject: [linux-lvm] Re: Sample
> Reply-To: linux-lvm@sistina.com
> 
> This is a multipart message in MIME format
> 
> --CSmtpMsgPart123X456_000_00E2617D
> Content-Type: text/plain;
> 	charset="iso-8859-1"
> Content-Transfer-Encoding: 7bit
> 
> Attached file:
> --CSmtpMsgPart123X456_000_00E2617D--
> 
> 
> 
> --__--__--
> 
> Message: 9
> From: "Sean Oh" <oh@storageone.co.kr>
> To: <jon+lvm@silicide.dk>
> Cc: <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
> Date: Mon, 13 Jan 2003 13:37:53 +0900
> Reply-To: linux-lvm@sistina.com
> 
> Sorry about the long text.
> 
> Could you please tell me what kind of LVM version, kernel version, File
> System you are using for the extendabe snapshot?
> 
> Do I need to apply writeable snapshot patch to have snapshot extendable?
> If
> so, Where can I get the patch for kernel 2.4.20?
> 
> I have applied VFS-lock patch, lvm-0.8final-2.4.0.patch that comes with
> 1.0.6 distribution.
> 
> Thanks in advance
> 
> 
> 
> --__--__--
> 
> Message: 10
> From: "Sean Oh" <oh@storageone.co.kr>
> To: <linux-lvm@sistina.com>
> Date: Mon, 13 Jan 2003 13:40:44 +0900
> Subject: [linux-lvm] [Q] Possible lvmdiskscan bug?
> Reply-To: linux-lvm@sistina.com
> 
> This is a multi-part message in MIME format.
> 
> ------=_NextPart_000_0032_01C2BB09.5F166C40
> Content-Type: text/plain;
> 	charset="ks_c_5601-1987"
> Content-Transfer-Encoding: base64
> 
> bHZtZGlza3NjYW4gaW4gdGhlIHZlcnNpb24gMS4wLjYgZ2l2ZXMgbWUgYSBzdHJhbmdlIGVycm
> 9y
> LCBzYXlpbmcgInNpemUgb2YgImx2bWRpc2tzY2FuIiBpcyBsYXJnZXIgdGhhbiAyVEIiLCBidX
> Qg
> dGhlIGRpc2sgYXJyYXkgaXMgYWJvdXQgMS4yVEINCmlzIGl0IGEga25vd24gYnVnPw0KDQpUaG
> Fu
> a3MgaW4gYWR2YW5jZS4NCg0KW3Jvb3RAc3RvcmFnZW9uZSBQQVRDSEVTXSMgbHZtZGlza3NjYW
> 4N
> Cmx2bWRpc2tzY2FuIC0tIHJlYWRpbmcgYWxsIGRpc2tzIC8gcGFydGl0aW9ucyAodGhpcyBtYX
> kg
> dGFrZSBhIHdoaWxlLi4uKQ0KL2Rldi9zZGEgLS0gc2l6ZSBvZiAibHZtZGlza3NjYW4iIGlzIG
> xh
> cmdlciB0aGFuIDJUQg0KDQpsdm1kaXNrc2NhbiAtLSAvZGV2L3NkYTEgIFsgICAgICAgNS42My
> BH
> Ql0gUHJpbWFyeSAgTElOVVggbmF0aXZlIHBhcnRpdGlvbiBbMHg4M10NCmx2bWRpc2tzY2FuIC
> 0t
> IC9kZXYvc2RhMiAgWyAgICAgNTA5Ljg4IE1CXSBQcmltYXJ5ICAgWzB4ODJdDQovZGV2L3NkYT
> Mg
> LS0gc2l6ZSBvZiAibHZtZGlza3NjYW4iIGlzIGxhcmdlciB0aGFuIDJUQg0KDQoNCkRpc2sgL2
> Rl
> di9zZGE6IDI1NSBoZWFkcywgNjMgc2VjdG9ycywgMTM1MTU1IGN5bGluZGVycw0KVW5pdHMgPS
> Bj
> eWxpbmRlcnMgb2YgMTYwNjUgKiA1MTIgYnl0ZXMNCg0KICAgRGV2aWNlIEJvb3QgICAgU3Rhcn
> Qg
> ICAgICAgRW5kICAgIEJsb2NrcyAgIElkICBTeXN0ZW0NCi9kZXYvc2RhMSAgICogICAgICAgIC
> Ax
> ICAgICAgIDczNSAgIDU5MDM4NTYgICA4MyAgTGludXgNCi9kZXYvc2RhMiAgICAgICAgICAgNz
> M2
> ICAgICAgIDgwMCAgICA1MjIxMTIrICA4MiAgTGludXggc3dhcA0KL2Rldi9zZGEzICAgICAgIC
> Ag
> ICA4MDEgICAgMTM1MTU1IDEwNzkyMDY1MzcrICA4ZSAgTGludXggTFZNDQo=
> 
> ------=_NextPart_000_0032_01C2BB09.5F166C40
> Content-Type: text/html;
> 	charset="ks_c_5601-1987"
> Content-Transfer-Encoding: base64
> 
> PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYW
> wv
> L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgaHR0cC1lcXVpdj1Db250ZW50LVR5cGUgY29udG
> Vu
> dD0idGV4dC9odG1sOyBjaGFyc2V0PWtzX2NfNTYwMS0xOTg3Ij4NCjxNRVRBIGNvbnRlbnQ9Ik
> 1T
> SFRNTCA2LjAwLjI4MDAuMTEwNiIgbmFtZT1HRU5FUkFUT1I+DQo8U1RZTEU+PC9TVFlMRT4NCj
> wv
> SEVBRD4NCjxCT0RZIGJnQ29sb3I9I2ZmZmZmZj4NCjxESVY+PEZPTlQgc2l6ZT0yPmx2bWRpc2
> tz
> Y2FuIGluIHRoZSB2ZXJzaW9uIDEuMC42IGdpdmVzIG1lIGEgc3RyYW5nZSBlcnJvciwgDQpzYX
> lp
> bmcgInNpemUgb2YgImx2bWRpc2tzY2FuIiBpcyBsYXJnZXIgdGhhbiAyVEIiLCBidXQgdGhlIG
> Rp
> c2sgYXJyYXkgaXMgYWJvdXQgDQoxLjJUQjwvRk9OVD48L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT
> 0y
> PmlzIGl0IGEga25vd24gYnVnPzwvRk9OVD48L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPjwvRk
> 9O
> VD4mbmJzcDs8L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPlRoYW5rcyBpbiBhZHZhbmNlLjwvRk
> 9O
> VD48L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPjwvRk9OVD4mbmJzcDs8L0RJVj4NCjxESVY+PE
> ZP
> TlQgc2l6ZT0yPltyb290QHN0b3JhZ2VvbmUgUEFUQ0hFU10jIGx2bWRpc2tzY2FuPEJSPmx2bW
> Rp
> c2tzY2FuIC0tIA0KcmVhZGluZyBhbGwgZGlza3MgLyBwYXJ0aXRpb25zICh0aGlzIG1heSB0YW
> tl
> IGEgd2hpbGUuLi4pPEJSPi9kZXYvc2RhIC0tIHNpemUgb2YgDQoibHZtZGlza3NjYW4iIGlzIG
> xh
> cmdlciB0aGFuIDJUQjwvRk9OVD48L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPjwvRk9OVD4mbm
> Jz
> cDs8L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPmx2bWRpc2tzY2FuIC0tIC9kZXYvc2RhMSZuYn
> Nw
> OyANClsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgNS42MyBHQl0gUHJpbW
> Fy
> eSZuYnNwOyBMSU5VWCBuYXRpdmUgDQpwYXJ0aXRpb24gWzB4ODNdPEJSPmx2bWRpc2tzY2FuIC
> 0t
> IC9kZXYvc2RhMiZuYnNwOyBbJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IA0KNTA5Ljg4IE1CXS
> BQ
> cmltYXJ5Jm5ic3A7Jm5ic3A7IFsweDgyXTxCUj4vZGV2L3NkYTMgLS0gc2l6ZSBvZiAibHZtZG
> lz
> a3NjYW4iIGlzIA0KbGFyZ2VyIHRoYW4gMlRCPEJSPjwvRk9OVD48L0RJVj4NCjxESVY+PEZPTl
> Qg
> c2l6ZT0yPjxCUj5EaXNrIC9kZXYvc2RhOiAyNTUgaGVhZHMsIDYzIHNlY3RvcnMsIDEzNTE1NS
> AN
> CmN5bGluZGVyczxCUj5Vbml0cyA9IGN5bGluZGVycyBvZiAxNjA2NSAqIDUxMiBieXRlczwvRk
> 9O
> VD48L0RJVj4NCjxESVY+PEZPTlQgc2l6ZT0yPjwvRk9OVD4mbmJzcDs8L0RJVj4NCjxESVY+PE
> ZP
> TlQgc2l6ZT0yPiZuYnNwOyZuYnNwOyBEZXZpY2UgQm9vdCZuYnNwOyZuYnNwOyZuYnNwOyANCl
> N0
> YXJ0Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEVuZCZuYnNwOyZuYnNwOy
> Zu
> YnNwOyANCkJsb2NrcyZuYnNwOyZuYnNwOyBJZCZuYnNwOyBTeXN0ZW08QlI+L2Rldi9zZGExJm
> 5i
> c3A7Jm5ic3A7IA0KKiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOy
> Zu
> YnNwOyANCjEmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgNzM1Jm5ic3A7Jm
> 5i
> c3A7IDU5MDM4NTYmbmJzcDsmbmJzcDsgDQo4MyZuYnNwOyANCkxpbnV4PEJSPi9kZXYvc2RhMi
> Zu
> YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYn
> Nw
> OyANCjczNiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA4MDAmbmJzcDsmbm
> Jz
> cDsmbmJzcDsgNTIyMTEyKyZuYnNwOyANCjgyJm5ic3A7IExpbnV4IA0Kc3dhcDxCUj4vZGV2L3
> Nk
> YTMmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcD
> sm
> bmJzcDsgDQo4MDEmbmJzcDsmbmJzcDsmbmJzcDsgMTM1MTU1IDEwNzkyMDY1MzcrJm5ic3A7ID
> hl
> Jm5ic3A7IExpbnV4IA0KTFZNPEJSPjwvRElWPjwvRk9OVD48L0JPRFk+PC9IVE1MPg0K
> 
> ------=_NextPart_000_0032_01C2BB09.5F166C40--
> 
> 
> 
> --__--__--
> 
> Message: 11
> From: Miguel Parra =?ISO-8859-1?Q?Rodr=EDguez?= <mparra@comm.germinus.com>
> To: linux-lvm@sistina.com
> Date: 13 Jan 2003 11:43:51 +0100
> Subject: [linux-lvm] Jon Bendtsen pdf compare
> Reply-To: linux-lvm@sistina.com
> 
> Hello! 
> 
> Could you email me the pdf file compare hardware/software RAID.
> I did read your email of Nov 27 2002 of mailing list. 
> 
> Thanks!
> 
> 
> 
> 
> 
> 
> 
> --__--__--
> 
> Message: 12
> From: Miguel Parra =?ISO-8859-1?Q?Rodr=EDguez?= <mparra@comm.germinus.com>
> To: linux-lvm@sistina.com
> Date: 13 Jan 2003 11:58:54 +0100
> Subject: [linux-lvm] Best stripe size for ext2, ext3 and ResiserFS
> Reply-To: linux-lvm@sistina.com
> 
> Hey!
> 
> What's the best stripe size for get a high performance system on
> ext2,ext3 an reiserfs?
> 
> Thank!
> 
> 
> 
> 
> 
> 
> 
> --__--__--
> 
> Message: 13
> From: Fabian Herschel <fabian.herschel@suse.de>
> To: linux-lvm@sistina.com, lvm@interlinx.bc.ca
> Subject: Re: [linux-lvm] Two drives with the same UUID
> Date: Mon, 13 Jan 2003 11:57:51 +0100
> Reply-To: linux-lvm@sistina.com
> 
> On Friday 10 January 2003 22:38, lvm@interlinx.bc.ca wrote:
> > If I had a system with a functional LVM configuration (1.0.6ish) and I
> > were to "duplicate" the drive in it (i.e. dd if=3D/dev/sda of=3D/dev/sd=
> b)
> > and then try to boot that system (with both drives installed and
> > functional), what would happen?
> >
> > Of course, because I am asking, I have tried it.  :-)  During boot LVM
> > failed to find any logical volumes.  Is this expected?  It's not
> > surprising mind you, but I wonder how it was designed to deal with
> > this situation.
> 
> Sorry, but this is a normal reaction of the logical volume manager. Why?
> Each "normal" volume manager uses a special part of the disk device (or a
> special part of a partition) to identify the physical media. If you copy =
> the
> complete disk, you also copy this unique identifier. So LVM get confused
> to find a media twice.
> 
> Best regards
> Fabian Herschel
> >
> > b.
> 
> ----------------------------------------
> Content-Type: application/pgp-signature; charset=3D"us-ascii";=20
> name=3D"Attachment: 1"
> Content-Transfer-Encoding: 7bit
> Content-Description:=20
> ----------------------------------------
> 
> --=20
> <Fabian.Herschel@suse.de>
> SuSE Linux AG * Mergenthalerallee 45-47 * D-65760 Eschborn
> Tel: +49-6196-50951-23 * Fax: +49-6196-409-607
> http://www.suse.de * Alice Homepage: http://www.suse.de/~fabian
> 
> 
> --__--__--
> 
> Message: 14
> Date: Mon, 13 Jan 2003 18:08:20 +0100
> From: Holger Steinhaus <hsteinhaus@gmx.de>
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Help: unused PV overwritten, recovery of vg possible?
> Reply-To: linux-lvm@sistina.com
> 
> Dear List,
> 
> I am in big trouble. I've added a PV to an existing volume group and then 
> accidently overwritten the entire disk containing that newly added
> physical 
> volume (not containing any lvs/data). Now vgscan refuses to accept the 
> volume group anymore. Unfortunatly there are no cfg backups not containing
> 
> this new and overwritten PV. Are there any chances to recover the data on 
> the old (and physically intact) logical volumes?
> 
> My configuration before crash: one vg (vgmain) on one pv (hda5),
> three lvs on volume group vgmain. Then added another pv (hdc5) to vgmain 
> and overwritten whole harddisk hdc. The result:
> 
> vgscan outputs:
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> volume group "vgmain" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> group
> 
> and pvscan:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda5"  is associated to unknown VG "vgmain" 
> (run vgscan)
> pvscan -- total: 1 [44.13 GB] / in use: 1 [44.13 GB] / in no VG: 0 [0]
> 
> I tried to vcfgrestore my best cfg backup and got:
> $ vgcfgrestore -f /etc/old/lvmconf/vgmain.conf.3.old  /dev/hdc5
> vgcfgrestore -- this is a backup of volume group "vgmain"
> vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physical 
> volume "/dev/hdc5"
> 
> Are there any ideas to get the volumes mountable again?
> 
> Thanks!
> 
> Holger Steinhaus
> hsteinhaus@gmx.de
> 
> 
> 
> --__--__--
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 
> End of linux-lvm Digest
************************************************************************** 
This email (including any attachments) is intended for the sole use of the
intended recipient/s and may contain material that is CONFIDENTIAL AND
PRIVATE COMPANY INFORMATION. Any review or reliance by others or copying or
distribution or forwarding of any or all of the contents in this message is
STRICTLY PROHIBITED. If you are not the intended recipient, please contact
the sender by email and delete all copies; your cooperation in this regard
is appreciated.
**************************************************************************
