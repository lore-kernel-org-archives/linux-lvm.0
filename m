Return-Path: <jweber@valinux.com>
Date: Wed, 2 May 2001 09:58:41 -0700 (PDT)
From: Jay Weber <jweber@valinux.com>
Message-ID: <Pine.LNX.4.30.0105020957190.11191-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate segfault
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Just noticed this one.

[root@slippey /root]# lvcreate -l5 -s snap /dev/vol/foo
Segmentation fault (core dumped)

Haven't looked at it much, off to a meeting now (sigh), but it appears to
be a simple option parsing problem when using -s.

A proper command for that to work would be:
lvcreate -l5 -s -n snap /dev/vol/foo
