Return-Path: <jan@moria.gondor.com>
Date: Fri, 1 Dec 2000 02:00:29 +0100
From: Jan Niehusmann <jan@gondor.com>
Message-ID: <20001201020029.A1073@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] kernel hang
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

Is there something wrong with doing 
while true; do dd if=/dev/zero of=/dev/vg1/test; done
and
lvextend -L+90M /dev/vg1/test

at the same time?

It caused a system hang (no messages, no log) on linux-2.4.0-test12-pre3
(with ext2 online resize patches, but there obviously was no filesystem 
on the volume)

Jan


PS: Andreas, perhaps the errors I saw were not ext2 related. Maybe the 
kernel doesn't like writing to the device and resizing it at the same time?
