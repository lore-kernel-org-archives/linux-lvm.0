From: Alexy Khrabrov <braver@pobox.com>
Subject: Re: [linux-lvm] enclosure separation/turnoff
Message-ID: <20030212113341.A18588@pdb-pc-6.rutgers.edu>
References: <20030211175123.A5038@pdb-pc-6.rutgers.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030211175123.A5038@pdb-pc-6.rutgers.edu>; from braver@pobox.com on Tue, Feb 11, 2003 at 05:51:23PM -0500
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
Date: Wed Feb 12 10:37:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, I want to use LVM within each enclosure
to aggregate drives.  The problem is, when I don't
need a particular enclosure, I want to be able to power
it down and boot my server without that box altogether,
but I'm forced to power it on even if the LV is not
mounted in /etc/fstab!  And even if it's deactivated
with lvchange -a n!  It seems to me that the underlying
PVs for that LV are being spinned on boot despite all
of the above, is that right?  Do I have to go deactivate
each PV then?...

Cheers,
Alexy
