Return-Path: <lembark@wrkhors.com>
Message-ID: <3A9C87A1.7205F1DC@wrkhors.com>
Date: Tue, 27 Feb 2001 23:07:45 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Possible to raise Max LV?
References: <20010227131526.1C48E3FDB@math.ohio-state.edu> <200102271658.f1RGwkl27047@webber.adilger.net> <20010227132358.A24164@math.ohio-state.edu>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> I'm completely new to LVM, so can someone explain to me the purpose of
> the PE's and why they default to 4M?  Is there some kind of performance
> or space hit if I raise that to 16M (remember my setup: hardware RAID
> array that is currently at ~250G, soon to be ~325G)?

also described in the docs.  

you might be better off splitting the space into smaller chunks.
with that much space in one unit you will be hit hard if any of
it fries -- backups or not.  do you have any files that really
take up 325G?  if not you could split the space into multiple
128GB sections for separate use.  makes backups a whole lot 
easier...  let alone restores.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
