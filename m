Return-Path: <cottin@free.fr>
Message-ID: <000701c0d481$83d9c290$01a8a8c0@jeckel>
From: "Lionel Cottin" <cottin@free.fr>
Date: Fri, 4 May 2001 12:03:48 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] initrd information
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
To: LVM <linux-lvm@sistina.com>

Hi all,

I encountered a problem with initrd-lvmcreate while configuring a ~200GB
Logical volume:
The ramdisk's size was 4MB, which was not sufficient to contain the
temporary data created by vgscan.....

To solve this, I had to force the value of INITRDSIZE in
/sbin/lvmcreate-initrd to 10MB

I have spent more than 2 hours to find the problem and solve this issue :(,
so I hope it will be useful for someone else ;)

Lionel
