Return-Path: <smcconnell@clark.edu>
Date: Thu, 28 Jun 2001 10:58:22 -0700 (PDT)
From: Sean McConnell <smcconnell@clark.edu>
Subject: Re: [linux-lvm] lvm on alpha
In-Reply-To: <20010628124239.B27023@sistina.com>
Message-ID: <Pine.LNX.4.30.0106281046520.26483-100000@cs.clark.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

so far as i can tell, just checking against my mandrake 8 box,
pertaining to the lvm it all looks good.  I have the /dev/lvm device
and all my /dev/sdb devices, missing a device for a volume group
of course. I'm not sure if there's more i should look for.  It's just
kind of wierd...apparently it sees the drive, because if i try to
pvcreate a non existing partition it tells me so, it just doesn't
seem to want to see the type of partition.  I've tried using the
tools that are the same version as the kernel lvm, and tools above
(i don't think the latest worked though) but i get the same results
with both kernels so i'd think it would have to be some configuration
(user) error.

sean mcconnell
