Return-Path: <michael_e_brown@dell.com>
Date: Wed, 24 Jan 2001 16:36:22 -0600 (CST)
From: Michael E Brown <michael_e_brown@dell.com>
Subject: Re: [linux-lvm] Newbie questions
In-Reply-To: <OGEIIBECLDEKAJGFBOGCKEDBCAAA.mvasa@confluencenetworks.com>
Message-ID: <Pine.LNX.4.30.0101241630290.18981-100000@carthage.michaels-house.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Lvm <linux-lvm@sistina.com>

Hi Mayank!

On Wed, 24 Jan 2001, Mayank Vasa wrote:

> Hi,
>
> I am new to LVM and have some basic questions:
>
> 1) From the documentation I have read, I think once you extend/reduce a LV
> or VG you don't need to reboot the system. Correct?

You are correct. No need to reboot the system.

>
> 2) Assuming 1 is correct, how is the filesystem made aware of the changes?
> I'd like to understand the flow of this too.

You need to run a separate utility to resize the filesystem.

http://ext2resize.sourceforge.net/

There are kernel patches that allow you to do this while the filesystem is
online. Without the patches, you must un-mount the filesystem first.

No reboot necessary

>
> 3) What are LVM snapshots?

Very cool.
Copy-on-write. You create a snapshot of an LV. The original
volume is still read-write and acts normal. The snapshot acts like a
frozen-in-time picture of the original LV. It does this by creating
'before' copies of any blocks that are changed in the original LV.

--
Michael Brown
