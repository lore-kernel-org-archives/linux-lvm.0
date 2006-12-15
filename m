Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBFGaFTC027080
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 11:36:16 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.230])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBFGaEh4009051
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 11:36:15 -0500
Received: by wx-out-0506.google.com with SMTP id s11so1003007wxc
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 08:36:14 -0800 (PST)
Message-ID: <d0438a1f0612150836x55199571x14d815c78a7b4a11@mail.gmail.com>
Date: Fri, 15 Dec 2006 17:36:13 +0100
From: "a a" <jan.corba@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_123803_33487191.1166200573910"
Subject: [linux-lvm] lvconvert and create mirror for root fs
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
To: linux-lvm@redhat.com

------=_Part_123803_33487191.1166200573910
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I tried create mirror for root fs - lvol1.

dunco:~# lvs
  LV    VG   Attr   LSize   Origin Snap%  Move Log Copy%
  lvol1 vg00 -wi-ao 200.00M
  lvol2 vg00 -wi-ao   1.00G
  lvol3 vg00 -wi-ao 644.00M
  lvol4 vg00 -wi-ao 400.00M
  lvol5 vg00 -wi-ao 100.00M
  lvol6 vg00 -wi-ao   1.00G
  lvol7 vg00 mwi-a-  52.00M                         46.15
dunco:~#

I ran lvconvert -dv -m 1 --corelog /dev/vg00/lvol1 /dev/hda2
    Checking for existing volume group "vg00"
    Archiving volume group "vg00" metadata (seqno 40).
    Creating logical volume lvol1_mimage_0
    Creating logical volume lvol1_mimage_1
    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 41).
    Found volume group "vg00"
    Found volume group "vg00"
    Creating vg00-lvol1_mimage_0
    Loading vg00-lvol1_mimage_0 table
    Resuming  (253:7)
    Creating vg00-lvol1_mimage_1
    Loading vg00-lvol1_mimage_1 table
    Resuming  (253:8)
    Loading vg00-lvol1 table
    Suspending vg00-lvol1 (253:0)

And after that lvconvert hanging. I used strace and I found that command
hanging on fsync

...
write(2, "Suspending vg00-lvol1 (253:0)", 29Suspending vg00-lvol1 (253:0)) =
29
write(2, "\n", 1
)                       = 1
ioctl(3, DM_DEV_SUSPEND, 0x8116918)     = 0
rename("/etc/lvm/metadata/vg00.tmp", "/etc/lvm/metadata/vg00") = 0
stat64("/etc/lvm/metadata/vg00.tmp", 0xbf9f8464) = -1 ENOENT (No such file
or directory)
open("/etc/lvm/metadata", O_RDONLY|O_LARGEFILE) = 7
fsync(7


I tried to create mirror on another lvols and I can do it.

OS : Debian etch

Disk /dev/hda: 20.0 GB, 20020396032 bytes
255 heads, 63 sectors/track, 2434 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1           8       64228+  fd  Linux raid
autodetect
/dev/hda2               9        2434    19486845   8e  Linux LVM

Disk /dev/hdc: 30.0 GB, 30020272128 bytes
255 heads, 63 sectors/track, 3649 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdc1   *           1           7       56196   fd  Linux raid
autodetect
/dev/hdc2               8        3649    29254365   8e  Linux LVM


dunco:/usr/src/LVM2.2.02.17# lvdisplay --version
  LVM version:     2.02.17 (2006-12-14)
  Library version: 1.02.13 (2006-11-28)
  Driver version:  4.7.0
dunco:/usr/src/LVM2.2.02.17#

Can you tell me where is problem?
Thanks,
John

------=_Part_123803_33487191.1166200573910
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br>I tried create mirror for root fs - lvol1.<br><br>dunco:~# lvs<br>&nbsp; LV&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp;&nbsp; Origin Snap%&nbsp; Move Log Copy%<br>&nbsp; lvol1 vg00 -wi-ao 200.00M<br>&nbsp; lvol2 vg00 -wi-ao&nbsp;&nbsp; 1.00G<br>&nbsp; lvol3 vg00 -wi-ao 644.00M
<br>&nbsp; lvol4 vg00 -wi-ao 400.00M<br>&nbsp; lvol5 vg00 -wi-ao 100.00M<br>&nbsp; lvol6 vg00 -wi-ao&nbsp;&nbsp; 1.00G<br>&nbsp; lvol7 vg00 mwi-a-&nbsp; 52.00M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 46.15<br>dunco:~#<br><br>I ran lvconvert -dv -m 1 --corelog /dev/vg00/lvol1 /dev/hda2
<br>&nbsp;&nbsp;&nbsp; Checking for existing volume group &quot;vg00&quot;<br>&nbsp;&nbsp;&nbsp; Archiving volume group &quot;vg00&quot; metadata (seqno 40).<br>&nbsp;&nbsp;&nbsp; Creating logical volume lvol1_mimage_0<br>&nbsp;&nbsp;&nbsp; Creating logical volume lvol1_mimage_1<br>
&nbsp;&nbsp;&nbsp; Creating volume group backup &quot;/etc/lvm/backup/vg00&quot; (seqno 41).<br>&nbsp;&nbsp;&nbsp; Found volume group &quot;vg00&quot;<br>&nbsp;&nbsp;&nbsp; Found volume group &quot;vg00&quot;<br>&nbsp;&nbsp;&nbsp; Creating vg00-lvol1_mimage_0<br>&nbsp;&nbsp;&nbsp; Loading vg00-lvol1_mimage_0 table
<br>&nbsp;&nbsp;&nbsp; Resuming&nbsp; (253:7)<br>&nbsp;&nbsp;&nbsp; Creating vg00-lvol1_mimage_1<br>&nbsp;&nbsp;&nbsp; Loading vg00-lvol1_mimage_1 table<br>&nbsp;&nbsp;&nbsp; Resuming&nbsp; (253:8)<br>&nbsp;&nbsp;&nbsp; Loading vg00-lvol1 table<br>&nbsp;&nbsp;&nbsp; Suspending vg00-lvol1 (253:0)<br><br>And after that lvconvert hanging. I used strace and I found that command hanging on fsync
<br><br>...<br>write(2, &quot;Suspending vg00-lvol1 (253:0)&quot;, 29Suspending vg00-lvol1 (253:0)) = 29<br>write(2, &quot;\n&quot;, 1<br>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 1<br>ioctl(3, DM_DEV_SUSPEND, 0x8116918)&nbsp;&nbsp;&nbsp;&nbsp; = 0<br>rename(&quot;/etc/lvm/metadata/vg00.tmp&quot;, &quot;/etc/lvm/metadata/vg00&quot;) = 0
<br>stat64(&quot;/etc/lvm/metadata/vg00.tmp&quot;, 0xbf9f8464) = -1 ENOENT (No such file or directory)<br>open(&quot;/etc/lvm/metadata&quot;, O_RDONLY|O_LARGEFILE) = 7<br>fsync(7<br><br><br>I tried to create mirror on another lvols and I can do it.
<br><br>OS : Debian etch<br><br>Disk /dev/hda: 20.0 GB, 20020396032 bytes<br>255 heads, 63 sectors/track, 2434 cylinders<br>Units = cylinders of 16065 * 512 = 8225280 bytes<br><br>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System
<br>/dev/hda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64228+&nbsp; fd&nbsp; Linux raid autodetect<br>/dev/hda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2434&nbsp;&nbsp;&nbsp; 19486845&nbsp;&nbsp; 8e&nbsp; Linux LVM<br><br>Disk /dev/hdc: 30.0 GB, 30020272128 bytes<br>255 heads, 63 sectors/track, 3649 cylinders
<br>Units = cylinders of 16065 * 512 = 8225280 bytes<br><br>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>/dev/hdc1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 56196&nbsp;&nbsp; fd&nbsp; Linux raid autodetect<br>/dev/hdc2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3649&nbsp;&nbsp;&nbsp; 29254365&nbsp;&nbsp; 8e&nbsp; Linux LVM
<br><br><br>dunco:/usr/src/LVM2.2.02.17# lvdisplay --version<br>&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.17 (2006-12-14)<br>&nbsp; Library version: 1.02.13 (2006-11-28)<br>&nbsp; Driver version:&nbsp; 4.7.0<br>dunco:/usr/src/LVM2.2.02.17#<br><br>Can you tell me where is problem?
<br>Thanks,<br>John<br>

------=_Part_123803_33487191.1166200573910--
