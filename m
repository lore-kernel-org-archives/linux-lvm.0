Return-Path: <Evan.Day@SUMMITSITE.COM>
Message-ID: <DC5B1A21E9E7D211B0020090273AD628242BC4@summit15.corvallis.summit>
From: "Day, Evan" <Evan.Day@SUMMITSITE.COM>
Subject: RE: [linux-lvm] odd problem
Date: Tue, 1 May 2001 16:28:07 -0700 
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

From: Andreas Dilger [mailto:adilger@turbolinux.com]
>Todd Underwood writes:
>> VGS: Mounted root (ext2 filesystem) readonly.
>> change_root: old root has d_count=3
>> Trying to unmount old root ... <7>uhci.c: suspect_hd
>> okay
>
>Don't know about this.

Is he using a USB storage device?  Isn't uhci.c part of the USB subsys?
