Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102121931.f1CJVWE08511@webber.adilger.net>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM
In-Reply-To: <Pine.LNX.4.20.0102120713030.5354-101000@menswerk.cyclone.se> from
 Hans Engren at "Feb 12, 2001 07:14:10 am"
Date: Mon, 12 Feb 2001 12:31:32 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hans, you write:
> Forgot the attachment in my previous mail. Oups.

[Attachment, skipping...]

This still isn't "my" vgscan either.  For example, my code prints:

<4444> lvm_add_dir_cache -- CALLED with /dev/hda

instead of only:

<4444> lvm_add_dir_cache -- CALLED

and if lvm_dir_cache is called multiple times, it looks like:

<333> pv_get_size -- CALLED with /dev/hda2 and BFFFF9AC
<4444> lvm_dir_cache_find -- CALLED
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> lvm_dir_cache_find -- LEAVING

so lvm_dir_cache doesn't re-read the whole device list each time it is
called, which is still happening in your output.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
