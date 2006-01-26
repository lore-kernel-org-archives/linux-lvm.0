Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0QIWQ106559
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 13:32:26 -0500
Received: from nola.netidea.com (mail.netidea.com [207.194.161.10] (may be
	forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0QIWI74015293
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 13:32:19 -0500
Received: from [192.168.100.206] (ymir.netidea.com [66.244.242.8] (may be
	forged)) (authenticated bits=0)
	by nola.netidea.com (8.13.4/8.13.4/Debian-3) with ESMTP id
	k0QIWHSq023848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 10:32:18 -0800
Message-ID: <43D914B4.8090900@netidea.com>
Date: Thu, 26 Jan 2006 10:28:04 -0800
From: Kirk Ismay <captain@netidea.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Troubleshooting LVM IO errors on debian 3.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi everyone,

I have a Dell Poweredge 2550 running debian 3.0 (woody), kernel 2.4.25.
I've recently installed a second set of 36GB SCSI disks, configured as a
RAID-1 mirror using the PERC controller and mounted as /home. Its
formatted as ext2 (originally ext3, but I converted back thinking that
was the issue). I've had this happen about 4 times now, twice before the
conversion back to ext2.  The server is a web, mail, and nfs server for
an ISP, and needs to as reliable as possible.

I wanted to be able to use LVM to combine my new /home partition with
the old one, giving me more space.

I was first alerted to the problem when a customer reported that they
were unable to view their website.

ls -l gave me errors like this:
/bin/ls: .addressbook: Input/output error
/bin/ls: .lynx_cookies: Input/output error
/bin/ls: .procmailrc: Input/output error
/bin/ls: .kermrc: Input/output error

The console was spewing LVM IO errors (sorry, I didn't write them down).
    One disk had an amber blinking light, but that dissappeared after
the reboot. When I halted the system, I got the 'VFS: Busy inodes after
unmount. Self-destruct in 5 seconds' message, which was quite alarming.

My questions:
1. Where should I be looking for the problem? Is it LVM?
2. What are some solutions? Should I upgrade my kernel?
3. How stable is LVM on kernel 2.4?
4. What's up with the "Self destruct" message?  Is it really that severe?
5. How can I capture the kernel error messages to a remote log server?
(I'm using syslog-ng)

Additional Information, including dmesg vgdisplay and kernel config:
http://community.netidea.com/admin/jan2006/

Thanks.

-- 
Sincerely,
Kirk Ismay
System Administrator

--
Net Idea
201-625 Front Street Nelson, BC V1L 4B6
P:250-352-3512 | F:250-352-9780 | TF:888-246-4222

10 Years of Service Excellence!

Visit us online at:
www.netidea.com | www.netidea.biz
