Return-Path: <lembark@wrkhors.com>
Message-ID: <3A620788.AA688305@wrkhors.com>
Date: Sun, 14 Jan 2001 14:09:44 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] error creating non-existant lv w/ 0.9.1-beta1, 2.4.0-test10
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

root@dizzy : /root # lvcreate -l256 vg00
lvcreate -- ERROR "File exists" creating VGDA for "/dev/vg00/lvol4" in
kernel

root@dizzy : /root # ls /dev/vg00/
group  lvol1  lvol2  lvol3




-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
