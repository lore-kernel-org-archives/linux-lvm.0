Return-Path: <dmeyer@dmeyer.net>
Date: Mon, 15 Jan 2001 11:03:58 -0500
From: dmeyer@dmeyer.net
Subject: [linux-lvm] hard-lock seems to have caused serious LVM problems
Message-ID: <20010115110358.A3757@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
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

In article <20010115162523.A31019@srv.t-online.de> you write:
> Every PV is assumed to hold all the PV UUIDs of all PVs in the volume group
> the PV belongs to.

The PVs and VGs were created with 0.8final - I migrated to 0.9 tools
when I upgraded to linux-2.4.0.  Could it be related to that somehow?

Interestingly enough, something seems to have fixed my PVs in the
meantime - now they all have every UUID.  Either activating the VG or
running vgck must have done it.

-- 
David M. Meyer
dmeyer@dmeyer.net
