Message-ID: <38AFBC54.9BFD748E@libertysurf.fr>
Date: Sun, 20 Feb 2000 11:05:08 +0100
From: Francis SOUYRI <francis.souyri@libertysurf.fr>
Reply-To: francis-souyri@altavista.net
MIME-Version: 1.0
Subject: [linux-lvm] With 2.3.46 lvm patch invalid i/o protocol version...
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm <linux-lvm@msede.com>

Hi,

    I installed the 'patch-2.3.46-LVM-0.8final.gz' on my 2.3.46 kernel
(in the 2.3.46 kernel the devfs patch is now included, this is great,
but with this kernel I can't use the ramdisk because there is or I have
a bug), when I use the 'lvm_0.8-pre02.10.1999.tar.gz' tools I receive
the message 'invalid i/o protocol version'.

Do you know if there is a tools package compatible with the 2.3.46 lvm
kernel patch or can I modify the lvm kernel patch to
set the ' LVM_DRIVER_IOP_VERSION' from 6 to 5 like the
'LVM_LIB_IOP_VERSION' or vice versa.

With this lvm patch you need to change  in the 'lvm.c' file the line:

static const char *const lvm_name = LVM_NAME;

by

const char *const lvm_name = LVM_NAME;

'lvm_name' is use in the 'lvm_snap.c' file.

Best regards.

Francis
