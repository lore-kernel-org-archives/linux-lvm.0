Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] LVM vgscan problems
References: <MPEBLKGAGHMJAPMMNPGGAEAJCAAA.jmoser@erc.wisc.edu>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 11 May 2001 14:07:47 +0200
In-Reply-To: "John Moser"'s message of "Fri, 11 May 2001 06:45:36 -0500"
Message-ID: <wvr8xwdr70.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "John" == John Moser <jmoser@erc.wisc.edu> writes:

    John> After having a bit of success with LVM under Linux (kernel
    John> 2.4, LVM version 0.9) over the past couple of months, I've
    John> encountered this problem on a reboot of my LVM-enabled
    John> machine:

    John> root@computer:/etc# vgscan -v vgscan -- removing
    John> "/etc/lvmtab" and "/etc/lvmtab.d" vgscan -- reading all
    John> physical volumes (this may take a while...)  vgscan --
    John> scanning for all active volume group(s) first vgscan --
    John> found inactive volume group "test " vgscan -- reading data
    John> of volume group "test" from physical volume(s) vgscan --
    John> ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't
    John> get data of volume group "test" from physical volume(s)
    John> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of
    John> LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

    John> Does anyone know how to fix this?  Or what might cause it?
    John> There's critical data on the filesystem, and I'd like to get
    John> it back up and running asap.

Note I'm a LVM newbie so possibly may be of little help, but some
standard questions :-

- anything else in your logs, hardware, SCSI problems

- which 2.4, from what I gather, anything before 2.2.4 has problems in
  various places (not LVM)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
