Return-Path: <lembark@wrkhors.com>
Date: Wed, 11 Jul 2001 10:15:13 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Question about LVM
Message-ID: <237260000.994864512@dizzy>
In-Reply-To: <Pine.LNX.4.31L2.0107110613260.30807-100000@theendoftime.net>
References: <Pine.LNX.4.31L2.0107110613260.30807-100000@theendoftime.net>
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

- fox@theendoftime.net on 07/11/01 06:43:09 -0600:

> Hi;
> 
> I ran into this issue with AIX lvm.  A hard drive died and the IBM
> hardware monkeys removed the drive before mirroring could be broken
> (removing lv copies down to one, and reducing the volume group by the one
> dead drive)
> 
> However, because the drive had been removed before this could be done, the
> VGDA still had the old PVID of the old hdisk and would not let me remove
> it by the cannonical hdisk name.  The eventual solution was to run the
> rmlvcopy command and reducevg command with the PVID instead of the
> cannonical hdisk name.  There is no such command as rmlvcopy (or anything
> related as far as I can tell with Linux) but the reducevg is the same as
> vgreduce.  I am wondering if it's possible for a PV to be removed from the
> VG in such a way that the PV path (device name?) no longer exists in the
> system and thus, you wouldn't be able to do a vgreduce with the PV path
> (device name?)  In this case, is it possible to run the vgreduce command
> with the PVID of the removed drive?  Or does the Linux LVM handle this
> automagically?  Is this even a possible case under Linux?  I have to admit
> I'm still new to the Linux LVM after having worked with AIX LVM for years
> now.

Usual fix for this is to export the VG and re-import it w/
the required PV's.  At that point your VG comes back with 
a legit set of disks.  Then you can vgextent onto the new
device.

sl
