Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3ABB63F7.F776CCEA@in.tum.de>
Date: Fri, 23 Mar 2001 15:55:52 +0100
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan won't recognize my VG
References: <200103211917.f2LJHIa20280@webber.adilger.int>
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

> You don't need the beta6 kernel patch to run vgcfgrestore to restore UUIDs,
> only the beta6 user tools.

OK, but see what appears if I try to restore the VGDA... (the messages aren't
exact)

# vgcfgrestore -n <vg_name> -f <vgda_backup> <path_to_pv>
Error "parameter error" while trying to restore

# cp <vgda_backup> /etc/lvmtab.d/<vg_name>
# vgcfgrestore -n <vg_name> <path_to_pv>
vgcfgrestore -- VGDA of vg <vg_name> successfully restored in <path_to_pv>

# pvdata -U <path_to_pv>
List of UUIDs:
uuid0: <uuid1>
uuid1: <uuid2>
uuid2: --EMPTY--

# This sucks!
!: Event not found :))

So what's up here? Am I using vgcfgrestore properly or am I messing the whole thing
up?

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
 http://dvr.ismad.com
 "Ein Computer ohne Windows ist wie ein Fisch ohne Fahrrad."
