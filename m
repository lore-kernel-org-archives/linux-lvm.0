Message-Id: <200003182145.WAA13568@e35.marxmeier.com>
Subject: Re: [linux-lvm] 0.8i --> 0.8final
Date: Sat, 18 Mar 2000 22:45:12 MEZ
In-Reply-To: <Pine.LNX.4.10.10003182012380.17608-100000@greebo.jj.net>; from "James Pattinson" at Mar 18, 100 8:16 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jamesp@subdimension.com
Cc: linux-lvm@msede.com

> I tried to migrate my system (currently running 2.2.14 / 0.8i with devfs)
> to 2.3.99-pre1 with the lvm patch applied. I built the new user space
> tools and copied the new vgscan and vgchange and liblvm.so to my initrd
> image (as i'm using root on LVM) and tried to boot. It failed as the
> vgscan reported no volume groups! I was unable to debug further as I can't
> boot into anything using this new kernel now - so i've reverted to 2.2.14.
> Any ideas?

Do you have devfs mounted in /dev ?
If you use the devfs=nomount kernel option (so devfs is _not_ mounted
in /dev) you need to apply a small patch as described in
ftp://linux.msede.com/lvm/v0.8final/BUGS


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
