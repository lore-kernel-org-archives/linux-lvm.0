Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAO24Skc014093
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 21:04:28 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAO24RPu001394
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 21:04:27 -0500
Received: by wx-out-0506.google.com with SMTP id s11so730771wxc
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 18:04:27 -0800 (PST)
Message-ID: <be7468bb0611231804t52eae9fejca8888109001c098@mail.gmail.com>
Date: Fri, 24 Nov 2006 10:04:26 +0800
From: "roderick tapang" <retapang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] rhel4 u4 lvm2 changes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

hi,

i installed RHEL4 update 4 (2.6.9-42.ELsmp) on an HP BL45p (AMD64). i
then added 4 EMC hosted disks on it:

/dev/emcpowerb    lx0060data00vg lvm2 a-   50.00G 24.00G
  /dev/emcpowerc    lx0060data00vg lvm2 a-   50.00G 24.00G
  /dev/emcpowerd    lx0060data00vg lvm2 a-   50.00G 24.00G
  /dev/emcpowere    lx0060data00vg lvm2 a-   50.00G 24.00G

i've create a couple of ext3 FS on this VG (LV striped across the
disks). everytime  i restart the system, i end up with the file system
repair prompt - the tw FS can't be mounted as the
PVs can't be seen.
i removed the entries in /etc/fstab. it appears that the PVs are not
being activated automatically during reboot. i had to do a:

lvmdiskcan
vgchange lx0060data00vg -ay

only then i can mount the FS.

/dev/mapper/lx0060data00vg-lx0060lvdata00   99G   92M   94G   1% /staging
/dev/mapper/lx0060data00vg-lx0060lvdata01  4.0G  1.9G  1.9G  51% /apps


 i have 6 other similar blade systems with  EMC disks allocated the
same way and they are all running RHEL4 update 3. but i never had this
kind of issue. are there any changes in the LVM2 activation during
bootup in update4?
i didn't find anything related to this in the release notes of update4
so i was hoping that someone could enlighten me on this. :)

many thanks.

erik
-- 
roderick e. tapang, nclp
retapang at gmail dot com

(o_.'       http://counter.li.org/
//\         ----------------------
V_/_        Linux User   #  253842
