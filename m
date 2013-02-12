Message-ID: <511A2E14.6060907@redhat.com>
Date: Tue, 12 Feb 2013 12:57:08 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <AF6C40D9-3087-4B95-97A3-8E056C2497A0@opennodecloud.com>
In-Reply-To: <AF6C40D9-3087-4B95-97A3-8E056C2497A0@opennodecloud.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Slow boot with large number of thin snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andres Toomsalu <andres@opennodecloud.com>

On 02/07/2013 01:42 PM, Andres Toomsalu wrote:
> Hi,
>
> We have experienced a situation where we are left with large number
> of thin snapshots (around 500) and snapshot removal wont work anymore
> (we suspect a lock-up situation caused by trying to remove thin
> snapshots that is still mounted - thou  its not verified yet - just a
> speculation).  The only path to recover seems to be disabling all
> thin volumes from fstab and booting into single-user mode - where
> lvremove -f usually succeeds on these thin snapshots. But LVM init
> and lvremove take a huge amount of time with large number of
> snapshots  - initial LVM activation is going on about 6-8 minutes at
> least and every lvremove takes ca 20-50 sec - depending on snapshot
> count left. After snapshots are removed thin volumes can be enabled
> again and fsck-ed and resuming normal operations.

Hello Andres, could you provide the following information:

Which version of lvm?
Is lvmetad used?

     grep lvmetad /etc/lvm/lvm.conf
     pgrep lvmetad

RHEL6.3 version of lvmetad had a serious performance issue with many 
[thin] snapshots, which should be solved in the latest release 
(lvm2-2.02.98)

Could you check the memory usage while the command is running?

Also there were a high memory usage problems fixed in the recent version.

-- Marian

>
> Althou we are not yet sure what is causing the lockup - so that
> snapshots cant be removed anymore without reboot - its also
> problematic that with large numbers of snapshots all LVM device
> operations are dead slow.  I hope this issue can be addressed somehow
> in the future.
>
> Kind regards,
>
>
>
> _______________________________________________ linux-lvm mailing
> list linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO
> at http://tldp.org/HOWTO/LVM-HOWTO/
