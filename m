Date: Wed, 19 Sep 2001 14:43:04 -0500
From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Root on LV
Message-ID: <4740000.1000928584@duke.wrkhors.com>
In-Reply-To: <OFB98B66D9.BF1F5CB9-ON85256ACC.0066E63E@raleigh.ibm.com>
References: <OFB98B66D9.BF1F5CB9-ON85256ACC.0066E63E@raleigh.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com


-- Steve Pratt <slpratt@us.ibm.com> on 09/19/01 13:54:23 -0500

>> .Q:  Why bother to put 64MB on an LVM?
> 
>> The root volume doesn't grow much (make it 128MB and it'll never need to
>> grow).
> 
> Sure, you could always do this.
> 
>> If you ever have a problem with LVM you'll end up with an unbootable
>> system...
> 
> Right, which is why volume managers need to be really stable and robust.
> Bottom line is that if this is the confidence level you have in your
> volume manager (whether it is LVM or EVMS), I would question putting any
> data on it.

That's like saying you don't need ABS brakes because tire makers
should make ones with really, really good traction.  If you look
at the commercial LVM systems (e.g., HP's) they get around LVM
failures by having a non-trivial boot system that allows side-
stepping LVM at boot time via the command line.  This is done on
HP by requring /dev/vg00/lvol[123] to be contiguous and starting
at offset 0 on the VG.  You can boot vmunix -lm if LVM gets toasted
and at least get the boot, swap and root volumes on line to fix
the problem.  Lacking that much intelligence in the hardware level 
of Intel boot rom's you are one helluvalot sa[fn]er to put the
root and primary swap on /dev/[hs]da[12] and go from there.  

sl
