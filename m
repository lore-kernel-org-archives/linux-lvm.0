Return-Path: <lembark@wrkhors.com>
Message-ID: <3AFB9CB4.DEFEC342@wrkhors.com>
Date: Fri, 11 May 2001 03:03:00 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit> <20010509093510.B4918@sistina.com>
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

> Steps needed (crossing your fingers that the flaky drive can still stand this):

q:  any known way to just dump the lv's out to tape?  problem
w/ pvmove is that you have to update data stored on the flakey
device.

another out might be to:

 - grab a spare disk.
 - create an equally-sized partition.
 - try to software mirror it.

if the mirror succeeds then you can just pretend the flakey 
drive died and replace it normally.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
