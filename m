Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012310033.eBV0XTT20499@webber.adilger.net>
Subject: Re: [linux-lvm] Patched kernel sources
In-Reply-To: <01C07295.55B20EC0.smdenton@bellsouth.net> "from S. Michael Denton
 at Dec 30, 2000 07:18:46 pm"
Date: Sat, 30 Dec 2000 17:33:29 -0700 (MST)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Scott Denton writes:
> > You probably DON'T want to use the ext3 online resizing patches.
> 
> Found the reference to that very idea in the src code on sourceforge
> for ext2online... how about ext2online resizing of an ext3fs (since
> there's supposedly no structural difference between the two)?

I'm not quite sure what you mean...  Maybe ext2resize (offline) resizing
of an ext3 fs?  This is already possible (I do it regularly).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
