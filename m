Return-Path: <jens.bruckmann@suse.de>
Message-ID: <3A827F18.4B387240@suse.de>
Date: Thu, 08 Feb 2001 12:12:25 +0100
From: Jens Bruckmann <jens.bruckmann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Setup for RAID1 with LVM
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

Dear LVM-Specialists,

I would like to setup a configuration with LVM and RAID1. Poorly you
can't just do a lvextend -m 1 like on HP-UX :-))

I could not find any hints so far for a step by step description, the
part has to be included in the LVM-Howto.

I have two SCSI-Disks of nearly the same size, on Disk 1 I already have
a working installation of Linux.

/usr, /opt and /var reside on LVs. I want these three LVs to be mirrored
online to the second disk as it is possible on HP-UX.

Can someone shortly describe, how to setup such a configuration?


Thanks for help,

	Jens

-- 
-----------------------------------------------------------------------
Jens Bruckmann              .-.       Mail:    jens.bruckmann@suse.de
SuSE Linux Solutions AG     /v\       Phone:   +49 - 40 - 89 69 82 18
Friesenweg 5F              // \\      Fax:     +49 - 40 - 85 40 04 35
D-22763 Hamburg           /(   )\
                           ^^-^^      
-----------------------------------------------------------------------
