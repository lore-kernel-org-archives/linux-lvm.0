From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] AIX JFS dual-mount
References: <38A1CE1E.49BCA063@tkg.com>
Reply-To: h.milz@seneca.muc.de
Message-Id: <20000211071638.8EA2AE81E@seneca.muc.de>
Date: Fri, 11 Feb 2000 08:16:38 +0100 (CET)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Christopher Shaulis <shaulis@tkg.com> wrote:
> There is something called clvm (concurrent logical volume manager) for
> AIX which ships as part of HACMP (high availability clustering

Maybe the topic is a bit arbitrary here - but CLVM does _not_ support
dual-mount configurations. Main reason: it has no interface to the two
JFS's write caches... Its only intent was to facilitate multi-host access
to raw devices, a la databases, but as you say... 

> reported to be slow. Most developers (ie Oracle) choose instead to roll
> their own locking solutions. I've never actually seen anyone use it

Exactly. 

The only multi-mount filesystem on AIX so far is the GPFS (General purpose
filesystem) running on top of the RVSD (Recoverable Virtual Storage Disk)
which only runs on an SP. 

-- 
"What George Washington did for us was to throw out the British, so
that we wouldn't have a fat, insensitive government running our
country. Nice try anyway, George."
		-- D.J. on KSFO/KYA
