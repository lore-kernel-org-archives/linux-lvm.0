Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB531G1i000979
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 22:01:16 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L8QwN-0004IZ-TU
	for linux-lvm@redhat.com; Fri, 05 Dec 2008 03:01:15 +0000
Date: Fri, 5 Dec 2008 03:01:15 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] volume group device nodes are left behind
	afterremoving a san snapshot
Message-ID: <20081205030115.GW26097@agk.fab.redhat.com>
References: <8D07631D47C3CB4F867AD7BCF07D5C232CAD@excs01.bucoks>
	<20081205022830.GV26097@agk.fab.redhat.com>
	<8D07631D47C3CB4F867AD7BCF07D5C232CAE@excs01.bucoks>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C232CAE@excs01.bucoks>
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

On Thu, Dec 04, 2008 at 08:53:52PM -0600, James A. Dinkel wrote:
> Well dmsetup info -c did include this:
> vgname-lvname 253   4 L--w    1    4      0 LVM-<snip>
 
That means you still had the *old* "/dev/vgname/lvname" open (mounted?).

Check 'dmsetup table vgname-lvname' - see what major:minors it is now using 
and if they are the right ones or not.

Alasdair
-- 
agk@redhat.com
