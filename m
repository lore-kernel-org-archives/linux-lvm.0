Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5RD843N017180
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 14:08:04 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DmtLH-00074i-Uk
	for linux-lvm@redhat.com; Mon, 27 Jun 2005 14:08:03 +0100
Date: Mon, 27 Jun 2005 14:08:03 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem with locking_type 2 lvm/cluster/gfs
Message-ID: <20050627130803.GA27078@agk.surrey.redhat.com>
References: <27640.1119868518@www77.gmx.net> <8794.1119876998@www77.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8794.1119876998@www77.gmx.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jun 27, 2005 at 02:56:38PM +0200, Markus Jeckeln wrote:
> as soon as i put up the locking_type = 2 and set the locking_library then i
> can't run any lvm commands (vgdisplay/vgchange) ... returning with 
> connect() failed on local socket: Connection refused
> Locking type 2 initialisation failed.

Is root filesystem on LVM? - if so, check your initrd got updated.
Check *exactly* what lvm commands are getting run in initrd and initscripts.

vgdisplay output for a clustered VG:
Clustered             yes

Cluster Suite packages are available on RH Network.

Alasdair
-- 
agk@redhat.com
