Date: Tue, 19 Sep 2000 13:17:53 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM on sparclinux
Message-ID: <20000919131753.A14015@gruyere.muc.suse.de>
References: <Pine.LNX.4.20.0009191051180.15325-100000@tori.tal.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.20.0009191051180.15325-100000@tori.tal.org>; from milang@tal.org on Tue, Sep 19, 2000 at 10:52:07AM +0300
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kaj-Michael Lang <milang@tal.org>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

On Tue, Sep 19, 2000 at 10:52:07AM +0300, Kaj-Michael Lang wrote:
> Does it work ? It won't show up in "make menuconfig" under 2.4.0-test7.

On sparc32 it may work, on sparc64 likely not unless you can use a 64bit
userland for the LVM binaries.


-Andi
