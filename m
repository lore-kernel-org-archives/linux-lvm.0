Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104251555.f3PFtdTb031206@webber.adilger.int>
Subject: Re: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
In-Reply-To: <20010425090139.C1711@tykepenguin.com> "from Patrick Caulfield at
 Apr 25, 2001 09:01:39 am"
Date: Wed, 25 Apr 2001 09:55:38 -0600 (MDT)
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

Patrick writes:
> I get similar warnings with gcc 3.0 from CVS. The indicated line has
> changed but the actual error is the same I think:
> 
> lvm_config.c:113:7: warning: pasting ""error: "" and ""error in config file: not in section at line %d"" does not give a valid preprocessing token
> lvm_config.c:117:7: warning: pasting ""error: "" and ""couldn't put %s:%s = %s into config"" does not give a valid preprocessing token
> lvm_config.c:162:9: warning: pasting ""warning: "" and ""unknown variable %s:%s in config file"" does not give a valid preprocessing token
> lvm_config.c:172:5: warning: pasting ""warning: "" and ""more than one value for %s:%s, using most recent"" does not give a valid preprocessing token
> lvm_config.c:186:5: warning: pasting ""warning: "" and ""more than one value for %s:%s, using most recent"" does not give a valid preprocessing token
> lvm_config.c:342:3: warning: pasting ""warning: "" and ""'%s' not a recognised boolean value, assuming false"" does not give a valid preprocessing token

I seem to recall reading that there was some bogus issue about GCC 3.0 not
allowing concatenated strings.  This definitely looks like that problem.
Try editing the relevant lines in lvm_config.c to have a single long string
value, and see if that fixes the problem.  That would be a real PITA.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
