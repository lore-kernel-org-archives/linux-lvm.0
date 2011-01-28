Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0SGpSKN005229
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2011 11:51:29 -0500
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id p0SGpQM9017038
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2011 11:51:27 -0500
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id ECDB412E195
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2011 17:51:22 +0100 (CET)
Message-ID: <80ABFFF7E55A40E3B3D3CA3CAE20A11D@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <4D41B887.2050507@lakedaemon.net>
Date: Fri, 28 Jan 2011 17:51:22 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Hang/Crash during resize2fs after adding new PV
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello

I'm somewhat a newbie at LVM and have encountered a real problem for me.
during resize2fs after extending my LV i ended up with a crash. Now I'm 
worried I have lost all my old data.
How can i proceed to get the volume in working order?
Any help would be greatly appreciated.

NoFear ~ # lvextend -L+400G /dev/vgftp/lvftp
  Extending logical volume lvftp to 4.16 TiB
  Logical volume lvftp successfully resized
NoFear ~ # umount /dev/vgftp/lvftp
NoFear ~ # resize2fs /dev/vgftp/lvftp
resize2fs 1.41.10 (10-Feb-2009)
Please run 'e2fsck -f /dev/vgftp/lvftp' first.

NoFear ~ # e2fsck -f /dev/vgftp/lvftp
e2fsck 1.41.10 (10-Feb-2009)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
Block bitmap differences:  +21741823 +21741951 +21742207 +21742973 +21742975 
+21743102 +21743231 +21743484 +21743487 +21743612 +21743615 +21743740 
+21743868 +21744125 +21744127 +21744639 +21745149 +21746047 +21746559 
+21746687 +21746942 +21747327 +21747710 +21747967 +21748092 +21748223 
+21748735 +(21748990--21748991) +21749118 +(21749372--21749373) +21749501 
+21749503 +21749887 +21750143 +21750398 +21750655 +21750909 +21751037 
+21751165 +(21751549--21751550) +21751676 +21751807 +21751934
Fix<y>? yes

Block bitmap differences:  +33341823 +33343103 +33343356 +33343359 +33343484 
+33343487 +33343612 +33343740 +33343997 +33343999 +33345919 +33346431 
+33346559 +33346814 +33347199 +33347582 +33347839 +33348095 +33348607 
+33348862 +(33349244--33349245) +33349373 +33349759 +33350015 +33350781 
+33350909 +33351037 +33351422y^Hy
 +33351679
Fix<y>? yes

---- SNIPP ----

Block bitmap differences:  +26067327 +26068607 +26068860 +26068863 +26068988 
+26068991 +26069116 +26069244 +26069501 +26069503 +26071423 +26071935 
+26072063 +26072318 +26072703 +26073343 +26073599 +26074111 +26074366 
+(26074748--26074749) +26074877 +26075263 +26075519 +26076285 +26076413 
+26076541 +26077183
Fix<y>? yes


/dev/vgftp/lvftp: ***** FILE SYSTEM WAS MODIFIED *****
/dev/vgftp/lvftp: 308343/505479168 files (18.3% non-contiguous), 
1006593162/1010942976 blocks

NoFear ~ # e2fsck -f /dev/vgftp/lvftp
e2fsck 1.41.10 (10-Feb-2009)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/vgftp/lvftp: 308343/505479168 files (18.3% non-contiguous), 
1006593162/1010942976 blocks
NoFear ~ # resize2fs /dev/vgftp/lvftp
resize2fs 1.41.10 (10-Feb-2009)
Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k) blocks.
** CRASH / HANG **

25hours waiting and nothing happens. No disk io going on or anything.
I have no backups or anythin of this volume. What can i do do revert the 
process to get the disks back? I have not done anything at all after the 
crash/hang in fear of destroying something.

Thanks for any input
/Fredrik Skog 
