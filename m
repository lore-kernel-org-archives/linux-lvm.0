From: "Samarjeet Tomar" <samarjeet_tomar@hotmail.com>
Mime-Version: 1.0
Message-ID: <Law10-F48ilSS82Im4U000796ca@hotmail.com>
Subject: [linux-lvm] Hang during boot after creating LVM volumes
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
Date: Tue Jan  6 15:46:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I am observing this hang after I created four LVM volumes,
created two mirrored volumes out of them using md, and
added two entries in fstab to mount two filesystems (ext3)
on these mirrored volumes. When the machine was rebooted,
it hung at this point:

<snip>
Journalled Block Device driver loaded
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
Freeing unused kernel memory: 244k freed

Same hang happened again on the next reboot.

I haven't changed /etc/rc.d/rc.sysinit to load the
LVM module. Is that what is could be causing this problem?
I want to somehow boot all the way up and change the
rc script.

How can I get out of this? I am using Red Hat 7.1, 2.4.21
kernel.

Thanks,
Samar.

_________________________________________________________________
Worried about inbox overload? Get MSN Extra Storage now!  
http://join.msn.com/?PAGE=features/es
