Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4VHKcWf028176
	for <linux-lvm@redhat.com>; Fri, 31 May 2013 13:20:39 -0400
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4VHKbug013555
	for <linux-lvm@redhat.com>; Fri, 31 May 2013 13:20:37 -0400
Received: by mail-pd0-f171.google.com with SMTP id z11so2542648pdj.30
	for <linux-lvm@redhat.com>; Fri, 31 May 2013 10:20:37 -0700 (PDT)
Received: from [10.10.102.70] (207.47.42.180.static.nextweb.net.
	[207.47.42.180]) by mx.google.com with ESMTPSA id
	ov2sm47456659pbc.34.2013.05.31.10.20.36 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 10:20:36 -0700 (PDT)
Message-ID: <51A8DBE4.607@gmail.com>
Date: Fri, 31 May 2013 10:20:36 -0700
From: Christian Lahti <clahti@gmail.com>
MIME-Version: 1.0
References: <51A79EEE.6020308@gmail.com>
In-Reply-To: <51A79EEE.6020308@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------020605080408050502090306"
Subject: Re: [linux-lvm] file-based locking initialization failed after
	pvresize
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------020605080408050502090306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I was assisted on the #lvm IRC channel by kabi_ (thank you), the 
solution for others who might find themselves in the same boat:

  * look in /etc/lvm/archive and find the file that has the information
    just prior to the destructive act
  * in this text file is a UUID for the volume that has been corrupted
  * boot into rescue disk (or single user mode if the corrupted disk is
    not your boot volume) and run the following
    pvcreate --config 'global{locking_type=0}' --uuid <UUID>
    --restorefile /etc/lvm/backup/<file containing previous info>
    /dev/<device>
    vgcfgrestore -f /etc/lvm/archive/<file containing previous info>
    <volume group name>

Thanks again!

/Christian

On 5/30/2013 11:48 AM, Christian Lahti wrote:
> Hello all:
>
> I have a VMWare virtual CentOS 6 server with the following disk layout:
>
> /dev/sda 15GB
> /dev/sdb 100GB
>
> Standard CentOS LVM setup
>
> on sda1
> /dev/vg_centos6/lv_root mounted on /
> /dev/vg_centos6/lv_swap
>
> on sdb1
> /dev/vg_centos6/lv_var mounted on /var
>
> I was starting to run low on disk space for /var, so I shut down the 
> machine gracefully, extended the disk in VMWare to 250G and rebooted 
> in single user mode. I then ran the following two commands:
>
> pvresize --setphysicalvolumesize 250G /dev/sdb1
> lvresize -L250G /dev/vg_centos6/lv_var
>
> I then rebooted expecting the /var to now be 250G instead of 100G. 
> What I got was:
>
> No such file or directory trying to open /dev/vg_centos6/lv_var
>
> After dropping to a maintenance shell I could not run any pv* or lv* 
> commands, always resulting in the error:
>
> File-based locking initialization failed
>
> After Googling forever I found some lv* and pv* commands take 
> --ignorelockingfailure as a parameter, so now I can "see" the pv and 
> lv information but I do not know how to recover this partition:
>
> pvdisplay --ignorelockingfailure /dev/sdb1
> File-based locking initialization failed
> --- Physical volume ---
> PV Name /dev/sdb1
> VG Name vg_centos6
> PV Size 250 GiB / not useable 3.00 MiB
> Allocatable yes
> PE Size 4.00 MiB
> Total PE 63999
> Free PE 25599
> Allocated PE 38400
>
> lvdisplay --ignorelockingfailure /dev/vg_centos6/lv_var
> File-based locking initialization failed
> --- Logical volume ---
> LV Path /dev/vg_centos6/lv_var
> LV Name lv_var
> VG Name vg_centos6
> LV Write Access read/write
> LV Status suspended
> # open 0
> LV Size 150.00 GiB
> Current LE 38400
> Segments 1
> Allocation inherit
> Read ahead sectors auto
> - currently set to 256
> Block device 253:2
>
> I cannot mount this, I cannot fsck, /dev/mapper/vg_centos6/lv_var does 
> not even get created. This is a critical server, can anyone please 
> tell me how to reverse this or at least recover the data?
>
> Thanks!
>
> /Christian


--------------020605080408050502090306
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">I was assisted on the #lvm IRC channel
      by kabi_ (thank you), the solution for others who might find
      themselves in the same boat:<br>
      <ul>
        <li>look in /etc/lvm/archive and find the file that has the
          information just prior to the destructive act</li>
        <li>in this text file is a UUID for the volume that has been
          corrupted</li>
        <li>boot into rescue disk (or single user mode if the corrupted
          disk is not your boot volume) and run the following<br>
          pvcreate --config 'global{locking_type=0}' --uuid &lt;UUID&gt;
          --restorefile /etc/lvm/backup/&lt;file containing previous
          info&gt; /dev/&lt;device&gt;<br>
          vgcfgrestore -f /etc/lvm/archive/&lt;file containing previous
          info&gt; &lt;volume group name&gt;</li>
      </ul>
      <p>Thanks again!<br>
      </p>
      <p>/Christian<br>
      </p>
      On 5/30/2013 11:48 AM, Christian Lahti wrote:<br>
    </div>
    <blockquote cite="mid:51A79EEE.6020308@gmail.com" type="cite">Hello
      all:
      <br>
      <br>
      I have a VMWare virtual CentOS 6 server with the following disk
      layout:
      <br>
      <br>
      /dev/sda 15GB
      <br>
      /dev/sdb 100GB
      <br>
      <br>
      Standard CentOS LVM setup
      <br>
      <br>
      on sda1
      <br>
      /dev/vg_centos6/lv_root mounted on /
      <br>
      /dev/vg_centos6/lv_swap
      <br>
      <br>
      on sdb1
      <br>
      /dev/vg_centos6/lv_var mounted on /var
      <br>
      <br>
      I was starting to run low on disk space for /var, so I shut down
      the machine gracefully, extended the disk in VMWare to 250G and
      rebooted in single user mode. I then ran the following two
      commands:
      <br>
      <br>
      pvresize --setphysicalvolumesize 250G /dev/sdb1
      <br>
      lvresize -L250G /dev/vg_centos6/lv_var
      <br>
      <br>
      I then rebooted expecting the /var to now be 250G instead of 100G.
      What I got was:
      <br>
      <br>
      No such file or directory trying to open /dev/vg_centos6/lv_var
      <br>
      <br>
      After dropping to a maintenance shell I could not run any pv* or
      lv* commands, always resulting in the error:
      <br>
      <br>
      File-based locking initialization failed
      <br>
      <br>
      After Googling forever I found some lv* and pv* commands take
      --ignorelockingfailure as a parameter, so now I can "see" the pv
      and lv information but I do not know how to recover this
      partition:
      <br>
      <br>
      pvdisplay --ignorelockingfailure /dev/sdb1
      <br>
      File-based locking initialization failed
      <br>
      --- Physical volume ---
      <br>
      PV Name /dev/sdb1
      <br>
      VG Name vg_centos6
      <br>
      PV Size 250 GiB / not useable 3.00 MiB
      <br>
      Allocatable yes
      <br>
      PE Size 4.00 MiB
      <br>
      Total PE 63999
      <br>
      Free PE 25599
      <br>
      Allocated PE 38400
      <br>
      <br>
      lvdisplay --ignorelockingfailure /dev/vg_centos6/lv_var
      <br>
      File-based locking initialization failed
      <br>
      --- Logical volume ---
      <br>
      LV Path /dev/vg_centos6/lv_var
      <br>
      LV Name lv_var
      <br>
      VG Name vg_centos6
      <br>
      LV Write Access read/write
      <br>
      LV Status suspended
      <br>
      # open 0
      <br>
      LV Size 150.00 GiB
      <br>
      Current LE 38400
      <br>
      Segments 1
      <br>
      Allocation inherit
      <br>
      Read ahead sectors auto
      <br>
      - currently set to 256
      <br>
      Block device 253:2
      <br>
      <br>
      I cannot mount this, I cannot fsck, /dev/mapper/vg_centos6/lv_var
      does not even get created. This is a critical server, can anyone
      please tell me how to reverse this or at least recover the data?
      <br>
      <br>
      Thanks!
      <br>
      <br>
      /Christian
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------020605080408050502090306--
