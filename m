From: Erkki Seppala <flux@inside.org>
Subject: Re: [linux-lvm] pvmoving from a pv with bad sectors
Message-Id: <20020209150956.GA11057@xulfad.ton.tut.fi>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020209142411.GA10226@xulfad.ton.tut.fi>
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
Date: Sat Feb  9 09:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

It appears I didn't try rescuing the data a moment too soon, as the
drive stopped giving me data shortly after writing that message..

And as I predicted, /dev/archive is gone. Is there a way to retrieve
it, I imagine the lost device physically had only one logical volume
in it?  The device had 20 gigabytes of data. I imagine reiserfs cannot
handle so big holes in filesystem, so I'll just hope the hole hits one
of the smaller, backed up logical volumes instead of the one, huge,
non-backed up volume :).

The output of vgscan -d is available at
http://xulfad.inside.org/~flux/vgscan . Also the latest backup of LVM
is at http://xulfad.inside.org/~flux/archive.conf .

I imagine I need to somehow remove the invalid device from the volume
group, but as I cannot even activate it, it cannot be done with
default utilities? Also the now-gone-and-disconnected physical volume
contained some data, and cannot be removed from the volume group
before the VG knows the device is empty. I can propably get a new disc
next week, would that make things easier?

-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
