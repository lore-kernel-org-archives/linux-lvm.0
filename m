Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0DErJVS010395
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2014 09:53:19 -0500
Received: from p01c11o149.mxlogic.net (p01c11o149.mxlogic.net [208.65.144.72])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0DErE3F027344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2014 09:53:14 -0500
Received: from EXHQ1.corp.stratus.com (exhq1.corp.stratus.com
	[134.111.200.125])
	by mailhub4.stratus.com (8.12.11/8.12.11) with ESMTP id s0DErDMs028949
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2014 09:53:13 -0500
Message-ID: <52D3FDD8.40309@stratus.com>
Date: Mon, 13 Jan 2014 09:53:12 -0500
From: Nate Dailey <nate.dailey@stratus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------030306070501080004000801"
Subject: [linux-lvm] LVM raid1 mirror: interrupted resync isn't handled well
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

--------------030306070501080004000801
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, looking for some guidance as to whether or not this is expected to 
work, and if I'm doing anything wrong or can make any changes to fix this.

I've found that if LVM raid1 resync is interrupted, the volume 
immediately comes up in sync when next activated, without actually 
copying the remainder of the data.

I've reproduced this several times on a system with the root FS on an 
LVM raid1 (note, this is not LVM on top of a separate MD raid1 device, 
it's an LVM raid1 mirror created with 'lvconvert -m1 --type raid1 ...'):

- remove a disk containing one leg of an LVM raid1 mirror
- do enough IO that a lengthy resync will be required
- shutdown
- insert the removed disk
- reboot
- on reboot, the volume is resyncing properly
- before resync completes, reboot again
- this time during boot, the volume is activated and no resync is performed

But here's an example showing the same thing happening with just a 
volume deactivate/activate:

# lvs
   LV VG      Attr       LSize  Pool Origin Data%  Move Log Cpy%Sync Convert
...
   testlv testvg rwi-a-r---  5.00g                                 4.84

# lvchange -an /dev/testvg/testlv

# lvchange -ay /dev/testvg/testlv

# lvs
   LV VG      Attr       LSize  Pool Origin Data%  Move Log Cpy%Sync Convert
...
   testlv testvg rwi-a-r---  5.00g                               100.00

Here's dmesg showing the start of resync:

md/raid1:mdX: active with 1 out of 2 mirrors
created bitmap (5 pages) for device mdX
mdX: bitmap initialized from disk: read 1 pages, set 4524 of 10240 bits
RAID1 conf printout:
  --- wd:1 rd:2
  disk 0, wo:0, o:1, dev:dm-18
  disk 1, wo:1, o:1, dev:dm-20
RAID1 conf printout:
  --- wd:1 rd:2
  disk 0, wo:0, o:1, dev:dm-18
  disk 1, wo:1, o:1, dev:dm-20
md: recovery of RAID array mdX
md: minimum _guaranteed_  speed: 4000 KB/sec/disk.
md: using maximum available idle IO bandwidth (but not more than 15000 
KB/sec) for recovery.
md: using 128k window, over a total of 5242880k.

And the interrupted sync:

md: md_do_sync() got signal ... exiting

And the reactivation without resuming resync:

md/raid1:mdX: active with 2 out of 2 mirrors
created bitmap (5 pages) for device mdX
mdX: bitmap initialized from disk: read 1 pages, set 3938 of 10240 bits


Can anyone offer any advice? Am I doing something wrong? Or is this just 
a bug?

This is the lvm version (though I also grabbed the latest lvm2 from 
git.fedorahosted.org and had the same problem):

   LVM version:     2.02.100(2)-RHEL6 (2013-09-12)
   Library version: 1.02.79-RHEL6 (2013-09-12)
   Driver version:  4.23.6

I can try to dig through the sources to try to find the problem (I have 
a fair amount of experience with MD debugging, none with LVM), but would 
appreciate any advice as to where to start (is this likely to be a 
problem in LVM, DM, MD, etc.).

Thanks!

Nate Dailey
Stratus Technologies


--------------030306070501080004000801
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Hi, looking for some guidance as to whether or not
      this is expected to work, and if I'm doing anything wrong or can
      make any changes to fix this.<br>
      <br>
      I've found that if LVM raid1 resync is interrupted, the volume
      immediately comes up in sync when next activated, without actually
      copying the remainder of the data.<br>
      <br>
      I've reproduced this several times on a system with the root FS on
      an LVM raid1 (note, this is not LVM on top of a separate MD raid1
      device, it's an LVM raid1 mirror created with 'lvconvert -m1
      --type raid1 ...'):<br>
      <br>
      - remove a disk containing one leg of an LVM raid1 mirror<br>
      - do enough IO that a lengthy resync will be required<br>
      - shutdown<br>
      - insert the removed disk<br>
      - reboot<br>
      - on reboot, the volume is resyncing properly<br>
      - before resync completes, reboot again<br>
      - this time during boot, the volume is activated and no resync is
      performed<br>
      <br>
      But here's an example showing the same thing happening with just a
      volume deactivate/activate:<br>
      <br>
      # lvs<br>
      &nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LSize&nbsp; Pool Origin Data%&nbsp; Move Log Cpy%Sync
      Convert<br>
      ...<br>
      &nbsp; testlv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      testvg rwi-a-r---&nbsp; 5.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.84&nbsp;&nbsp;&nbsp;&nbsp;
      <br>
      &nbsp;&nbsp; <br>
      # lvchange -an /dev/testvg/testlv<br>
      <br>
      # lvchange -ay /dev/testvg/testlv<br>
      <br>
      # lvs<br>
      &nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LSize&nbsp; Pool Origin Data%&nbsp; Move Log Cpy%Sync
      Convert<br>
      ...<br>
      &nbsp; testlv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      testvg rwi-a-r---&nbsp; 5.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100.00<br>
      <br>
      Here's dmesg showing the start of resync:<br>
    </font><br>
    <font size="-1">md/raid1:mdX: active with 1 out of 2 mirrors<br>
      created bitmap (5 pages) for device mdX<br>
      mdX: bitmap initialized from disk: read 1 pages, set 4524 of 10240
      bits<br>
      RAID1 conf printout:<br>
      &nbsp;--- wd:1 rd:2<br>
      &nbsp;disk 0, wo:0, o:1, dev:dm-18<br>
      &nbsp;disk 1, wo:1, o:1, dev:dm-20<br>
      RAID1 conf printout:<br>
      &nbsp;--- wd:1 rd:2<br>
      &nbsp;disk 0, wo:0, o:1, dev:dm-18<br>
      &nbsp;disk 1, wo:1, o:1, dev:dm-20<br>
      md: recovery of RAID array mdX<br>
      md: minimum _guaranteed_&nbsp; speed: 4000 KB/sec/disk.<br>
      md: using maximum available idle IO bandwidth (but not more than
      15000 KB/sec) for recovery.<br>
      md: using 128k window, over a total of 5242880k.<br>
      <br>
    </font><font size="-1">And the interrupted sync:</font><br>
    <br>
    <font size="-1">md: md_do_sync() got signal ... exiting</font><font
      size="-1"><br>
      <br>
      And the reactivation without resuming resync:<br>
      <br>
      md/raid1:mdX: active with 2 out of 2 mirrors<br>
      created bitmap (5 pages) for device mdX<br>
      mdX: bitmap initialized from disk: read 1 pages, set 3938 of 10240
      bits<br>
      <br>
      <br>
      Can anyone offer any advice? Am I doing something wrong? Or is
      this just a bug?<br>
      <br>
      This is the lvm version (though I also grabbed the latest lvm2
      from git.fedorahosted.org and had the same problem):<br>
      <br>
      &nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.100(2)-RHEL6 (2013-09-12)<br>
      &nbsp; Library version: 1.02.79-RHEL6 (2013-09-12)<br>
      &nbsp; Driver version:&nbsp; 4.23.6<br>
      <br>
      I can try to dig through the sources to try to find the problem </font><font
      size="-1">(I have a fair amount of experience with MD debugging,
      none with LVM)</font><font size="-1">, but would appreciate any
      advice as to where to start (is this likely to be a problem in
      LVM, DM, MD, etc.).<br>
      <br>
      Thanks!<br>
      <br>
      Nate Dailey<br>
      Stratus Technologies<br>
      <br>
    </font>
  </body>
</html>

--------------030306070501080004000801--
