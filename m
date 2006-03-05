Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k25Gkp124169
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 11:46:51 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k25GkjTf020096
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 11:46:45 -0500
Received: by wproxy.gmail.com with SMTP id 70so984173wra
	for <linux-lvm@redhat.com>; Sun, 05 Mar 2006 08:46:45 -0800 (PST)
Message-ID: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
Date: Sun, 5 Mar 2006 17:46:45 +0100
From: "John Smith" <lbalbalba@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Boot Mgr support for '/boot' on LVM2 volumes ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi.


I was wondering if booting from an LVM2 volume group is supposed to be
supported with lilo (preferred) or GRUB. For example, is it supported
to use a '/boot' device, when that is a LVM2 volume residing in an
LVM2 volume group ?

Last time I checked, having /boot on a LVM2 device using lilo was
still considered 'unsupported', or at least considered to be "not a
very good idea". If I recall correctly, this had something to do with
the fact that "/boot" had to be located on a linear, contiguous volume
for bootloaders like lilo and grub to be able to read it.  And that
with something like LVM, it's on very easy for a volume to be
non-contiguous.

Is this still the case with the current release of LVM2, or has this
been worked-around in current releases ?


Sincerely,


John Smith.
