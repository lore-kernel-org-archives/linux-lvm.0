Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A746EC0.DDAC36B4@nortelnetworks.com>
Date: Sun, 28 Jan 2001 13:10:56 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: [linux-lvm] Follow-up 3: Help: lvm 0.9.1_beta3 oops (can't get my data)
Content-Transfer-Encoding: 7bit
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

vgck seems to think the both volume groups are consistent

[root@btexi0c1 /root]# vgck -v w0 
vgck -- locking logical volume manager
vgck -- using volume group(s) on command line
vgck -- checking volume group name "w0"
vgck -- checking existence of volume group "w0"
vgck -- reading volume group data for "w0" from lvmtab
vgck -- checking volume group consistency  of "w0" in lvmtab
vgck -- VGDA of "w0" in lvmtab is consistent
vgck -- reading volume group data for "w0" from physical volume(s)
vgck -- checking volume group consistency  of "w0" on physical volumes
vgck -- VGDA of "w0" on physical volumes is consistent
vgck -- unlocking logical volume manager

[root@btexi0c1 /root]# vgck -v w1
vgck -- locking logical volume manager
vgck -- using volume group(s) on command line
vgck -- checking volume group name "w1"
vgck -- checking existence of volume group "w1"
vgck -- reading volume group data for "w1" from lvmtab
vgck -- checking volume group consistency  of "w1" in lvmtab
vgck -- VGDA of "w1" in lvmtab is consistent
vgck -- reading volume group data for "w1" from physical volume(s)
vgck -- checking volume group consistency  of "w1" on physical volume
vgck -- VGDA of "w1" on physical volume is consistent
vgck -- unlocking logical volume manager

[root@btexi0c1 /root]#
