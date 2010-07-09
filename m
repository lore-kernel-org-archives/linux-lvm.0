Message-ID: <4C370A47.3070900@redhat.com>
Date: Fri, 09 Jul 2010 13:38:47 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <AANLkTilkyzsDmuS-xBxZEIl3Zyh5cykRC6JYVUZSADhi@mail.gmail.com>
	<AANLkTindGZd_YyY2SUEmtyAPcf-1WY_sgcuBKAs_AU0o@mail.gmail.com>
In-Reply-To: <AANLkTindGZd_YyY2SUEmtyAPcf-1WY_sgcuBKAs_AU0o@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] /dev/dm-0 instead of /dev/mapper/mygroup-myvol in
 "mount" output
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Benjamin Henrion <bh@udev.org>

On 07/09/2010 10:54 AM, Benjamin Henrion wrote:
> On Fri, Jul 9, 2010 at 9:53 AM, Benjamin Henrion <bh@udev.org> wrote:
>> Hi,
>>
>> I have managed to setup an LVM loopback file as a harddisk to mount.
>>
>> Now, I need the vzdump utility to detect the fact that it is LVM
>> based, and it keeps saying that it cannot detect the LVM volume group:
>>
>> http://openvz.org/pipermail/users/2010-July/003623.html
>>
>> "unable to detect lvm volume group"
>>
>> Everything works fine when mount displays that the file is mounted
>> with /dev/mapper/mygroup-myvol, on the opposite, it does not work when
>> mount outputs /dev/dm-0 in its list.
>>
>> Any idea how I could force mount to use /dev/mapper/mygroup-myvol
>> instead of /dev/dm-0?
> 

As for the "mount", it should be fixed already to handle /dev/dm-X
nodes properly and it should resolve the dm-X (internal kernel) name
into a real device-mapper name (util-linux-ng >= 2.17). Recent
versions of mount should work regardless of the the input that
was given initially, /dev/mapper/<real-dm-name> node (symlink)
or /dev/dm-X node.

> On one machine it creates rightly a device on /dev/mapper:
> 

That's the older layout without udev interfering where the nodes
in /dev/mapper are created by device-mapper library directly (this
is still supported as a fallback or if udev support is disabled in
compile time or while using udev_rules = 0 setting in lvm.conf).

> root@buzek /dev/mapper [68]# l
> total 0
> crw-rw---- 1 root root  10, 59 2010-07-09 09:32 control
> brw-rw---- 1 root disk 254,  0 2010-07-09 10:44 openvzgroup-openvzvol
> 
> While on the other machine where is does not work, it makes a symlink
> to /dev/dm-0:
> 

Yes, when udev support is enabled in LVM, the /dev/mapper/<name> is
a symlink to /dev/dm-X (this was chosen to comply with udev
requirements).

> root@chainsaw /dev/mapper [25]# l
> total 0
> crw-rw---- 1 root root 10, 59 2010-07-09 10:28 control
> lrwxrwxrwx 1 root root      7 2010-07-09 10:46 openvzgroup-openvzvol -> ../dm-0
> 
> Any idea why this difference?

Just different versions of lvm2 involved, I suppose...

If there are any other utilities still having problems with the
new /dev layout, then they need to be corrected and they need to
fix any assumptions about /dev/mapper content.

Peter
