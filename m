References: <55F70C58.5010205@windriver.com> <55F8A3BB.2020408@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F927FE.2040801@redhat.com>
Date: Wed, 16 Sep 2015 10:27:42 +0200
MIME-Version: 1.0
In-Reply-To: <55F8A3BB.2020408@windriver.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: chris.friesen@windriver.com

Dne 16.9.2015 v 01:03 Chris Friesen napsal(a):
> On 09/14/2015 12:05 PM, Chris Friesen wrote:
>> Hi,
>>
>> I'm running a 3.10 kernel with LVM 2.02.95.
>>
>> I'm running into a problem where activating snapshots can take quite a long
>> time, roughly one minute per 25GB of delta between the snapshot and the origin
>> volume.  (See below for my test procedure.)
>
> As a side question, currently we have a script which runs "vgchange -ay <vg>",
> which will activate the VG.
>
> This script appears to activate the LVs within the VG serially rather than in
> parallel.  Does it do any processing to determine in which order to activate
> the LVs?
>
> The reason I ask is that we have an overall timeout on the activate phase,
> after which we'll put any un-activated LVs into an error state.  It would be a
> shame to try to activate a snapshotted LV first, and then timeout without
> activating any of the non-snapshotted LVs.
>


Hi

Sorry, but there is no 'parallel' activation from lvm2 command - as lvm2 is 
not multithreadded app  (and is quite far away from that).

What you can do with recent versions of lvm2 -  you could 'mark' (with 
lvchange --setskipactivation) some LVs to be skipped from normal activation.
Then you could activate such skipped LVs with  'lvchange -ay -K'.

As said lvm2 has not been designed for this case.
(btw during whole activation - your access to VG is actually limited only for 
'read-only')

Zdenek
