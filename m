Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102272055.f1RKt5S27720@webber.adilger.net>
Subject: Re: [linux-lvm] Possible to raise Max LV?
In-Reply-To: <20010227213517.G29642@vestdata.no> from =?UNKNOWN-8BIT?Q?Ragnar_Kj=F8rstad?=
 at "Feb 27, 2001 09:35:17 pm"
Date: Tue, 27 Feb 2001 13:55:05 -0700 (MST)
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

Ragnar Kj_rstad writes:
> What about increesing the [PE size] default, to say 32 MB?
> 32 MB should be enough for everyone (because of the 2TB limit), and 16
> MB waste on every PV isn't that bad.

So says the guy from a company called "Big Storage" ;-).  However, I've
seen several people who make multiple partitions on a single disk, and
then turn these into PVs (don't ask me why), so they would be wasting
16MB per partition.  Most people will not need 2TB LVs for some time to
come.  However, if your systems usually have large LVs, then it is OK
for you to increase the default for your systems.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
