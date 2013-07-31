Message-ID: <51F94911.8080405@iwakd.de>
Date: Wed, 31 Jul 2013 19:27:45 +0200
From: Christian Seiler <christian@iwakd.de>
MIME-Version: 1.0
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
	<573874159e2a0196c68f44d6b5dc334a@iwakd.de>
	<51F8FEB7.9050004@redhat.com>
In-Reply-To: <51F8FEB7.9050004@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi there,

> One more question - what's the distro you're using? Some distros
> change udev rules or they add completely different ones from upstream
> (for example I know that Debian changes upstream LVM udev rules).

The computer in question is running Debian Squeeze (oldstable) (where
the LVM version was the one that was too old; a system upgrade to Wheezy
is planned but will take a while) and then I compiled the LVM version
that comes with Wheezy (stable) where at least from what I gathered from
the commit mailing archives here both fixes I mentioned in the original
mail are included.

FYI: These are the LVM udev rools that are in the LVM2 package that's
currently installed.

------------------------------------------------------------------
cat /lib/udev/rules.d/56-lvm.rules
# Udev rules for LVM.
# See /usr/share/doc/lvm2/README.udev for further information.

ACTION!="add|change", GOTO="lvm_end"
ENV{DM_UDEV_RULES}=="", GOTO="lvm_end"
ENV{DM_UUID}!="LVM-?*", GOTO="lvm_end"

# Use DM name and split it up into its VG/LV/layer constituents.
IMPORT{program}="/sbin/dmsetup splitname --nameprefixes --noheadings
--rows $env{DM_NAME}"

ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}!="1", GOTO="lvm_end"

ENV{DM_UDEV_DISABLE_DISK_RULES_FLAG}="1"
ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
OPTIONS:="nowatch"

LABEL="lvm_end"

cat /lib/udev/rules.d/60-persistent-storage-lvm.rules
# Udev rules for LVM.
# See /usr/share/doc/lvm2/README.udev for further information.

ACTION!="add|change", GOTO="persistent_storage_lvm_end"
ENV{DM_UDEV_RULES}=="", GOTO="persistent_storage_lvm_end"
ENV{DM_UUID}!="LVM-?*", GOTO="persistent_storage_lvm_end"

ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1",
GOTO="persistent_storage_lvm_end"

ENV{DM_VG_NAME}=="?*", ENV{DM_LV_NAME}=="?*", ENV{DM_LV_LAYER}=="",
SYMLINK+="$env{DM_VG_NAME}/$env{DM_LV_NAME}"

LABEL="persistent_storage_lvm_end"
------------------------------------------------------------------

> Or have you tested this with upstream (or Fedora) LVM version?

I will do so once I get the chance. But since it is very likely that the
specific environment here might also contribute to the likelyhood of the
failures occuring, I'll do so not by trying it on a clean Fedora install
but by compiling the current upstream git on the Debian computer in
question.

Christian
