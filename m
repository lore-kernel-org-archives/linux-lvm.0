Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103211917.f2LJHIa20280@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
In-Reply-To: <3AB8F353.6E324EC7@in.tum.de> from David Vidal Rodriguez at "Mar
 21, 2001 07:30:43 pm"
Date: Wed, 21 Mar 2001 12:17:17 -0700 (MST)
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

David Vidal R. write:
> That's exactly what I'm looking for 'cause it seems that there's not LVM
> without correct uuids.
> 
> My problem is that I get compile errors when building the kernel + beta6-patch
> (I've followed the steps in the PATCHES directory). It says something about
> LVM-symbols... I will post them if someone knows what could be the reason.

You don't need the beta6 kernel patch to run vgcfgrestore to restore UUIDs,
only the beta6 user tools.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
