From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011010620.eA16KvS25240@webber.adilger.net>
Subject: Re: [linux-lvm] Exporting VG
In-Reply-To: <20001101013433.B30322@srv.t-online.de> "from Heinz J. Mauelshagen
 at Nov 1, 2000 01:34:33 am"
Date: Tue, 31 Oct 2000 23:20:57 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Heinz writes:
> You are right that there is no need to run vgscan on each boot.
> Nevertheless vgscan takes care of any changes in the i/o configuration of
> the system in order to make physical volumes accessable using different
> device nodes.

If we did something like a pvscan on each boot, which identified the
PVID->device mappings, we would not need to change the VG configuration
information each time.  In the future, devfs will automatically do
PVID->device mappings dynamically for us, from what Richard said.

> Assumed that it is really that likely it's rather easy to get /etc/lvmtab.d/
> files containing the metadata copies back, because they are format
> identical to /etc/lvmconf/ files.

But people have problems nonetheless.  It may not be because of vgscan,
or because it's hard to do restores, but that's an extra step that
people have to make when trying to fix a broken system.

> /etc/lvmtab contains the 0 delimited volume group names.

Yes, I was just referring to the whole LVM configuration information.

> /etc/lvmtab.d/VolumeGroupName contains a metadata copy of the current
> state of a volume group. In case of i/o configuration changes it is up
> to vgscan to update this file's contents.

Looking on my development system, /etc/lvmtab.d/vgtest is not quite the
same data as /etc/lvmconf/vgtest.conf.  Is it possible that the backups
in /etc/lvmconf are 1 version behind what's on disk?

For example, the /etc/lvmconf/vgtest.conf file says V_EXP, while
/etc/lvmtab.d/vgtest does not have this (I was testing vgexport and
vgimport last).  The issue is that this is fine for the case where you
made a mistake changing a VG, but if the disk is corrupted, and you
run vgscan it will overwrite the last good copy of the current config
(/etc/lvmtab.d/vgtest).  Any action you do to restore the VGDA will only
return the previous configuration, not the current one.

I think that once we have on-disk backups of the VGDA, and we only
update one at a time, we will be OK.  However, maybe for now we should
also backup the _current_ configuration to /etc/lvmconf/vgtest.conf,
and have the _previous_ configuration in /etc/lvmconf/vgtest.conf.1, etc.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
