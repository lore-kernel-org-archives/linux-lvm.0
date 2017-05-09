From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue,  9 May 2017 17:48:20 +0200
Message-Id: <20170509154822.13396-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH 0/2] dmsetup: add bootformat support
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>

Dear all,

Recently we had some IRC discussion about adding support for a new string
format to create multiple devices in one line so we can use this new format
as a kernel cmdline parameter to create device-mapped devices without a
initramfs.

This first patchset is a first proposal for this new format, I'm either
interested on, know you opinion about the new format and know if the way
I introduced this new option is right or not. Is the first time I play with
this code so take this as first draft.

Bootformat is specified as a simple string of data separated by commas and
optionally semi-colons, where:
 - a comma is used to separate fields like name, uuid, mode and table (specifies
   one device)
 - a semi-colon is used to separate devices.

So the format will look like this:

 <dev_name>,<uuid>,<mode>,<table>[,<table>+][;<dev_name>,<uuid>,<mode>,<table>[,<table>+]]+

See the following example.

To supply the new format to dmsetup (splitted in multiple lines for readibility)

 $ dmsetup -v create --bootformat "lroot,none,rw, \
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
UUID: none

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

lroot,none,rw,4194304 2097152 linear 7:2 0;mroot,,rw,0 2097152 linear 7:3 0;kroot,,rw,0 2097152 linear 7:4 0;

Finally I know that the code needs more work but I'm wonder if you expect
something like this or if I'm following the wrong way.

Next thing to do:
 - support embedded '\,' and '\;' among the other escaped options altready
   supported in string data

Waiting for your feedback,

Enric Balletbo i Serra (2):
  dmsetup: add support to output devices in bootformat style
  dmsetup: add support to create devices when bootformat is used

 tools/dmsetup.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 2 deletions(-)

-- 
2.9.3
