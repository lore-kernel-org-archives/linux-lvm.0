Date: Fri, 07 Sep 2001 16:21:01 +0100
From: "Svetoslav  Dimitrov Slavtchev" <svetljo@lycos.com>
Message-ID: <JODHKCECKGHOLAAA@mailcity.com>
Mime-Version: 1.0
Content-Language: en
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)-2.4.7
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

well
i have it working with JFS and XFS but i can not format the LV with ext2 and reiserfs

and i've tested it with
vanila 2.4.7 lvm-1.0.1rc2
vanila 2.4.9 lvm-1.0.1rc1
Alan Cox's 2.4.9-ac5 lvm-1.0
XFS cvs kernels 2.4.9-xfs lvm-1.0.1rc1
                2.4.10-pre2-xfs lvm-1.0.1rc2
                2.4.10-pre4-xfs lvm-1.0.1rc2
i'll try it ( hopefully after 2h) with 
vanila 2.4.4 
the VG:
/dev/hdh10
/dev/md6 linear software RAID
/dev/md7 linear software RAID
the LV's are striped over the 3 devices

and i had it working some time ago 
on software RAID-0 with lvm-0.9beta6
XFS progs from the cvs tree
JFS progs 1.0.3
reiserfs 3.x.0j
e2fsprogs 1.23 1.24 1.24a

---
Svetoslav Dimitrov Slavtschev
svetoslav@mail.com
svetljo@mailcity.com



Get 250 color business cards for FREE!
http://businesscards.lycos.com/vp/fastpath/
