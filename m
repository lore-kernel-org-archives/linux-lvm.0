Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5E0imu12978
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 20:44:48 -0400
Received: from web32002.mail.mud.yahoo.com (web32002.mail.mud.yahoo.com
	[68.142.207.99])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j5E0igmK026772
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 20:44:43 -0400
Message-ID: <20050614004437.19422.qmail@web32002.mail.mud.yahoo.com>
Date: Mon, 13 Jun 2005 17:44:37 -0700 (PDT)
From: Olivier Eymere <olivier_eymere@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgreduce --removemissing does not remove missing
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
To: linux-lvm@redhat.com

We have had a disk failure and are trying to recover
what we can.  Having seen that there were major disk
problems we were running pvmove but, alas, it never
finished.  I don't care that much about the data on
the disk but I am puzzled as to why 'vgreduce
--removemissing' reports that it is removing logical
volumes but does not actually seem to do anything. 
When I run vgscan this is what I get:

Reading all physical volumes.  This may take a
while...
/dev/cdrom: open failed: No medium found
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Couldn't find all physical volumes for volume group
VolGroup00.
Volume group "VolGroup00" not found
Found volume group "VolGroup01" using metadata type
lvm2

Then I run:
vgreduce --verbose --removemissing VolGroup00
Finding volume group "VolGroup00"
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Couldn't find all physical volumes for volume group
VolGroup00.
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Archiving volume group "VolGroup00" metadata.
VolGroup00/pvmove0 has missing extents: removing
(including dependencies)
Deactivating (if active) logical volume pvmove0
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Found volume group "VolGroup00"
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Found volume group "VolGroup00"
Removing LV pvmove0 from VG VolGroup00
VolGroup00/pvmove0 has missing extents: removing
(including dependencies)
Deactivating (if active) logical volume pvmove0
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Found volume group "VolGroup00"
Couldn't find device with uuid
'Ay85t2-628y-fE0f-js0t-8RO4-WAy4-9qbaZy'.
Found volume group "VolGroup00"
Removing LV pvmove0 from VG VolGroup00

It looks to me that it is removing the pvmove0 LV but
when I run vgscan again it says the same thing about
not finding device with uuid ...  Am I not
understanding what vgreduce is trying to do or should
that pv have been removed?




		
__________________________________ 
Discover Yahoo! 
Find restaurants, movies, travel and more fun for the weekend. Check it out! 
http://discover.yahoo.com/weekend.html 
