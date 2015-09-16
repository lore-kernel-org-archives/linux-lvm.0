Message-ID: <55F9C0B5.80002@windriver.com>
Date: Wed, 16 Sep 2015 13:19:17 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <55F70C58.5010205@windriver.com> <55F8A3BB.2020408@windriver.com>
	<55F927FE.2040801@redhat.com>
In-Reply-To: <55F927FE.2040801@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 09/16/2015 02:27 AM, Zdenek Kabelac wrote:

> Sorry, but there is no 'parallel' activation from lvm2 command - as lvm2 is not
> multithreadded app  (and is quite far away from that).


Just had a weird thought.  What would happen if I ran the "vgchange -ay" 
command, and then a few seconds later ran a bunch of "lvchange -ay" commands in 
parallel?

Would that maybe let me activate non-snapshotted volumes even if the snapshotted 
volumes took a long time?

Chris
