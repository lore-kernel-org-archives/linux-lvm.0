Return-Path: <sherlock_ind@yahoo.com>
Message-ID: <20010116120243.4935.qmail@web12007.mail.yahoo.com>
Date: Tue, 16 Jan 2001 04:02:43 -0800 (PST)
From: sherlock holmes <sherlock_ind@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Basic Questions on LVM
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

Hi,
I am 1 month old to LVM and have some basic doubts in
LVM code.

1.During initialisation y is it LVM is registered both
as a block and char device where as according to me it
is supposed to be a block device driver and when one
does the pvcreate,vgcreate..etc it calls the ioctls of
the char device of LVM.

2.what is exactly the control flow when and read/write
request is given to a file residing on the LVM
partition...(ie where and how exactly the mapping
tables exist..?)

3.what is the importance of VGDA and vgscan?

4.during boot up time what are checks/modification
made by the kernel with respect to the LVM/logical
volumes?

5.moreover to what extent is KIOBUF supported on linux
2.4. Can someone give me the workaround to check for
KIOBUF working..

thanks,
Sherlock.


__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
