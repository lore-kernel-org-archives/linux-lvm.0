Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Wed, 11 Jul 2001 12:25:53 -0500
Subject: RE: [linux-lvm] about to give up
Message-ID: <212820000.994872353@duke.wrkhors.com>
In-Reply-To: <85063BBE668FD411944400D0B744267A64338A@AUSMAIL>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


-- "Gonyou, Austin" <austin@coremetrics.com> on 07/11/01 10:30:10 -0500

> perhaps just blowing away your VG, then re-setting the volumes as PVs in
> that vg, then growing them one at a time?

blowing off the VG will loose data.

try:

    vgexport blah;
    vgimport blah PV PV PV;

Export will remove the vg from local disk but leave
the VG info on the platters.  Import will re-build 
the VG on the disk.

sl
