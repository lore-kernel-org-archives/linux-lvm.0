From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue, 16 May 2017 17:20:37 +0200
Message-Id: <20170516152040.4619-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH v2 0/3] dmsetup: add bootformat support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, linux-lvm@redhat.com
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>

Dear all,

Based on the comments received in the IRC this is a second patchet to add boot format
support.

Bootformat is specified as a simple string of data separated by commas and
optionally semi-colons, where:
 - a comma is used to separate fields like name, uuid, mode and table (specifies
   one device)
 - a semi-colon is used to separate devices.

So the format will look like this:

 <dev_name>,<uuid>,<flags>,<table>[,<table>+][;<dev_name>,<uuid>,<flags>,<table>[,<table>+]]+

See the following example.

To supply the new format to dmsetup (splitted in multiple lines for readibility)

 $ dmsetup -v create --bootformat "lroot,,rw, \
    0 2097152 linear 7:0 0,\
    2097152 2097152 linear 7:1 0,\
    4194304 2097152 linear 7:2 0;\
    mroot,,rw,\
    0 2097152 linear 7:3 0;\
    kroot,,rw,\
    0 2097152 linear 7:4 0"

Name:              lroot
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 3
Number of targets: 3

Name:              mroot
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 4
Number of targets: 1

Name:              kroot
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 5
Number of targets: 1

To ask dmsetup to display your existing devices in this format:

 $ dmsetup table --bootformat lroot mroot kroot

lroot,,rw,4194304 2097152 linear 7:2 0;mroot,,rw,0 2097152 linear 7:3 0;kroot,,rw,0 2097152 linear 7:4 0;

Changes since v1 (suggested by Alasdair):
 - Add support for embedded '\,' and '\;'
 - Rename mode to flags
 - Added a man page
 - Added dmsetup-bootformat.sh test script

Enric Balletbo i Serra (3):
  libdm: Add dm_find_unescaped_char to libdevmapper.
  dmsetup: add support to output devices in bootformat style
  dmsetup: add support to create devices when bootformat is used

 libdm/.exported_symbols.Base     |   3 +
 libdm/libdevmapper.h             |  17 +++++
 libdm/libdm-string.c             |  82 +++++++++++++++++++++
 man/dmsetup.8_main               |  77 ++++++++++++++++++--
 test/shell/dmsetup-bootformat.sh |  77 ++++++++++++++++++++
 tools/dmsetup.c                  | 149 ++++++++++++++++++++++++++++++++++++++-
 6 files changed, 396 insertions(+), 9 deletions(-)
 create mode 100644 test/shell/dmsetup-bootformat.sh

-- 
2.9.3
