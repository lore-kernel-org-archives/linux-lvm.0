Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBC1ZqAZ001335
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 20:35:52 -0500
Received: from nycpsmtp01.online.weightwatchers.net (smtp1.weightwatchers.com
	[216.89.71.57])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBC1Zp6d023894
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 20:35:51 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 11 Dec 2006 20:35:45 -0500
Message-ID: <FFCAB2A80304DB40BBE766409E0D7F050855BCC5@nycpmbx01>
From: "Ohad Imer \(Consultant\)" <oimer@weightwatchers.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Q about NetApp Image Cloning of LVM
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

Good day,

I was wondering if anyone has experienced image based cloning
(especially using NetApp) of LVM volumes from one server to other. In
addition, some lower environment servers need to have the same
"original" volume mounted few times under different mount points as
multiple lower oracle environments are needed.

I was able to accomplish this and wanted to hear some feed back from the
group as there might be better ways to handle this, and also best ways
to remove the volumes once a refresh is needed.

For testing I created a 10GB lun, and mounted via LVM and EXT3 on the
original server - I then created a clone on the filer (netapp
controller) using the following command:

vol clone create ohad_clone -b ohadtest

And I mapped the new clowe "ohad_clone" to the new server. I then use
the NetApp utility 

qla2xxx_lun_rescan all  

to scan all the buses, and it also created the dm-multipath devices in
/dev/mapper. In this case it created mpath4. Since I am going to mount
multiple clones of the original lun on the same server, I need to change
the volume name and the UUID, and I accomplish this with the following:

[root@nyadebizdb03 backup]# pvchange -u /dev/mapper/mpath4
  Physical volume "/dev/dm-13" changed
  1 physical volume changed / 0 physical volumes not changed
[root@nyadebizdb03 backup]# vgrename ohadtest ohadtest3
  Volume group "ohadtest" successfully renamed to "ohadtest3"
[root@nyadebizdb03 backup]# vgchange -a y ohadtest3
  1 logical volume(s) in volume group "ohadtest3" now active

And then able to mount the volume.

[root@nyadebizdb03 backup]# mkdir /ohad3
[root@nyadebizdb03 backup]# mount /dev/ohadtest3/ohad-lv /ohad3

I then re-clone off of the original volume, and mount it in the same
steps changing the name to ohadtest2 and a new UUID, and so on... I was
able to mount 3 clones of the original LVM lun on a new server.

[root@nyadebizdb03 itadmin]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  VolGroup00   1   5   0 wz--n- 136.59G 32.00M
  n01fcfc02    1   1   0 wz--n- 120.01G     0
  n01stfc01    1   1   0 wz--n- 400.02G     0
  ohadtest     1   1   0 wz--n-  10.00G  7.50G
  ohadtest2    1   1   0 wz--n-  10.00G  7.50G
  ohadtest3    1   1   0 wz--n-  10.00G  7.50G
You have new mail in /var/spool/mail/root
[root@nyadebizdb03 itadmin]# lvs
  LV       VG         Attr   LSize   Origin Snap%  Move Log Copy%
  LogVol00 VolGroup00 -wi-ao  19.53G
  LogVol01 VolGroup00 -wi-ao  11.72G
  LogVol02 VolGroup00 -wi-ao   4.91G
  LogVol03 VolGroup00 -wi-ao   4.88G
  LogVol04 VolGroup00 -wi-ao  95.53G
  u01      n01fcfc02  -wi-ao 120.01G
  u02      n01stfc01  -wi-ao 400.02G
  ohad-lv  ohadtest   -wi-ao   2.50G
  ohad-lv  ohadtest2  -wi-ao   2.50G
  ohad-lv  ohadtest3  -wi-ao   2.50G
[root@nyadebizdb03 itadmin]#

Are there any additional suggestions, and also what would be the best
way to remove all the volumes? I used the dmsetup remove command to
delete the dm-multipath device and then remove the entries from LVM all
the *.vg.

Thank you in advance for your help!

Cheers,

Ohad
