Return-Path: <alden@math.ohio-state.edu>
Message-Id: <20010227131526.1C48E3FDB@math.ohio-state.edu>
Date: Tue, 27 Feb 2001 13:15:26 +0000 (/etc/localtime)
From: Dave Alden <alden@math.ohio-state.edu>
Subject: [linux-lvm] Possible to raise Max LV?
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

Hi,
  I'm hoping to use LVM with my hardware RAID array so I can take snapshots
of the filesystem for backups.  What I'm worried about is that my current
array is 240GB, so the next drive I add will take it over 256GB which (if
I'm reading the HOWTO correctly) means that I won't be able to use LVM
anymore (since it's being presented as one drive).  Is there someway to
get around the 256GB limit (or did I misunderstand this completely? :-)
...thnx,
...dave alden
