Return-Path: <hugo@carfax.nildram.co.uk>
From: hugo@carfax.nildram.co.uk
Date: Mon, 28 May 2001 14:40:43 +0100
Subject: Re: [linux-lvm] Patching Linus' pre- kernels?
Message-ID: <20010528144043.A544@carfax>
References: <20010525162619.D24299@carfax> <20010528112224.I26710@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010528112224.I26710@sistina.com>; from Mauelshagen@sistina.com on 28 May 2001, 11:22:24 +0000 (+0000)
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

On 28 May 2001, 11:22:24 +0000 (+0000), Heinz J. Mauelshagen wrote:

   Heinz - 

> - change get_hardblocksize to get_hardsect_size and recompile -or-

   Someone else (Gergely Tamas; thank you) sent me the same patch,
which compiles with no problems. Thanks.

   I am pleased to report that LVM is now holding /var, /tmp and /usr
on my system, without problems. I shall put /home under LVM as soon as
I can pluck up the courage to trust my backups :) (I have little free
space on this system -- moving things is a bit tight).

   Thank you for your help,
   Hugo.

-- 
    ---- Hugo Mills --- The Creature from the Black Logon ----
hugo@lug.org.uk     hugo@carfax.nildram.co.uk     hugo@soton.ac.uk
     ---- "We did a risk management review. We concluded ----
            that there was no risk of any management."
