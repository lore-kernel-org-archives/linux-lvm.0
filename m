Message-ID: <001301c3d0bb$a75abfb0$0a03a8c0@brane>
From: "Branko" <brankob@avtomatika.com>
References: <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is> <20040101184805.GA10139@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 on boot partition...
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
Date: Thu Jan  1 17:05:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have been following this for a while, especially after my initial fiasco
with booting off the LVM2 partition, and I still don't understand the fuss
about the devfs system. I have noticed that one needs /proc system in order
to be able to execute (some) programs etc, so I know I have to mount it
while in initrd.

But I don't understand all the fuss with /dev . Up until now, I thought that
it plays an interface between userland and kernel as a simulation of
filesystem node. "device" in /dev is seen as a simple node, but accessing it
reroutes data to device driver instead to a file.

So, while relevant nodes in /dev exists, everything should be fine, right ?
I mean, regardles to how those nodes got there  ? (e.g. made manually- with
right device major&minor numbers ofcourse). Why should it matter if kernel
has devfs compiled in or not ? This is just an arrangement for a second or
two in order to mount  initial LV, not a lasting arrangement, so why should
I care about rest of the nodes and the whole devfs mechanism ?

If,  for example, I have my initial LVM2 partition on /dev/sda3, which gets
recognised by device mapper (vgscan) and activated, all that is needed is
that /dev
 has to contain nodes /dev/sda3 and /dev/_my_VG_/_my_LV , right ?

I have used devfs mechanism in initrd and manually created nodes with exact
same outcome- kernel rebooting at the moment it dropped from initrd
environment to "normal" root of the filesystem- if that root was on the VG.
If I changed the root partition to "normal" partition, everything was O.K.
...

Is there some higher reason for the need for VG activation ? Couldn' this be
done automatically by the kernel module ? Maybe one could even make
provision for compiling-in the partition name at the "make menuconfig" time
?

This arrangfemet sucks BIG time. It is utterly crappy explained in
documentation and its plain awkward. Since this is not something one
wouldn't really need, but one of the chief requirements, one would expect it
to be thoroughly explained, not just mentioned (with a non-working example
BTW).


TIA,


Branko
