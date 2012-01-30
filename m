Message-ID: <0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <4F26BE81.7040608@redhat.com>
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<4F26BE81.7040608@redhat.com>
Date: Mon, 30 Jan 2012 11:25:54 -0500
From: "James B. Byrne" <byrnejb@harte-lyne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot delete lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: "James B. Byrne" <byrnejb@harte-lyne.ca>, LVM general discussion and development <linux-lvm@redhat.com>


On Mon, January 30, 2012 11:00, Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01/30/2012 03:44 PM, James B. Byrne wrote:
>> It was suggested on the centos-virt mailing list that I
>> try using
>> dmsetup to suspend this device:
>>
>> [root@vhost01 ~]# dmsetup suspend vg_vhost01-lv_vm_base
>> [root@vhost01 ~]# [root@vhost01 ~]# dmsetup info -c
>> vg_vhost01-lv_vm_base Name                  Maj Min Stat
>> Open Targ
>> Event  UUID vg_vhost01-lv_vm_base 253   5 L-sw    2    1
>>      0
>> LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52
>>
>>
> [root@vhost01 ~]#
>
> Just suspending isn't going to help. Device-mapper allows
> you to
> suspend a device, replace its definition (table) with a
> new one and
> then resume it - on occasion this can be useful to allow
> you to
> replace a device with a fake layer that always returns I/O
> errors (it
> will cause outstanding I/O to fail and "unstick" any apps
> that were
> blocked on the device).
>
> This doesn't seem to be one of those cases however since
> your problem
> is that something has the device open rather than that
> access to the
> device itself blocks.
>
>> However, now when I run lvremove, the command simply
>> becomes
>> unresponsive and does not return, even when a ^C
>> interrupt is
>> attempted.
>
> That's because the device is suspended (all I/O will
> block). Resume it
> and the lvremove will complete (with the same error as
> before).
>
> # dmsetup resume <dev>
>
Done, blocking cleared and session returned.

>
> You need to find out what has them open and get it to
> close them. If
> the VMs have really been shut down then they should have
> closed the
> devices already - run lsof to check that no qemu-kvm
> processes are
> using them (but resume your LV first to avoid lsof
> blocking..).
>
> Since these are VM images though I guess you may have some
> partition mappings for them created by kpartx.
>
> Examine the device dependencies with dmsetup ls --tree or
> lsblk:

[root@vhost01 ~]# dmsetup resume vg_vhost01-lv_vm_base
[root@vhost01 ~]# dmsetup ls --tree
vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p1 (253:10)
 &#9492;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00
(253:6)
    &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01p1 (253:9)
 &#9492;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01
(253:7)
    &#9492;&#9472; (8:2)
vg_vhost01-lv_swap (253:1)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_root (253:0)
 &#9492;&#9472; (8:2)

---> this is a problem instance
vg_vhost01-lv_vm_basep2 (253:18)
 &#9492;&#9472;vg_vhost01-lv_vm_base (253:5)
    &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_basep1 (253:17)
 &#9492;&#9472;vg_vhost01-lv_vm_base (253:5)
    &#9492;&#9472; (8:2)
<---

vg_vhost01-lv_centos_repos (253:8)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_tmp (253:2)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet02.harte--lyne.ca_00 (253:21)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet03.harte--lyne.ca_00 (253:23)
 &#9492;&#9472; (8:2)

---> This is a problem instance
vg_vhost01-lv_vm_pas.harte--lyne.cap2 (253:16)
 &#9492;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca (253:12)
    &#9492;&#9472; (8:2)
<---

vg_vhost01-lv_log (253:4)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet04.harte--lyne.ca_00 (253:25)
 &#9492;&#9472; (8:2)

---> This is a problem instance
vg_vhost01-lv_vm_pas.harte--lyne.cap1 (253:15)
 &#9492;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca (253:12)
    &#9492;&#9472; (8:2)
<---

vg_vhost01-lv_spool (253:3)
 &#9492;&#9472; (8:2)

---> This is a prolem instance
vg_vhost01-lv_vm_pas.harte--lyne.ca_01p1 (253:14)
 &#9492;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca_01
(253:13)
    &#9492;&#9472; (8:2)
<---

vg_vhost01-lv_vm_inet08.harte--lyne.ca_00 (253:24)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet09.harte--lyne.ca_00 (253:22)
 &#9492;&#9472; (8:2)

---> This is a problem instance
vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p2 (253:11)
 &#9492;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00
(253:6)
    &#9492;&#9472; (8:2)
<---

[root@vhost01 ~]#

[root@vhost01 ~]# lsblk
NAME                                                      
    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sr0                                                       
     11:0    1     4G  0 rom
sda                                                       
      8:0    0 931.5G  0 disk
&#9500;&#9472;sda1                                        
                  8:1    0   500M  0 part /boot
&#9492;&#9472;sda2                                        
                  8:2    0   931G  0 part
  &#9500;&#9472;vg_vhost01-lv_root (dm-0)                 
                253:0    0  15.6G  0 lvm  /
  &#9500;&#9472;vg_vhost01-lv_swap (dm-1)                 
                253:1    0   7.8G  0 lvm  [SWAP]
  &#9500;&#9472;vg_vhost01-lv_tmp (dm-2)                  
                253:2    0   3.9G  0 lvm  /tmp
  &#9500;&#9472;vg_vhost01-lv_spool (dm-3)                
                253:3    0   7.8G  0 lvm  /var/spool
  &#9500;&#9472;vg_vhost01-lv_log (dm-4)                  
                253:4    0   7.8G  0 lvm  /var/log
  &#9500;&#9472;vg_vhost01-lv_vm_base (dm-5)              
                253:5    0   7.8G  0 lvm
  &#9474; &#9500;&#9472;vg_vhost01-lv_vm_basep1 (dm-17)   
                      253:17   0   500M  0 dm
  &#9474; &#9492;&#9472;vg_vhost01-lv_vm_basep2 (dm-18)   
                      253:18   0   7.3G  0 dm
  &#9500;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00
(dm-6)      253:6    0   7.8G  0 lvm
  &#9474;
&#9500;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p1
(dm-10) 253:10   0   500M  0 dm
  &#9474;
&#9492;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p2
(dm-11) 253:11   0   7.3G  0 dm
  &#9500;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01
(dm-7)      253:7    0  31.3G  0 lvm
  &#9474;
&#9492;&#9472;vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01p1
(dm-9)  253:9    0  31.3G  0 dm
  &#9500;&#9472;vg_vhost01-lv_vm_inet02.harte--lyne.ca_00
(dm-21)          253:21   0  31.3G  0 lvm
  &#9500;&#9472;vg_vhost01-lv_vm_inet08.harte--lyne.ca_00
(dm-24)          253:24   0  62.5G  0 lvm
  &#9500;&#9472;vg_vhost01-lv_centos_repos (dm-8)         
                253:8    0    64G  0 lvm  /var/data/
  &#9500;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca
(dm-12)                253:12   0   7.8G  0 lvm
  &#9474;
&#9500;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.cap1
(dm-15)            253:15   0   500M  0 dm
  &#9474;
&#9492;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.cap2
(dm-16)            253:16   0   7.3G  0 dm
  &#9500;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca_01
(dm-13)             253:13   0  62.5G  0 lvm
  &#9474;
&#9492;&#9472;vg_vhost01-lv_vm_pas.harte--lyne.ca_01p1
(dm-14)         253:14   0  62.5G  0 dm
  &#9500;&#9472;vg_vhost01-lv_vm_inet09.harte--lyne.ca_00
(dm-22)          253:22   0  31.3G  0 lvm
  &#9500;&#9472;vg_vhost01-lv_vm_inet03.harte--lyne.ca_00
(dm-23)          253:23   0  31.3G  0 lvm
  &#9492;&#9472;vg_vhost01-lv_vm_inet04.harte--lyne.ca_00
(dm-25)          253:25   0  31.3G  0 lvm


> In this case I have an LV named vg_mother/lv_t0 that
> has a single kpartx partition mapping.
>
> If this is the case on your LV you can remove these
> mappings with
> "kpartx -d <dev>" where <dev> is the whole LV device.

At this point I could use a little more guidance.  I wish
to remove all the lvs associated with the following
defunct vm guests:

base  <--- guest name
  vg_vhost01-lv_vm_base (dm-5)
  vg_vhost01-lv_vm_basep1 (dm-17)
  vg_vhost01-lv_vm_basep2 (dm-18)

pas.harte--lyne.ca  <--- guest name
  vg_vhost01-lv_vm_pas.harte--lyne.ca (dm-12)
  vg_vhost01-lv_vm_pas.harte--lyne.cap1 (dm-15)
  vg_vhost01-lv_vm_pas.harte--lyne.cap2 (dm-16)
  vg_vhost01-lv_vm_pas.harte--lyne.ca_01 (dm-13)
  vg_vhost01-lv_vm_pas.harte--lyne.ca_01p1 (dm-14)

pgsql--dbms.harte--lyne.ca  <--- guest name
  vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00 (dm-6)
  vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p1 (dm-10)
  vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p2 (dm-11)
  vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01 (dm-7)
  vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01p1 (dm-9)


-- 
***          E-Mail is NOT a SECURE channel          ***
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
