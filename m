From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] vgscan in /sbin/init.d/boot ?
Date: 13 Nov 1999 00:55:02 GMT
Message-ID: <80ict6$at2$1@seneca.muc.de>
References: <31A612FE6020D2119F6400A0C9B67EBB116E59@fthw901e.as.fth.sbs.de>
Reply-To: h.milz@seneca.muc.de
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Franken wrote:
> The best place should be '/etc/rc.d/boot.local' (if / and /usr isn't in LVM)
> But not tested with SuSE-Linux.

Best would actually be boot itself, but only if the fsck part would be
devided into

- fsck the root fs
- remount / rw
- run vgscan and vgchange -ay
- fsck the rest (in serial - fsck at this time is too dumb to find out
  which physical disks a LV resides on, and will run all of them in
  parallel :-( )

or wait for SuSE 6.3 :-) 

I've not tried this yet - no time - but seems pretty straightforward. 

-- 
A witty saying proves nothing, but saying something pointless gets
people's attention.
