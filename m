Return-Path: <bcorsello@usa.net>
Date: Sun, 07 Jan 2001 16:23:50 -0500
From: Brad Corsello <bcorsello@usa.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: bcorsello@usa.net
Message-ID: <0ada40824210711NYCSMTP2@nyc.rr.com>
Subject: [linux-lvm] vgcfgrestore bug followup
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

Following up on my own post, I seem to have solved my problem by editing the
vg data in the first physical volume with a hex editor, adding the uuid of the
second PV where it was supposed to be.  Once I did that, vgscan ran
successfully and found the volume group.  But I think this just proves
vgcfgrestore is not restoring the uuid list to disk properly.

(But then I pushed my luck and tried doing vgextends.  After adding three PVs,
vgscan started to throw up with a weird error:  vg_read_with_pv_and_lv():
allocated LE of LV" can't get data of volume group "vg1" from physical
volume(s).  I don't know if this is related to the vgcfgrestore problem or
not.)
