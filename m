From: Nils Juergens <nils@muon.de>
Message-ID: <20030714002149.GA1041@trip.muon.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Testing LVM2
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
Date: Sun Jul 13 17:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailing List <linux-lvm@sistina.com>

Hi,

i'm currently in the process of starting to test the 2.5 linux kernel
series, now that the 2.6-pre are around the corner. While i'm at it and
having set up a box completely for testing (and trying to break) stuff 
i thought i might give lvm2 a try (not that i expect it to break :) ).

Thus, i got LVM2.2.00.03-rc4.tgz and device-mapper.1.00.02-rc3.tgz of the
ftp server.

My question is: Is this stuff supposed to work with the 2.5 kernel series or
do i have to switch to 2.4 to test lvm2? I know that the device-mapper is
included in the 2.5 series, but is it recent enough? Also, are there
different (and thus incompatible) versions of either the device mapper
and/or the device-mapper-libs around?

Trying to compile the above device-mapper after doing

configure --with-kernel-dir=/usr/src/linux-2.5.75

i get (using gcc-3.3 from Debian unstable):

[snipped other make output]
make[1]: Entering directory /root/device-mapper.1.00.02-rc3/lib'
gcc -c -Iioctl -I. -I../include -I/usr/src/linux-2.5.75/include -fPIC -Wall
-Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -Winline -O2 -DDM_COMPAT
ioctl/libdevmapper.c -o ioctl/libdevmapper.o
ioctl/libdevmapper.c:55: error: DM_TABLE_LOAD' undeclared here (not in a
function)
ioctl/libdevmapper.c:55: error: initializer element is not constant
ioctl/libdevmapper.c:55: error: (near initialization for _cmd_data_v4[1].cmd')
ioctl/libdevmapper.c:55: error: initializer element is not constant
ioctl/libdevmapper.c:55: error: (near initialization for
_cmd_data_v4[1].version')
ioctl/libdevmapper.c:55: error: initializer element is not constant
ioctl/libdevmapper.c:55: error: (near initialization for _cmd_data_v4[1]')
ioctl/libdevmapper.c:56: error: initializer element is not constant
ioctl/libdevmapper.c:56: error: (near initialization for
_cmd_data_v4[2].version')

[snipped more "initializer element is not constant" and
"SOMETHING_IN_UPPERCASE undeclared here" error messages]

ioctl/libdevmapper.c:648: error: structure has no member named event_nr'
ioctl/libdevmapper.c: In function _flatten':
ioctl/libdevmapper.c:851: error: structure has no member named event_nr'
make[1]: *** [ioctl/libdevmapper.o] Error 1
make[1]: Leaving directory /root/device-mapper.1.00.02-rc3/lib'
make: *** [lib] Error 2

thanks,

Nils

-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
