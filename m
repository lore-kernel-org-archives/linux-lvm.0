Subject: Re: [linux-lvm] Root on LV
References: <OFB98B66D9.BF1F5CB9-ON85256ACC.0066E63E@raleigh.ibm.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 20 Sep 2001 07:15:10 +0200
In-Reply-To: <OFB98B66D9.BF1F5CB9-ON85256ACC.0066E63E@raleigh.ibm.com>
Message-ID: <wvn13q5tpd.fsf@freeze.oslo.dnmi.no>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Steve" == Steve Pratt <slpratt@us.ibm.com> writes:

    >> .Q: Why bother to put 64MB on an LVM?  The root volume doesn't
    >> grow much (make it 128MB and it'll never need to grow).

    Steve> Sure, you could always do this.

    >> If you ever have a problem with LVM you'll end up with an
    >> unbootable system...

    Steve> Right, which is why volume managers need to be really
    Steve> stable and robust.  Bottom line is that if this is the
    Steve> confidence level you have in your volume manager (whether
    Steve> it is LVM or EVMS), I would question putting any data on
    Steve> it.

Well, I disagree with what you seem to be implying (that if you can't
trust to have the whole disk with LVM then it isn't robust). As
somebody whos been running RS6000 with AIX (a highly robust OS IMO)
for several years I can say that you can never guarantee that a new
(ie. bugfix version) doesn't screw something up. At least with Linux
one has a nice fast, neat option of booting from a non LVM root
partition to fix any problems. Try waiting 10 minutes for a tape to
boot the operating system enough times to realise that having this
(root partition) option is very useful. And yes, I know, one can in
theory have a diskette or even CD with a version of the OS and all the
tools on (although using floppy these days is becoming more difficult
due to the size of everything), but a non LVM root of 128MB on a many
GB disks seems little to pay for the possiblities it gives (for
example, remote fixing of problems without having to burn a new CD for
each new machine).

On the other hand AIX was very easy to recover when an upgrade did
screw up, just roll back the upgrade. This is one thing I miss with
Linux (Debian at least) so far.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
