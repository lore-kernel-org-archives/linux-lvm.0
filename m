From: Erkki Seppala <flux-lvm@inside.org>
Subject: Re: [linux-lvm] bug: raid1 sub-devices are scanned too
Message-Id: <20020224221642.GA31890@xulfad.ton.tut.fi>
References: <20020223015504.GA828@xulfad.ton.tut.fi>
    <20020223114712.A695@sistina.com> <20020223115529.A744@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020223115529.A744@sistina.com>
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
Date: Sun Feb 24 16:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hello, thanks for the reply. 

The problem seems to have disappeared after a reboot, or then I've
tried the vgscan -f -stuff - vgscan now just seemed to work OK. I
could've sworn I tried that vgscan -f before without too much success,
but, all in all, I imagine it's not worth hunting a bug before one can
find an easily repeatible situation.

On Sat, Feb 23, 2002 at 11:55:29AM +0100, Heinz J . Mauelshagen wrote:

> > this is a bug in 1.0.3 with exported VGs.
> > 
> > If you import your VG "mirror" again, you should be fine.
> > Rather than imprting, "vgscan -f" should work as well.

In the original situation vgscan -f was of no help, only the
export/import-trick (and a reboot) allowed me to access the mirror-vg.

> Are /dev/ide/host0/bus1/target1/lun0/part1 and
> /dev/ide/host0/bus0/target1/lun0/part1 really the ones making up /dev/md/1 ?
> 
> Regards,
> Heinz    -- The LVM Guy --

Yes:
md1 : active raid1 ide/host0/bus1/target1/lun0/part1[1] ide/host0/bus0/target1/lun0/part1[0]
      58633216 blocks [2/2] [UU]

-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
