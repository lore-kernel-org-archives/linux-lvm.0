Return-Path: <lembark@wrkhors.com>
Date: Mon, 25 Jun 2001 07:35:23 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Why vgscan not in kernel?
Message-ID: <353310000.993472523@dizzy>
In-Reply-To: <20010625142337.A20142@sistina.com>
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

>> upon boot, SCSI and IDE drivers check harddrives attached to the device
>> for partitions. Wouldn't it be better to have similar functionality
>> (scanning for VG's) for LVM in the kernel, instead of using a userland
>> command?

It is rather dangerous unless you have a separate kernel w/o LVM or 
a boot option (e.g., -lm) that allows booting with LVM turned off.
Otherwise you can easily end up unable to reboot with a corrupt LVM
system. 
