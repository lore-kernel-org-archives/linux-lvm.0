From: Erkki Seppala <flux-lvm@inside.org>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020211205325.GA25253@xulfad.ton.tut.fi>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020209150956.GA11057@xulfad.ton.tut.fi>
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
Date: Mon Feb 11 14:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

The drive I got was two gigabytes smaller than the original, and thus:

[21:42] lectric(pts/8):~# vgcfgrestore -n archive /dev/ide/host0/bus0/target1/lun0/part1
vgcfgrestore -- size of physical volume /dev/ide/host0/bus0/target1/lun0/part1 differs from backup

The original disc was:

  PVs: [AN] ide/host0/bus0/target1/lun0/part1 60030976 /3664    
		21331968 /1302    38699008/2362  

and it now is 58633312 blocks according to fdisk.

Is there a way to still restore the remaining VG?-o Sounds like the
backup would need to be modified. The physical extents that were in
the dead device would need to be either removed from the VG or
allocated from another device?
-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
