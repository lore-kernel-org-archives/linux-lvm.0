Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3JKJ1j15218
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 16:19:01 -0400
Received: from vanessa.wronline.net (vanessa.wronline.net [80.65.41.2])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3JKJ0JW012384
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 16:19:00 -0400
Date: Mon, 19 Apr 2004 22:22:22 +0200
Subject: [PATCH] fix list_devices() (was: Re: [linux-lvm] limit of 9 active
	LVs w/ LVM2?)
Message-ID: <20040419202222.GA2618@delusion.wronline.net>
References: <20031222003854.GA30300@delusion.wronline.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20031222003854.GA30300@delusion.wronline.net>
From: Stefan Paletta <stefanp@cabal1.com>
Reply-To: Stefan Paletta <stefanp-exp-1083010943.647821@cabal1.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In December I reported a problem with seemingly being unable to
activate more than nine LVs. There were no answers. Yesterday I
tracked this down. It's real, but it's different. 

list_devices() in dm-ioctl.c forgets to take into account the
terminating null for nl->name when calculating needed (although it
does later in line 400 when actually filling the structs).
Usually there would be one from the padding overhead, but ctl_ioctl()
chops off the last byte when copying the ioctl argument back to user
then.

The effect is (after creating 10 LVs, lvtest0 to lvtest9, in vg00):

# lvm vgchange -ay
  9 logical volume(s) in volume group "vg00" now active
# lvm lvs
LV      VG   Attr   LSize   Origin Snap%  Move Move%
lvtest0 vg00 -wn--- 200.00M
lvtest1 vg00 -wn-a- 200.00M
lvtest2 vg00 -wn-a- 200.00M
lvtest3 vg00 -wn-a- 200.00M
lvtest4 vg00 -wn-a- 200.00M
lvtest5 vg00 -wn-a- 200.00M
lvtest6 vg00 -wn-a- 200.00M
lvtest7 vg00 -wn-a- 200.00M
lvtest8 vg00 -wn-a- 200.00M
lvtest9 vg00 -wn-a- 200.00M
# dmsetup ls
vg00-lvtest9    (254, 9)
vg00-lvtest8    (254, 8)
vg00-lvtest7    (254, 7)
vg00-lvtest6    (254, 6)
vg00-lvtest5    (254, 5)
vg00-lvtest4    (254, 4)
vg00-lvtest3    (254, 3)
vg00-lvtest2    (254, 2)
vg00-lvtest     (254, 1)

As you can see the last character of the name of the last active LV is
missing. This confuses lvm, which deactivates the LV it does not know
anything about.

Things work fine with my modification:

# lvm vgchange -ay
  10 logical volume(s) in volume group "vg00" now active
# lvm lvs
LV      VG   Attr   LSize   Origin Snap%  Move Move%
lvtest0 vg00 -wn-a- 200.00M
lvtest1 vg00 -wn-a- 200.00M
lvtest2 vg00 -wn-a- 200.00M
lvtest3 vg00 -wn-a- 200.00M
lvtest4 vg00 -wn-a- 200.00M
lvtest5 vg00 -wn-a- 200.00M
lvtest6 vg00 -wn-a- 200.00M
lvtest7 vg00 -wn-a- 200.00M
lvtest8 vg00 -wn-a- 200.00M
lvtest9 vg00 -wn-a- 200.00M
# dmsetup ls
vg00-lvtest9    (254, 9)
vg00-lvtest8    (254, 8)
vg00-lvtest7    (254, 7)
vg00-lvtest6    (254, 6)
vg00-lvtest5    (254, 5)
vg00-lvtest4    (254, 4)
vg00-lvtest3    (254, 3)
vg00-lvtest2    (254, 2)
vg00-lvtest1    (254, 1)
vg00-lvtest0    (254, 0)

Patch attached.
Not sure if there are other such cases in the code, but a quick look
did not turn up anything.

Comments?

-Stefan
-- 
 junior guru   SP666-RIPE     JID:stefanp@jabber.de.cw.net    SMP@IRC

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dm-ioctl.patch"

--- drivers/md/dm-ioctl.c.orig	2004-04-18 10:57:26.829987376 +0200
+++ drivers/md/dm-ioctl.c	2004-04-18 20:51:10.418378768 +0200
@@ -366,7 +366,7 @@
 	for (i = 0; i < NUM_BUCKETS; i++) {
 		list_for_each_entry (hc, _name_buckets + i, name_list) {
 			needed += sizeof(struct dm_name_list);
-			needed += strlen(hc->name);
+			needed += strlen(hc->name) + 1;
 			needed += ALIGN_MASK;
 		}
 	}

--wRRV7LY7NUeQGEoC--
