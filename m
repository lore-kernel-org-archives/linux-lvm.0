Return-Path: <bs@infologic.fr>
Message-ID: <3A55C216.D16CF05C@infologic.fr>
Date: Fri, 05 Jan 2001 13:46:14 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
References: <20010104173400.A2606@minime.sistina.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Linux LVM Newbie
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

Sorry to distrub you, but i've currently implementing a test server with
LVM and i've got a question

My LVM version is 0.9. My kernel is 2.2.16, patched for LVM and online
ext2 resizing.

All this stuff work fine.

I'm an AIX user for about 2 years. In AIX, we have an option to spread
PE accros several disks, to boost performances. I explain :

	I create a (very small) LV with 6 PE.
	My VG containt 2 disks.
	I want the PE number 1, 3 and 5 on the disk 1, and the others on the
disk 2.

Is there any way to make this with Linux LVM ?
